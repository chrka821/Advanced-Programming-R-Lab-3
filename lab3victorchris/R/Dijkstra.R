dijkstra <- function(graph, init_node) {
  
  # Get unique nodes in the graph
  nodes <- unique(c(graph$v1, graph$v2))
  
  # Initialize distances to infinity and set the distance to the initial node as 0
  distances <- rep(Inf, length(nodes))
  names(distances) <- nodes
  distances[as.character(init_node)] <- 0
  
  # Keep track of the nodes to visit
  to_visit <- nodes
  
  # While there are still nodes to visit
  while(length(to_visit) > 0) {
    
    # Get the node with the smallest tentative distance
    current_node <- to_visit[which.min(distances[to_visit])]
    
    # Remove it from the list of nodes to visit
    to_visit <- setdiff(to_visit, current_node)
    
    # Get neighbors of the current node using base R subsetting
    neighbors <- subset(graph, v1 == current_node, select = c(v2, w))
    
    # Update the distances to the neighbors
    for (i in 1:nrow(neighbors)) {
      neighbor <- neighbors$v2[i]
      weight <- neighbors$w[i]
      new_distance <- distances[as.character(current_node)] + weight
      
      if (new_distance < distances[as.character(neighbor)]) {
        distances[as.character(neighbor)] <- new_distance
      }
    }
  }
  
  # Return the distances from the initial node to all other nodes
  return(distances)
}

# Example graph
wiki_graph <- data.frame(
  v1 = c(1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 6, 6, 6),
  v2 = c(2, 3, 3, 4, 1, 4, 6, 2, 5, 6, 4, 6, 3, 5, 4),
  w  = c(7, 9, 10, 15, 9, 11, 2, 15, 6, 6, 9, 14, 2, 9, 6)
)

# Test the function with initial node 1
dijkstra(wiki_graph, 1)
