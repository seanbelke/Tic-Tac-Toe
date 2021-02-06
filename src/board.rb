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

board = Board.new