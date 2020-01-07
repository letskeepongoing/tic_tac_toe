require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'comp_player.rb'

class Game

    attr_reader :players

    def initialize(n,hash_marks = {})
        
        @board = Board.new(n)
        @players = []
        hash_marks.each do |k,v|
            if v 
                @players << ComputerPlayer.new(k)
            else
                @players << HumanPlayer.new(k)
            end
        end
        @current_player = @players[0] #default player 1 
    end

    def switch_turn
        current_index = @players.index(@current_player)
        @current_player = @players[(current_index +1) % @players.length]
    end

    def play
        while @board.empty_positions
            @board.print
            p "It is player " + (@players.index(@current_player) + 1).to_s + "'s turn" 
            @board.place_mark(@current_player.get_position(@board.legal_positions),@current_player.mark_value)
            if @board.win?(@current_player.mark_value)
                print "Victory to the player " + (@players.index(@current_player) + 1).to_s
                return
            else
                switch_turn
            end
        end
        print "The game ended in a draw"
        return
    end
end