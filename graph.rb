class Graph
	def initialize(x, y)
		@adj_matrix = []
		for i in 1..x
			temp = []
			for j in 1..y
				temp.push(0)
			end
			@adj_matrix.push(temp)
		end
	end

	def display
		@adj_matrix.each do |sublist|
			sublist.each do |item|
				print "%s " % item
			end
			puts "\n"
		end
	end

	def display_nice
		for i in 0..@adj_matrix.size - 1
			neighbors = neighbors(i)
			for j in 0..@adj_matrix[i].size - 1
			
			end
		end
	end

	# Checks if thers an edge between v1 & v2
	def adjacent(v1, v2)
		return false
	end

	# Returns the value 
	def weight(v1, v2)
		return @adj_matrix[v1][v2]
	end

	# Lists all neighbors of vertex v
	def neighbors(v)
		nodes = []
		for i in 0..@adj_matrix[v].size - 1
			if @adj_matrix[v][i] > 0
				nodes.push(i)
			end
		end
		return nodes
	end

	# Removes an edge between v1 & v2
	def remove(v1, v2)
		@adj_matrix[v1][v2] = 0
	end

	# Adds an edge between v1 & v2
	def add(v1, v2, w)
		@adj_matrix[v1][v2] = w 
	end
end

graph = Graph.new(4, 4)
graph.add(0, 1, 10)
graph.add(0, 2, 2)
graph.add(0, 3, 3)
graph.display_nice

