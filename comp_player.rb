require_relative 'board.rb'

class ComputerPlayer

    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end
    
    def get_position(legal_pos)
        lol = legal_pos[rand(0...legal_pos.length)]
        p "this is where comp is going " + lol.to_s + " and the mark: " + @mark_value.to_s
        return lol
    end

end