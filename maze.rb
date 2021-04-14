# Create a ruby script file named maze.rb which contains:
# - The maze definition listed below.
# - A ruby class named 'Pathfinder' with at least 1 method named 'perform' that will navigate the maze until the end is reached.
#    Other methods and fields may be defined on the ruby class. Use at will.
# - A calling of the ruby class/method, which uses it to navigate the maze.

# The Ruby class constructor should:
# take a maze in as its only argument

# The perform method should:
# - navigate the maze until the end is reached.
# - log out how many moves it took to get to the end.

# Make the following assumptions about the maze.
# The only 'entrance' is on the left side of the below diagram.
# 1's represent a movable space, 0's represent a blocked space. 'x' represents the exit.
# only horizontal and vertical moves are allowed.

# Only use google for Ruby syntax questions. Do not find the answer to this online. I'll know. I always know.

MAZE = [
  [0,   0,  0,  0,  0],
  [1,   1,  1,  0,  0],
  [0,   0,  1,  0,  0],
  [0,   1,  1,  0,  0],
  [0,   1,  0,  1,'x'],
  [0,   1,  1,  1,  0]
].freeze