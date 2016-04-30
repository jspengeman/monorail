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
		elsif fn == "man"
			manual()
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

	def manual()
		chd = Hash.new(-1)
		for i in 0..@problem.size - 1
			chd[i] = @problem.succesors(i)
		end

		vertices = [*1..@problem.size]
		output = [0]
		while vertices.any?
			# print vertices
			# print output

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
end

problem = Problem.new(3, 0, 8)
agent = SearchAgent.new(problem)
# print agent.solve("bfs")
# print agent.solve("djk")
print agent.solve("man")
