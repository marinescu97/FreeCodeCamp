#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
# Function to check if a string is a number
IS_NUMBER() {
  re='^[0-9]+$'
  if [[ $1 =~ $re ]]; then
    return 0  # It's a number
  else
    return 1  # It's not a number
  fi
}

SHOW_MESSAGE() {
  if [[ -z $1 ]]
  then
    echo -e "I could not find that element in the database."
  else
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$1")
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$1")
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$1")
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$1")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$1")
    TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$1")
    TYPE=$($PSQL "SELECT DISTINCT(type) FROM types JOIN properties USING(type_id) WHERE type_id=$TYPE_ID")

    echo "The element with atomic number $1 is $(echo $NAME | sed -r 's/^ *| *$//g') ($(echo $SYMBOL | sed -r 's/^ *| *$//g')). It's a $(echo $TYPE | sed -r 's/^ *| *$//g'), with a mass of $(echo $ATOMIC_MASS | sed -r 's/^ *| *$//g') amu. $(echo $NAME | sed -r 's/^ *| *$//g') has a melting point of $(echo $MELTING_POINT | sed -r 's/^ *| *$//g') celsius and a boiling point of $(echo $BOILING_POINT | sed -r 's/^ *| *$//g') celsius."
  fi
}

# Check if the argument is a number or a string
if [ $# -eq 1 ]; then
  input="$1"
  if IS_NUMBER "$input"; then
    ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$input")
    SHOW_MESSAGE $ELEMENT_ID
  else
    ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$input' OR name='$input'")
    SHOW_MESSAGE $ELEMENT_ID
  fi
else
  echo "Please provide an element as an argument."
fi