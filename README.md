# Tic-Tac-Toe

A simple terminal game of tic-tac-toe.  The users enter the locations where they would like to place their 
markers ("X" or "O") by typing in ordered pairs on the console to indicate the row and column of the 
location.  

The game can be played by two people on the same device.  In this case, the game will prompt each person
one at a time for their moves until the game is over.  However, a single user can also play against the
computer by typing "CPU" as one of the player names.  This CPU is impossible to win against.  

The program should appropriately handle user errors such as attempting to play in a spot that has already
been taken or giving illegal coordinates (i.e., coordinates that would not fall within the boundaries of
the board).  If one of these errors occurs, the program will note the error and prompt the user to enter
their move again.

The user has the option of viewing the instructions at the beginning of the game or skipping them for 
those who already knows how the game works.  The game also provides the user with the option to 
view the instructions again during the game by typing "help" instead of entering coordinates.

### Unbeatable AI

As mentioned above, the user can type in "CPU" as one of the player names in order to play against an
unbeatable AI.  This AI makes use of the minimax decision rule when deciding what the best move is when
it is the computer's turn.  In other words, the AI assumes that the other player will make the best 
possible move at every stage, and with this assumption the AI recursively scans the remaining state 
space of the board to determine which move(s) will lead to the best possible outcome for the computer.

Of course, the fact that an unbeatable AI exists implies that a perfect player can force a draw at worst
every single time.  Since tic-tac-toe is a fairly short game, it's not difficult for a human to play a
perfect game.  See the Wikipedia link in the References section for details on how to play a perfect 
game of tic-tac-toe.

### How to run the game

Start the game by running the file tictactoe.rb in the terminal with

`ruby tictactoe.rb`

### References

Perfect Tic-Tac-Toe strategy:
https://en.wikipedia.org/wiki/Tic-tac-toe#Strategy

Minimax Algorithm for Tic-Tac-Toe:
https://gsurma.medium.com/tic-tac-toe-creating-unbeatable-ai-with-minimax-algorithm-8af9e52c1e7d
