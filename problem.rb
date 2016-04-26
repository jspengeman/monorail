require_relative "graph"


class Problem
	def initialize(dimension, start, goal)
		@graph = Graph.new(dimension)
		@start = start
		@goal = goal
		# connect(dimension)
	end

	def display
		puts "start state: #{@start}" 
		puts "goal state: #{@goal}"
		puts "adjancy matrix: "
		@graph.display
	end

	def start
		return @start
	end

	def goal
		return @goal
	end

	# Checks for neighboring train stations - O(n)
	def stations(x, y)
		delta = 1
		up = @graph.node_id(x, y - delta)
		down = @graph.node_id(x, y + delta)
		right = @graph.node_id(x + delta, y) 
		left = @graph.node_id(x - delta, y)
		return [up, down, left, right].reject {|x| x == -1}
	end

	def stations_n(n)
		cords = @graph.node_cords(n)
		if cords
			paren1 = cords.index('(')
			paren2 = cords.index(')')
			x = cords[paren1 + 1].to_i
			y = cords[paren2 - 1].to_i
			stations(x, y)
		end
	end

	# Create a fully connect grid for the problem
	def connect(dimension)
		for v1 in 0..dimension - 1
			neighbors = stations_n(v1)
			puts "v1: #{v1}"
			puts "neighbors: #{neighbors}"
			neighbors.each do |v2|
				if v1 != v2
					@graph.add(v1, v2, 1)
				end
			end
		end
	end
end

@problem = Problem.new(9, 0, 3)
@problem.display
