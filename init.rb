require_relative "problem"
require_relative "search"

print "\n\n"

print "--- problem 1 --- \n"
problem1 = Problem.new(3, 0, 8) 
agent1 = SearchAgent.new(problem1)
print "bfs node expansion: "
print agent1.solve("bfs") 
print "\n"
print "djk map: "
print agent1.solve("djk")
print "\n"
print "nearest neighbor: "
print agent1.solve("tour")
print "\n"
print "nearest neighbor w/ heuristic: "
print agent1.solve("cust")
print "\n"
print "minimum spanning tree: "
print agent1.solve("krus")

print "\n\n"

print "--- problem 2 --- \n"
problem2 = Problem.new(4, 0, 15) 
agent2 = SearchAgent.new(problem2)
print "bfs node expansion: "
print agent2.solve("bfs") 
print "\n"
print "djk map: "
print agent2.solve("djk")
print "\n"
print "nearest neighbor: "
print agent2.solve("tour")
print "\n"
print "nearest neighbor w/ heuristic: "
print agent2.solve("cust")
print "\n"
print "minimum spanning tree: "
print agent2.solve("krus")

print "\n\n"

print "--- problem 3 --- \n"
problem3 = Problem.new(5, 0, 24) 
agent3 = SearchAgent.new(problem3)
print "bfs node expansion: "
print agent3.solve("bfs") 
print "\n"
print "djk map: "
print agent3.solve("djk")
print "\n"
print "nearest neighbor: "
print agent3.solve("tour")
print "\n"
print "nearest neighbor w/ heuristic: "
print agent3.solve("cust")
print "\n"
print "minimum spanning tree: "
print agent3.solve("krus")