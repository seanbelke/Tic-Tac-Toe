require_relative "board.rb"

class GameController

    def initialize
        puts "\nWelcome to Terminal Tic-Tac-Toe!\n\n"
        print "Would you like to view the instructions? (\"yes\"/\"no\") > "
        choice = gets.chomp
        choice =~ /^(yes|Yes|YES|y|Y|no|No|NO|n|N)$/
        if $1 != nil then
            if $1[0] == "y" || $1[0] == "Y"
                puts ""
                instructions = File.open "instructions.txt", "r"
                instructions.readlines.each {|line| puts line }
                puts ""
            end
        end

        print "Enter Player 1 Name: "
        player1 = gets.chomp
        print "Enter Player 2 Name: "
        player2 = gets.chomp

        @player1 = player1 # name of player 1
        @player2 = player2 # name of player 2
        @board = Board.new
        start_game
    end
    
    def start_game
        puts "\nInitial Game Board: "
        print @board.to_s
        
        take_turns    
    end

    def take_turns
        num_turns = 0;
        until winner = game_over
            if num_turns == 9 then
                break
            end
            valid_move = false
            until valid_move do
                print "#{@player1}, enter your move: "
                player1_move = gets.chomp
                player1_move =~ /^ *\(([1-3]), *([1-3])\) *$/

                if $1 != nil then
                    player1_row = $1.to_i - 1
                    player1_col = $2.to_i - 1
                    
                    if @board.state[player1_row][player1_col] == " " then
                        @board.state[player1_row][player1_col] = "X"
                        num_turns += 1
                        valid_move = true
                    else
                        puts "--> Invalid Move!"
                    end
                else
                    puts "--> Invalid Move!"
                end
            end

            puts "Game Board: "
            puts @board.to_s

            if winner = game_over then
                puts "#{@player1} is the winner!"
                break
            end
            
            if num_turns == 9 then
                break
            end

            valid_move = false
            
            until valid_move do 
                print "#{@player2}, enter your move: "
                player2_move = gets.chomp
                player2_move =~ /^ *\(([1-3]), *([1-3])\) *$/

                if $1 != nil then
                    player2_row = $1.to_i - 1
                    player2_col = $2.to_i - 1
                    if @board.state[player2_row][player2_col] == " " then
                        @board.state[player2_row][player2_col] = "O"
                        num_turns += 1
                        valid_move = true
                    else
                        puts "--> Invalid Move!"
                    end
                else   
                    puts "--> Invalid Move!"
                end
            end

            puts "Game Board: "
            puts @board           
        end
        if winner == nil then
            puts "It's a draw!"
        elsif winner == "O" then
            puts "#{@player2} is the winner!"
        end
    end

    def game_over
        [0, 1, 2].each do |row|
            if @board.state[row][0] != " " and
                @board.state[row][0] == @board.state[row][1] and
                @board.state[row][1] == @board.state[row][2] then
                return @board.state[row][0]
            end
        end


        [0, 1, 2].each do |col|
            if @board.state[0][col] != " " and
                @board.state[0][col] == @board.state[1][col] and
                @board.state[1][col] == @board.state[2][col] then
                return @board.state[0][col]
            end
        end

        if @board.state[0][0] != " " and
            @board.state[0][0] == @board.state[1][1] and
            @board.state[1][1] == @board.state[2][2] then
            return @board.state[1][1]
        end

        if @board.state[0][2] != " " and
            @board.state[0][2] == @board.state[1][1] and
            @board.state[1][1] == @board.state[2][0] then
            return @board.state[1][1]
        end

        nil # no winner yet
    end
end

GameController.new