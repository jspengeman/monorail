require_relative "graph"


class Problem
	# Creates a fully connected grid that is width by width
	def initialize(width, start, goal)
		@grid = Graph.new(width**2)
		@start = start
		@goal = goal
		connect(width**2)
	end

	# Simple util to look at the problem
	def display
		puts "start state: #{@start}" 
		puts "goal state: #{@goal}"
		puts "adjancy matrix: "
		@grid.display
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
			cords = @grid.node_cords(n)
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
		up = @grid.node_id(x, y - delta)
		down = @grid.node_id(x, y + delta)
		right = @grid.node_id(x + delta, y) 
		left = @grid.node_id(x - delta, y)
		return [up, down, left, right].reject {|x| x == -1}
	end

	def adjacent(s1, s2)
		@grid.adjacent(s1, s2)
	end

	# Create a fully connect grid for the problem
	def connect(node_count)
		for v1 in 0..node_count - 1
			neighbors = stations(v1)
			neighbors.each do |v2|
				if v1 != v2
					print @grid.add(v1, v2, 1)
				end
			end
		end
	end
end


