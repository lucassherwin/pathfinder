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
  [0,   0,  0,  1,'x'],
  [0,   0,  0,  0,  0]
].freeze

MAZE3 = [
  [0,   1,  1,  1,  1],
  [1,   1,  0,  0,  1],
  [0,   0,  0,  0,  1],
  [0,   0,  0,  0,  1],
  [0,   0,  0,  0,'x'],
  [0,   0,  0,  0,  0]
].freeze

MAZE4 = [
  [0,   0,  0,  0,  0],
  [1,   0,  0,  0,  0],
  [1,   0,  0,  0,  0],
  [1,   1,  1,  1,  0],
  [0,   1,  0,  1,'x'],
  [0,   1,  1,  1,  0]
].freeze

MAZE5 = [ # no solution maze
  [0,   0,  0,  0,  0],
  [1,   0,  0,  0,  0],
  [1,   0,  0,  0,  0],
  [1,   1,  0,  0,  1],
  [0,   1,  0,  1,  1],
  [0,   1,  1,  1,  0]
].freeze

class Pathfinder
  def initialize(maze)
    @maze = maze
    @moves = 0
    @found = false
  end

  def perform
    # @maze
    moves = 0 # keep track of the number of moves
    row, col = 1, 0 # start at the first 1
    # position either '0' (bad) '1' (movable space) or 'x' (exit)
    curr = @maze[row][col] # current value
    while curr != 'x' do
      # check down
      if row+1 <= @maze[row].length and @maze[row+1][col] == 1 and @maze[row][col+1] != 'x'
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

  def traverse(row, col)
    if @maze[row][col] == 'x' # we found the exit
      @found = true
      puts @moves
    elsif @maze[row][col] == 1 # valid path
      @moves += 1 # only keep track of valid moves
      @maze[row][col] = 2 # to mark that we already visited this point
      if row < @maze.length - 1
        traverse(row+1, col)
      end
      if col < @maze[row].length - 1
        traverse(row, col+1)
      end
      if row > 0
        traverse(row-1, col)
      end
      if col > 0
        traverse(row, col-1)
      end
    end
  end

  def perform_recursive
    traverse(1,0) # hard coded because you must start at a valid point
    puts 'no solution' unless @found
  end
end

# Pathfinder.new(MAZE).perform
Pathfinder.new(MAZE1).perform_recursive # 11
Pathfinder.new(MAZE2).perform_recursive # 7
Pathfinder.new(MAZE3).perform_recursive # 9
Pathfinder.new(MAZE4).perform_recursive # two solutions one is 9 moves one is 7 -- only finds 9
Pathfinder.new(MAZE5).perform_recursive # no solution

# TODO:
# 8. dont hard code starting point

# DONE:
# 1. use recursion instead of a while loop
# 2. use an initalizer method and pass in the maze on the "new" call
# 3. set a class instance variable equal to the passed in maze. Pass in 0 arguments to the perform method
# 4. create logic such that any 2d array maze will either find x and log out the moves or log out "no solution"
# 5. get rid of closure - move traverse outside of perform_recursive
# 6. remvoe () after .length
# 7. update if !@found to be puts "no solution" unless @found