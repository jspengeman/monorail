require 'algorithms'
include Containers
require_relative "problem"

class SearchAgent
	def initialize(problem)
		@problem = problem
	end

	def solve(fn)
		if fn == "bfs"
			bfs()
		elsif fn == "djk"
			dijkstra()
		elsif fn == "tour"
			create_tour()
		elsif fn == "cust"
			custom_tour()
		end
	end

	def bfs()
		explored = []
		frontier = Queue.new

		frontier.push(@problem.start)
		while not frontier.empty?
			current = frontier.pop

			if @problem.is_goal(current)
				return explored
			end

			if not explored.include? current
				explored.push(current)

				@problem.succesors(current).each do |child|
					if not explored.include? child
						frontier.push(child)
					end
				end
			end
		end
	end

	def dijkstra()
		path = Hash.new(-1)
		explored = []
		frontier = PriorityQueue.new

		frontier.push(@problem.start, 0)

		while not frontier.empty?
			current = frontier.pop()
			if not explored.include? current
				explored.push(current)

				if @problem.is_goal(current)
					return path
				end

				@problem.succesors(current).each do |child|
					frontier.push(child, 0)
					path[current] = child
				end
			end
		end
	end

	# Grabs the first neighbors 
	def create_tour()
		chd = Hash.new(-1)
		for i in 0..@problem.size - 1
			chd[i] = @problem.succesors(i)
		end

		vertices = [*1..@problem.size]
		vertices.delete(@problem.start)
		output = [@problem.start]
		while vertices.any?
			u = output.last
			children = chd[u]
			v = children.first

			if not vertices.include? v
				v = children[1]
			end
			chd.each do |key, value|
				chd[key].delete(v)	
			end

			if v == nil
				return output
			end
			vertices.delete(v)
			output.push(v)
		end	
		return output
	end

	# Grabs the neighbors that is closet to goal
	def custom_tour()
		children = Hash.new(-1)
		for i in 0..@problem.size - 1
			children[i] = PriorityQueue.new()

			@problem.succesors(i).each do |node|
				children[i].push(node, h(node))
			end
		end
		
		vertices = [*1..@problem.size]
		vertices.delete(@problem.start)
		output = [@problem.start]
		while vertices.any?
			u = output.last
			chd = children[u]
			v = chd.pop()

			if not vertices.include? v
				v = chd.pop()
			end

			h_val = 0
			if v != nil
				h_val = h(v)
			end

			children.each do |key, value|
				children[key].delete(h_val)	
			end

			if v == nil
				return output
			end
			vertices.delete(v)
			output.push(v)
		end	
		return output		
	end

	def a_star()
	end

	def h(n)
		goal = @problem.goal
		n_str = @problem.node_cords(n)
		goal_str = @problem.node_cords(goal)

		paren1 = n_str.index('(')
		paren2 = n_str.index(')')
		nx = n_str[paren1 + 1].to_i
		ny = n_str[paren2 - 1].to_i

		paren1 = goal_str.index('(')
		paren2 = goal_str.index(')')
		gx = goal_str[paren1 + 1].to_i
		gy = goal_str[paren2 - 1].to_i

		return ((nx - gx)**2 + (ny - gy)**2)
	end
end

problem = Problem.new(3, 0, 8) 
agent = SearchAgent.new(problem)
# print agent.solve("bfs")
# print agent.solve("djk")
print agent.solve("tour")
print agent.solve("cust")