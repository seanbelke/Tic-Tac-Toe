require_relative "board.rb"
require_relative "computer.rb"

class GameController

    def initialize
        puts "\nWelcome to Terminal Tic-Tac-Toe!\n\n"

        print "Enter Player 1 Name: "
        player1 = gets.chomp
        print "Enter Player 2 Name: "
        player2 = gets.chomp

        # randomize who goes first.
        if rand(2) == 1 then
            @player1 = player1 # name of player 1
            @player2 = player2 # name of player 2
        else
            @player2 = player1
            @player1 = player2
        end

        print "\nWould you like to view the instructions? (\"yes\"/\"no\") > "
        choice = gets.chomp
        choice =~ /^(yes|Yes|YES|y|Y|no|No|NO|n|N)$/
        if $1 != nil then
            if $1[0] == "y" || $1[0] == "Y"
                puts ""
                instructions = File.open "instructions.txt", "r"
                instructions.readlines.each {|line| puts line }
                puts ""
                puts "Type \"help\" at any point to view the instructions again."
            else
                puts "\nType \"help\" at any point to view the instructions."
            end
        end

        @board = Board.new
        start_game
    end
    
    def start_game
        puts "\nInitial Game Board: "
        print @board.to_s

        print "\n#{@player1} will go first!\n\n"
        
        take_turns    
    end

    def take_turns
        num_turns = 0;
        until winner = @board.game_over
            if num_turns == 9 then
                break
            end
            valid_move = false
            until valid_move do
                if @player1 =~ /[Cc][Pp][Uu]/ then
                    print "The computer is thinking"
                    sleep 0.4
                    print "."
                    sleep 0.4
                    print "."
                    sleep 0.4
                    print "."
                    sleep 0.1
                    cpu1_move = get_cpu_move(@board, "X")
                    puts ""
                    
                    cpu1_row = cpu1_move[0]
                    cpu1_col = cpu1_move[1]
                    print "The computer has chosen to play in location (#{cpu1_row + 1}, #{cpu1_col + 1})\n"
                    @board.state[cpu1_row][cpu1_col] = "X"
                    valid_move = true
                    num_turns += 1
                else
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
                    elsif player1_move =~ /^[Hh][Ee][Ll][Pp]$/ then
                        puts ""
                        instructions = File.open "instructions.txt", "r"
                        instructions.readlines.each {|line| puts line }
                        puts ""
                        print "Press enter to continue playing "
                        gets
                        puts "\nGame Board: "
                        puts @board.to_s
                    else
                        puts "--> Invalid Move!"
                    end
                end
            end

            puts "Game Board: "
            puts @board.to_s

            if winner = @board.game_over then
                puts "#{@player1} is the winner!"
                break
            end
            
            if num_turns == 9 then
                break
            end

            valid_move = false
            
            until valid_move do 
                if @player2 == "CPU" then
                    print "The computer is thinking"
                    sleep 0.4
                    print "."
                    sleep 0.4
                    print "."
                    sleep 0.4
                    print "."
                    sleep 0.1
                    cpu2_move = get_cpu_move(@board, "O")
                    puts ""
                    
                    cpu2_row = cpu2_move[0]
                    cpu2_col = cpu2_move[1]
                    print "The computer has chosen to play in location (#{cpu2_row + 1}, #{cpu2_col + 1})\n"
                    @board.state[cpu2_row][cpu2_col] = "O"
                    valid_move = true
                    num_turns += 1
                else
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
                    elsif player2_move =~ /^[Hh][Ee][Ll][Pp]$/ then
                        puts ""
                        instructions = File.open "instructions.txt", "r"
                        instructions.readlines.each {|line| puts line }
                        puts ""
                        print "Press enter to continue playing "
                        gets
                        puts "\nGame Board: "
                        puts @board.to_s
                    else   
                        puts "--> Invalid Move!"
                    end
                end
            end

            puts "Game Board: "
            puts @board.to_s     
        end
        if winner == nil then
            puts "It's a draw!"
        elsif winner == "O" then
            puts "#{@player2} is the winner!"
        end
    end
end

GameController.new