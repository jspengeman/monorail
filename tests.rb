load "graph.rb"
require "test/unit"

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
