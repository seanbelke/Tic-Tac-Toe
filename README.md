# Tic-Tac-Toe

A simple terminal game of tic-tac-toe.  The users enter the locations where they would like to place their 
markers ("X" or "O") by typing in ordered pairs on the console to indicate the row and column of the 
location.  

As of the most recent commit, the program will appropriately handle user errors such as attempting to play
in a spot that has already been taken or giving illegal coordinates (i.e., that would not fall within the 
boundaries of of the board).  If one of these errors occurs, the program will note the error and prompt the 
user to enter their move again.

The most recent commit also randomly chooses a player to go first, as well as providing the users with the
option to view the instructions again during the game by typing "help" instead of entering coordinates.

One feature yet to be added is an unbeatable AI that the user can play against.

### How to run the game

Start the game by running the file gamecontroller.rb in the terminal with

`ruby gamecontroller.rb`
