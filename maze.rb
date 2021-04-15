MAZE1 = [
  [0,   0,  0,  0,  0],
  [1,   1,  1,  0,  0],
  [0,   0,  1,  0,  0],
  [0,   1,  1,  0,  0],
  [0,   1,  0,  1,'x'],
  [0,   1,  1,  1,  0]
].freeze

MAZE2 = [
  [0,   0,  0,  0,  0],
  [1,   1,  0,  0,  0],
  [0,   1,  0,  0,  0],
  [0,   1,  1,  1,  0],
  [0,   0,  0,  1,  0],
  [0,   0,  0,  0,  0]
].freeze

MAZE3 = [
  [0,   0,  0,  0,  0],
  [1,   1,  1,  0,  0],
  [0,   0,  1,  0,  0],
  [0,   1,  1,  0,  0],
  [0,   1,  0,  1,'x'],
  [0,   1,  1,  1,  0]
].freeze

MAZE4 = [
  [0,   0,  0,  0,  0],
  [1,   1,  1,  0,  0],
  [0,   0,  1,  0,  0],
  [0,   1,  1,  0,  0],
  [0,   1,  0,  1,'x'],
  [0,   1,  1,  1,  0]
].freeze


class Pathfinder
  def initialize(maze)
    @maze = maze
    @moves = 0
  end

  def perform
    # @maze
    moves = 0 # keep track of the number of moves
    row, col = 1, 0 # start at the first 1
    # position either '0' (bad) '1' (movable space) or 'x' (exit)
    curr = @maze[row][col] # current value
    while curr != 'x' do
      # check down
      if row+1 <= @maze[row].length() and @maze[row+1][col] == 1 and @maze[row][col+1] != 'x'
        moves += 1
        row += 1
        last = 'down'
        curr = @maze[row][col] # move down
      # check right
      elsif @maze[row][col+1] == 1 || @maze[row][col+1] == 'x'
        # move right
        moves += 1
        col += 1
        last = 'right'
        curr = @maze[row][col]
      # check left
      elsif @maze[row][col-1] == 1 && last != 'right'
        # move left
        moves += 1
        col -= 1
        last = 'left'
        curr = @maze[row][col]
      # check up
      elsif @maze[row-1][col] == 1
        # move up
        moves += 1
        row -= 1
        last = 'up'
        curr = @maze[row][col]
      end
    end
    puts moves
  end

  def perform_recursive

    def traverse(row, col)
      # puts @maze[row][col]
      if @maze[row][col] == 'x' # we found the exit
        puts @moves
      # elsif @moves > @maze.length() * @maze[0].length()
      #   puts 'No solution'
      elsif @maze[row][col] == 1 # valid path
        @maze[row][col] = 2 # to mark that we already visited this point
        if row < @maze.length() - 1
          @moves += 1
          traverse(row+1, col)
        end
        if col < @maze[row].length() - 1
          @moves += 1
          traverse(row, col+1)
        end
        if row > 0
          @moves += 1
          traverse(row-1, col)
        end
        if col > 0
          @moves += 1
          traverse(row, col-1)
        end
      end
    end

    traverse(1,0)
  end
end

# Pathfinder.new(MAZE).perform
Pathfinder.new(MAZE1).perform_recursive
# Pathfinder.new(MAZE2).perform_recursive



# TODO:
# 1. use recursion instead of a while loop
# 4. create logic such that any 2d array maze will either find x and log out the moves or log out "no solution"

# DONE:
# 2. use an initalizer method and pass in the maze on the "new" call
# 3. set a class instance variable equal to the passed in maze. Pass in 0 arguments to the perform method