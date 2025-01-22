#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#CLEAR DATA FROM 2 TABLES EVERY SCRIPT EXECUTION
echo $($PSQL "TRUNCATE teams, games;")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  #INSERT TEAM NAMES IN TEAM TABLE BASED FROM WINNERS
  if [[ $WINNER != "winner" ]]
    then
      #get team_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name ='$WINNER'")
      #if not found
      if [[ -z $WINNER_ID ]]
        then
        #insert winner distinct team
        INSERT_WINNERS=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
        if [[ $INSERT_WINNERS == "INSERT 0 1" ]]
          then
            echo Inserted into teams, $WINNER
        fi
      fi
  fi

  #INSERT TEAM NAMES IN TEAM TABLE BASED FROM OPPONENTS
  if [[ $OPPONENT != "opponent" ]]
    then
      #get team_id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name ='$OPPONENT'")
      #if not found
      if [[ -z $OPPONENT_ID ]]
        then
        #insert distinct opponent team
        INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
        if [[ $INSERT_OPPONENT == "INSERT 0 1" ]]
          then
            echo Inserted into teams, $OPPONENT
        fi
      fi
  fi

  #INSERT GAMES DATA IN GAMES TABLE
  if [[ $YEAR != "year" ]]
    then
      #get winner id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name ='$WINNER'")
      
      #get opponent id
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name ='$OPPONENT'")
      
        #insert games data
        INSERT_GAME_DATA=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR','$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
        if [[ $INSERT_GAME_DATA == "INSERT 0 1" ]]
          then
            echo Inserted into games, $YEAR $ROUND $WINNER_ID $OPPONENT_ID $WINNER_GOALS $OPPONENT_GOALS
        fi

  fi
done


