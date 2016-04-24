load "graph.rb"


class Problem
	def initialize(dimension, start, goal, edges)
		@graph = Graph.new(dimension)
		@start = start
		@goal = goal
		edges.each do |edge|
			@graph.add(edge[0], edge[1], 1)
		end
	end

	def display()
		puts "start state: #{@start}" 
		puts "goal state: #{@goal}"
		puts "adjancy matrix: "
		@graph.display
	end

	# Checks for neighboring train stations
	def neighbors(x, y)
		delta = 1
		up = @graph.node_id(x, y - delta)
		down = @graph.node_id(x, y + delta)
		right = @graph.node_id(x + delta, y) 
		left = @graph.node_id(x - delta, y)
		return [up, down, left, right].reject {|x| x == -1}
	end

	def add
	end

	def remove
	end

	def solve(fn)
	end
end

# problem = Problem.new(3, 0, 8, [[0, 1], [1, 2]])
# problem.display

# puts problem.neighbors(1, 1)