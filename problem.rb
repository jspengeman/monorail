load "graph.rb"

class Problem
	def initialize(dimension, start, goal, edges)
		@graph = Graph.new(dimension)
		@start = start
		@goal = goal
		edges.each do |edge|
			@graph.add(edge[0], edge[1], 1)
		end
	end

	def display()
		puts "start state: #{@start}" 
		puts "goal state: #{@goal}"
		puts "adjancy matrix: "
		@graph.display
	end

	# Checks for adjacent stations
	def adjacent
	end

	# Given a solution name run that function
	def solve(fn)
	end

	def a_star
	end

	def kruskal
	end
end

problem = Problem.new(3, 0, 8, [[0, 1], [1, 2]])
problem.display