class Graph
	# Object constructor with hash and matrix - O(n^2)
	def initialize(node_count)
		@adj_matrix = []
		@nmap = Hash.new(-1)
		@node_count = node_count
		for i in 0..@node_count - 1
			temp = []
			for j in 0..@node_count - 1
				temp.push(0)
			end
			@adj_matrix.push(temp)
		end

		count = 0
		width = Math.sqrt(node_count).floor
		for y in 0..width-1	
			for x in 0..width-1
				key = "(#{x}, #{y})"
				@nmap[key] = count
				count += 1
			end
		end
	end

	# Display the adj matrix rows and cols - O(n^2)
	def display
		@adj_matrix.each do |sublist|
			sublist.each do |item|
				print "%s " % item
			end
			puts "\n"
		end
		puts @nmap
	end

	# Given an x, y cordinate return the node id - O(1)
	def node_id(x, y)
		@nmap["(#{x}, #{y})"]
	end

	def node_cords(v)
		val = @nmap.select {|k, value| return k if value == v }
		if val == {}
			return nil
		end
	end

	# Checks if theres an edge between v1 & v2 - O(1)
	def adjacent(v1, v2)
		if v1 >= @node_count or v2 >= @node_count
			return false
		end
		@adj_matrix[v1][v2] != 0 \
		and @adj_matrix[v2][v1] != 0
	end

	# Returns the weight of edge between v1 & v2 - O(1)
	def weight(v1, v2)
		if v1 >= @node_count or v2 >= @node_count
			return 0
		end
		@adj_matrix[v1][v2]
	end

	# Lists all neighbors of vertex v - O(n)
	def neighbors(v) 
		if v >= @node_count
			return []
		end
		nodes = []
		for i in 0..@adj_matrix[v].size - 1
			if @adj_matrix[v][i] > 0
				nodes.push(i)
			end
		end
	end

	# Removes an edge between v1 & v2 - O(1)
	def remove(v1, v2)
		if v1 >= @node_count or v2 >= @node_count
			return false
		end
		@adj_matrix[v1][v2] = 0
		@adj_matrix[v2][v1] = 0
		return true
	end

	# Adds an edge between v1 & v2 - O(1)
	def add(v1, v2, w)
		if v1 >= @node_count or v2 >= @node_count
			return false
		end
		@adj_matrix[v1][v2] = w 
		@adj_matrix[v2][v1] = w
		return true
	end
end