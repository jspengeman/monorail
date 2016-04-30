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
		path = []
		explored = []
		frontier = Queue.new

		frontier.push(@problem.start)
		while not frontier.empty?
			current = frontier.pop

			if @problem.is_goal(current)
				return path
			end

			if not explored.include? current
				explored.push(current)

				@problem.succesors(current).each do |child|
					if not explored.include? child
						frontier.push(child)
						path.push(child)
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
		parentMap = Hash.new(-1)
		for curr in 0..@problem.size - 1
			@problem.succesors(curr).each do |child|
				parentMap[child] = curr
			end 
		end

		path = [@problem.start]
		node = @problem.start
		while node != -1
			node = parentMap[node]
			path.push(node)
			if node == @problem.goal
				return path
			end
		end
	end
end

problem = Problem.new(3, 0, 8)
agent = SearchAgent.new(problem)
# print agent.solve("bfs")
# print agent.solve("djk")
print agent.solve("man")
