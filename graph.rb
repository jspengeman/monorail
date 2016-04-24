class Graph
	def initialize(n)
		@nmap = {}
		@dimension = n
		@adj_matrix = []
		count = 0
		for i in 0..n - 1
			temp = []
			for j in 0..n - 1
				temp.push(0)
				key = "({#{i}, #{j})"
				@nmap[key] = count
				count += 1
			end
			@adj_matrix.push(temp)
		end
	end

	# Display the adj matrix rows and cols
	def display
		@adj_matrix.each do |sublist|
			sublist.each do |item|
				print "%s " % item
			end
			puts "\n"
		end
	end

	def node_id(x, y)
		id = @nmap["({#{x}, #{y})"]
		if not id
			id = -1
		end
		return id 
	end

	# Checks if thers an edge between v1 & v2
	def adjacent(v1, v2)
		if v1 >= @dimension or v2 >= @dimension
			return false
		end
		is_adj = @adj_matrix[v1][v2] != 0 \
		and @adj_matrix[v2][v1] != 0
		return is_adj
	end

	# Returns the weight of edge between v1 & v2
	def weight(v1, v2)
		if v1 >= @dimension or v2 >= @dimension
			return 0
		end
		return @adj_matrix[v1][v2]
	end

	# Lists all neighbors of vertex v
	def neighbors(v)
		if v >= @dimension
			return []
		end
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
		if v1 >= @dimension or v2 >= @dimension
			return false
		end
		@adj_matrix[v1][v2] = 0
		@adj_matrix[v2][v1] = 0
		return true
	end

	# Adds an edge between v1 & v2
	def add(v1, v2, w)
		if v1 >= @dimension or v2 >= @dimension
			return false
		end
		@adj_matrix[v1][v2] = w 
		@adj_matrix[v2][v1] = w
		return true
	end
end