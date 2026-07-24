#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
$PSQL "TRUNCATE TABLE teams, games RESTART IDENTITY CASCADE"

insert_team_and_get_id(){
  
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$1'")
  if [[ -z $TEAM_ID ]]
  then
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES ('$1')")
    if [[ $INSERT_TEAM_RESULT = "INSERT 0 1" ]]
    then
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$1'")
    fi
  fi
  echo $TEAM_ID

}

#read the csv file
cat games.csv | 
while IFS="," read YEAR ROUND WINNER OPPONENT W_GOALS O_GOALS
do
  if [[ $YEAR != year ]]
  then
    #Insert teams and get id's
    W_ID=$(insert_team_and_get_id "$WINNER")
    O_ID=$(insert_team_and_get_id "$OPPONENT")
    #Insert game
    $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
         VALUES ($YEAR, '$ROUND', $W_ID, $O_ID, $W_GOALS, $O_GOALS)"
  fi
done
