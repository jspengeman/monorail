require_relative "graph"


class Problem
	# Creates a fully connected grid that is width by width
	def initialize(width, start, goal)
		@graph = Graph.new(width)
		@start = start
		@goal = goal
		connect(width**2)
	end

	# Simple util to look at the problem
	def display
		puts "start state: #{@start}" 
		puts "goal state: #{@goal}"
		puts "adjancy matrix: "
		@graph.display
	end

	# Simple getter for start state
	def start
		return @start
	end

	# Simple getter for goal state
	def goal
		return @goal
	end

	# Checks for neighboring train stations - O(n)
	def stations(*args)
		# If two args then x, y cords
		# Other wise input is node id
		if args.size > 1
			x = args[0]
			y = args[1]
		else
			n = args[0]
			cords = @graph.node_cords(n)
			if cords
				paren1 = cords.index('(')
				paren2 = cords.index(')')
				x = cords[paren1 + 1].to_i
				y = cords[paren2 - 1].to_i
			else
				return []
			end
		end
		delta = 1
		up = @graph.node_id(x, y - delta)
		down = @graph.node_id(x, y + delta)
		right = @graph.node_id(x + delta, y) 
		left = @graph.node_id(x - delta, y)
		return [up, down, left, right].reject {|x| x == -1}
	end

	# Create a fully connect grid for the problem
	def connect(dimension)
		for v1 in 0..dimension - 1
			neighbors = stations(v1)
			neighbors.each do |v2|
				if v1 != v2
					@graph.add(v1, v2, 1)
				end
			end
		end
	end
end


