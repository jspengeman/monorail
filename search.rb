require_relative "problem"

class SearchAgent
	def initialize(problem)
		@problem = problem
	end

	def solve(fn)
		if fn == "bfs"
			bfs()
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
end

problem = Problem.new(3, 0, 8)
agent = SearchAgent.new(problem)
print agent.solve("bfs")
