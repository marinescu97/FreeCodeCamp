#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

NUMBER=$(( $RANDOM % 1000 + 1 ))

echo -e "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

if [[ -z $USER_ID ]]
then
  echo "Welcome, $(echo $USERNAME | sed -r 's/^ *| *$//g')! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id=$USER_ID")

  echo "Welcome back, $(echo $USERNAME | sed -r 's/^ *| *$//g')! You have played $(echo $GAMES_PLAYED | sed -r 's/^ *| *$//g') games, and your best game took $(echo $BEST_GAME | sed -r 's/^ *| *$//g') guesses."
fi

  echo "Guess the secret number between 1 and 1000:"
  read NUMBER_GUESSING

  GUESS_COUNT=0;

until [[ $NUMBER_GUESSING == $NUMBER ]]
do
  if [[ ! $NUMBER_GUESSING =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read NUMBER_GUESSING
    (( GUESS_COUNT++ ))
  else
    if [[ $NUMBER_GUESSING < $NUMBER ]]
    then
      echo "It's higher than that, guess again:"
      read NUMBER_GUESSING
      (( GUESS_COUNT++ ))
    elif (( $NUMBER_GUESSING > $NUMBER ))
    then
      echo "It's lower than that, guess again:"
      read NUMBER_GUESSING
      (( GUESS_COUNT++ ))
    fi
  fi
done

(( GUESS_COUNT++ ))

 echo "You guessed it in ${GUESS_COUNT} tries. The secret number was ${NUMBER}. Nice job!"

 if [[ -z $USER_ID ]]
 then
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 1, $GUESS_COUNT)")
 else
  if [[ $BEST_GAME < $GUESS_COUNT ]]
  then
    GUESS_COUNT=$BEST_GAME
  fi
  UPDATE_USER_RESULT=$($PSQL "UPDATE users SET games_played=games_played+1, best_game=$GUESS_COUNT WHERE user_id=$USER_ID")
 fi