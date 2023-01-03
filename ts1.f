: TOPOLOGICAL-SORT ( graph -- sorted )
   create sorted ,
   graph
   0 ?DO
      i @ graph + @ indegree 0=
      if
         graph + @
         sorted length @
         sorted swap !
         graph + @
         graph + @
         0 ?DO
            j @ graph + @
            i @ graph + @ j @ - link
            j @ indegree 1-
         LOOP
      then
   LOOP
   sorted
;
\\ This implementation of topological sort traverses a directed acyclic graph (DAG) 
\\ and adds nodes to the sorted list in topological order. 
\\ It maintains a list of nodes with indegree 0 (i.e., no incoming edges), 
\\ and repeatedly selects a node from this list, adds it to the sorted list, 
\\ and removes its outgoing edges from the graph.
\\ To use the TOPOLOGICAL-SORT function, you would call it with a graph on the stack, like this:
\\ [ [ 1 2 ] [ 2 3 ] [ 3 4 ] [ 4 1 ] ] topological-sort .s
\\ This would print the sorted list on the stack.
