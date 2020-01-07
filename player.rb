class HumanPlayer

    attr_reader :mark_value

    def initialize(mark_value,name)
        @mark_value = mark_value
        @name = name
    end

    def get_position(legal_positions)
        p "please enter a position"
        row_col = gets.chomp
        position = row_col.split(" ").map(&:to_i)

        while !legal_positions.include?(position)
            p"You didn't enter correct number of numbers"
            p "please enter a new position"
            row_col = gets.chomp
            position = row_col.split(" ").map(&:to_i)  
        end
        return position 
    end
end

