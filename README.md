# Monorail

#### Project Post Mortem

This problem evolved into something more complex then I anticapted and with the alotted time I was not able to complete it but I would like to revisit it. I learned about classical search algorithms, traveling salesman problem, finding cycles as well as strongly connected components. It would be fair to say I feel as if I learned a lot.

#### Architecture

The project is acrhitectured similarly to the Pacman problems we worked on earlier this semester. In `graph.rb` you can find my Graph class that has some custom functionality that makes it less modular then it should be but there is technically nothing stopping someone from using it. The next component which I implemented can be found in `problem.rb` the Problem class is similar to the Problem objects we worked with in the Pacman projects. In the problem clas you have functionality to get all succesors of any invidual station node as well as to get its cordiantes if needed. It also generates the connected grid using a dimension as input. The last component is the Agent which can be found in `search.rb`. This is the SearchAgent class which implements a variety of things like breath first search, Dijkstra's algorithm, Kruskal's algorithm and the nearest neighbor algorithm.

#### Local Set Up

First you will need to make sure to have a ruby distribution on your computer. Next install the single gem that was needed for priority queues. This can be done using "gem install" while in the monorail (root of the project) directory. Since `search.rb` is the root of the project running that file is a good entry point. You can define your own problem at the bottom of the file.

#### Problem Retrospective

Initially when I first started this problem I thought that it was a simple classical search problem. I was mistaken thinking that was the case; I later found out about the traveling salesman problem. I then thought my problem fell under that category although certain intricacies made it not quite fall under that category as well. Lastly, I arrived at the topic of finding cycles and explored a variety of algorithms. If I was given more time I probably would have explored this route a bit more. In `trajan.rb you can find a Ruby implementation of Trajan's algorithm which finds strongly connected components and in my case it finds the largest one which would be a list of all node transistions that would create a tour. I would need to modify that sort of functionality to take into account a start state and a goal state. I would rate the project the most succesful failure I have had. I didn't complete the problem I set out to but I learned a lot on the way and I had a lot of fun while doing it.
