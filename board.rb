class Board
    
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, "_") }
        @legal = []
        (0...@grid.length).each do |idx1|
            (0...@grid.length).each do |idx2|
                @legal << [idx1,idx2] 
            end
        end
    
    end

    def valid?(position)
        first = position[0]
        second = position[1]
        if first < 0 || second < 0
            return false
        end 
        return false if (first >= @grid.length || second >= @grid.length)
        return true
    end

    def legal_positions
        @legal 
    end

    def empty?(position) #return false if not equal to the mark
        if !valid?(position)
            raise 'This is not a valid position'  
        else
            return @grid[position[0]][position[1]] == '_'
        end
    end

    def place_mark(position, mark)
        if !valid?(position)
            raise 'This is not a valid position'  
        elsif !empty?(position)
            raise 'This is not a valid position'  
        else
            @grid[position[0]][position[1]] = mark
            @legal.delete(position)
        end
    end

    def print
        @grid.each do |row|
            p row
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            if row.count(mark) == row.length
                return true
            end
        end
        return false
    end

    def win_col?(mark)
        @grid.transpose.each do |row|
            if row.count(mark) == row.length
                return true
            end
        end
        return false
    end

    def win_diagonal?(mark)
        first_diag = []
        (0...@grid.length).each do |idx|
            first_diag << @grid[idx][idx]
        end
        return true if first_diag.count(mark) == @grid.length
        second_diag = []
        (0...@grid.length).each do |idx2|
            second_diag << @grid[idx2][@grid.length-1-idx2]
        end
        return true if second_diag.count(mark) == @grid.length
        return false
    end

    def win?(mark)
        if (win_col?(mark) || win_diagonal?(mark) || win_row?(mark))
            return true
        else
            return false
        end
    end

    def empty_positions #return true if there are empty positions
        @grid.each do |row|
            row.each do |ele|
                if ele == '_'
                    return true
                end
            end
        end
        return false
    end

end

