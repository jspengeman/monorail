require_relative "problem"

class SearchAgent
	def initialize(p)
		@problem = Problem.new(3, 0, 8, [[0, 1], [1, 2]])
		puts "hello"
	end
end


search = SearchAgent.new(1)