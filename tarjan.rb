# Was running out of time but I wanted to 
# Experiment with connected components
# This does find the biggest cycle in the
# 5 by 5 problem given to it but it doesn't
# take in account any start or goal states.
# This is more of a proof of concept that
# with a custom implementation some sort
# of algorithm that finds the largest
# strongly connected component would work.

require_relative "problem"
require 'tsort'

class Hash
  include TSort
  alias tsort_each_node each_key
  def tsort_each_child(node, &block)
    fetch(node).each(&block)
  end
end

input = Hash.new
problem = Problem.new(5, 0, 8) 
	
# Generate a map of each node to its succesors
for i in 0..problem.size-1
	input[i] = problem.succesors(i)
end

output = input.strongly_connected_components
print output
