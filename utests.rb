require "test/unit"
require_relative "graph"
require_relative "problem"


class GraphTest < Test::Unit::TestCase
	def test
		@graph = Graph.new(5)
		check_add()
		check_edges()
		check_weight()
		check_neighbors()
		check_remove()
	end

	def check_add
		assert_equal(true, @graph.add(0, 1, 1))
		assert_equal(true, @graph.add(0, 2, 5))
		assert_equal(true, @graph.add(1, 4, 2))
		assert_equal(false, @graph.add(5, 4, 10))
	end

	def check_remove
		assert_equal(true, @graph.remove(0, 1))
		assert_equal(true, @graph.remove(0, 2))
		assert_equal(true, @graph.remove(1, 4))
		assert_equal(false, @graph.remove(5, 4))
	end

	def check_neighbors
		assert_equal(true, @graph.neighbors(0).include?(1))
		assert_equal(true, @graph.neighbors(0).include?(2))
		assert_equal(true, @graph.neighbors(1).include?(4))
		assert_equal(false, @graph.neighbors(5).include?(4))
	end

	def check_edges
		assert_equal(true, @graph.adjacent(0, 1))
		assert_equal(true, @graph.adjacent(0, 2))
		assert_equal(true, @graph.adjacent(1, 4))
		assert_equal(false, @graph.adjacent(5, 4))
	end

	def check_weight
		assert_equal(1, @graph.weight(0, 1))
		assert_equal(5, @graph.weight(0, 2))
		assert_equal(2, @graph.weight(1, 4))
		assert_equal(0, @graph.weight(5, 4))
	end
end


class GraphIDTest < Test::Unit::TestCase
	def test
		@graph = Graph.new(9)
		check_nmap()
		check_cord()
	end

	def check_nmap
		assert_equal(0, @graph.node_id(0, 0))
		assert_equal(2, @graph.node_id(2, 0))
		assert_equal(-1, @graph.node_id(4, 4))
		assert_equal(8, @graph.node_id(2, 2))
		assert_equal(4, @graph.node_id(1, 1))
	end

	def check_cord
		assert_equal("(0, 0)", @graph.node_cords(0))
		assert_equal("(1, 0)", @graph.node_cords(1))
		assert_equal(nil, @graph.node_cords(10))
	end
end


class ProblemTest < Test::Unit::TestCase
	def test
		@problem = Problem.new(3, 0, 8)
		check_adjacent()
		check_connect()
		check_stations_cords()
		check_stations_id()
		check_start()
		check_goal()
	end

	def check_adjacent
		assert_equal(true, @problem.adjacent(0, 3))
	end

	def check_stations_cords
		assert_equal([5, 7], @problem.stations(2, 2))
		assert_equal([1, 7, 3, 5], @problem.stations(1, 1))
		assert_equal([3, 1], @problem.stations(0, 0))
		assert_equal([5, 1], @problem.stations(2, 0))
		assert_equal([], @problem.stations(3, 3))

	end

	def check_stations_id
		assert_equal([5, 7], @problem.stations(8))
		assert_equal([1, 7, 3, 5], @problem.stations(4))
		assert_equal([3, 1], @problem.stations(0))
		assert_equal([5, 1], @problem.stations(2))
		assert_equal([], @problem.stations(9))
	end

	def check_start
		assert_equal(0, @problem.start)
	end

	def check_goal
		assert_equal(8, @problem.goal)
	end

	def check_connect
		for v1 in 0..8
			neighbors = @problem.stations(v1)
			neighbors.each do |v2|
				if v1 != v2
					assert_equal(true, @problem.adjacent(v1, v2))
				end
			end
		end
	end
end


class SearchAgentTest < Test::Unit::TestCase
	def test
		@problem = Problem.new(3, 0, 8)
		check_solve()
		check_problem()
		check_heuristic()
		check_path_cost()
	end

	def check_solve
	end

	def check_problem
	end

	def check_heuristic
	end

	def check_path_cost
	end
end



