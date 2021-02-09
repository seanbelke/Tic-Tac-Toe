class Board
    attr_accessor :state

    def initialize
        @state = []
        3.times do
            @state.push([])
        end
        [0, 1, 2].each do |i|
            3.times do
                @state[i].push(" ")
            end
        end
    end

    def is_empty
        [0, 1, 2].each do |row|
            [0, 1, 2].each do |col|
                if @state[row][col] != " " then
                    return false
                end
            end
        end
        true
    end

    def is_full
        [0, 1, 2].each do |row|
            [0, 1, 2].each do |col|
                if @state[row][col] == " " then
                    return false
                end
            end
        end
        true
    end

    def get_copy
        copy = Board.new 
        [0, 1, 2].each do |row|
            [0, 1, 2].each do |col|
                copy.state[row][col] = self.state[row][col]
            end
        end
        copy
    end

    def game_over
        [0, 1, 2].each do |row|
            if @state[row][0] != " " and
                @state[row][0] == @state[row][1] and
                @state[row][1] == @state[row][2] then
                return @state[row][0]
            end
        end


        [0, 1, 2].each do |col|
            if @state[0][col] != " " and
                @state[0][col] == @state[1][col] and
                @state[1][col] == @state[2][col] then
                return @state[0][col]
            end
        end

        if @state[0][0] != " " and
            @state[0][0] == @state[1][1] and
            @state[1][1] == @state[2][2] then
            return @state[1][1]
        end

        if @state[0][2] != " " and
            @state[0][2] == @state[1][1] and
            @state[1][1] == @state[2][0] then
            return @state[1][1]
        end

        nil # no winner yet
    end

    def to_s
        string = "+"
        3.times do
            string << "-------+"
        end
        string << "\n"

        [0, 1, 2].each do |row|
            # row of spaces and bars
            string << "|"
            3.times do
                string << "       |"
            end
            string << "\n"

            # row with marks on it
            string << "|"
            [0, 1, 2].each do |col|
                string << "   "
                string << @state[row][col]
                string << "   |"
            end
            string << "\n"
            
            # another row of spaces and bars
            string << "|"
            3.times do
                string << "       |"
            end
            string << "\n"

            # row of pluses and minuses
            string << "+"
            3.times do
                string << "-------+"
            end
            string << "\n"
        end
        string
    end
end