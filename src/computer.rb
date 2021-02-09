require_relative "board.rb"

# This method will return an array of two elements, where the first
# is the row in which it wishes to play (0-2) and the second is the
# column in which it wishes to play (0-2).  

def get_cpu_move(board, player)
    # for the first move, the cpu will pick one of the four corners randomly.
    if board.is_empty then
        if rand(2) == 1 then
            row = 0
        else 
            row = 2
        end

        if rand(2) == 1 then
            col = 0
        else
            col = 2
        end
        return row, col 
    else
        # otherwise, it will find the best move to play that eliminates
        # its chances of losing
        return minimax(board, player)[1]
    end
end

private

# This function will recursively examine the state of the board
# passed in from the perspective of the player passed in as the
# second argument. It will return an array of two elements.  
# The first is the "score" of the current board that is being
# examined, which is necessary due to the recursive calls.
# The second is an array of two elements that denotes the row 
# and column of the best move to make, which will be ultimately
# used when deciding what move the AI will make.
def minimax(board, player) 

    # First check to see if the game has been won.  If it has, then
    # return 1 if the current player is the winner, because this state
    # has a minimax score of 1 for the player, and return -1 if the
    # other player is the winner, because this state has a minimax
    # score of -1 for the player (since the opponent wins)
    if board.game_over then
        return [-1, [-1, -1]]
    end

    move = [-1, -1]
    score = -2 # lower than the lowest possible score

    [0, 1, 2].each do |row|
        [0, 1, 2].each do |col| # all possible locations
            if board.state[row][col] == " " then  # only valid moves
                new_board_state = board.get_copy
                new_board_state.state[row][col] = player

                # negate the opponent's score.
                score_for_this_move = -1 * (minimax(new_board_state, get_opposite_player(player))[0])

                if score_for_this_move > score then 

                    score = score_for_this_move

                    move[0] = row
                    move[1] = col
                end
            end
        end
    end

    # no possible moves, it's a draw
    if move[0] == -1 then
        return [0, move]
    end
    
    return [score, move]
end

def get_opposite_player(player)
    if player == "X" then
        return "O"
    else
        return "X"
    end
end