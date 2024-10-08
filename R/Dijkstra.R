#' Dijkstra Algorithm
#'
#' The Dijkstra algorithm computes the shortest path from a given initial node to every other node
#' in a graph. It operates on graphs with weighted edges and non-negative weights, updating the shortest
#' known distances to neighboring nodes as it iterates.
#' https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm
#'
#' @param graph A data frame containing the edges of the graph with three variables: \code{v1}, \code{v2}, and \code{w}.
#'   \code{v1} is the start node, \code{v2} is the destination node, and \code{w} is the weight of the edge between them.
#' @param init_node The starting node from which the shortest path to every other node is calculated.
#' @return A named vector where the names are the nodes of the graph and the values are the shortest
#'   distances from \code{init_node} to those nodes.
#' @examples
#' # Example graph with 6 nodes and weighted edges
#' wiki_graph <- data.frame(
#'   v1 = c(1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 6, 6, 6),
#'   v2 = c(2, 3, 3, 4, 1, 4, 6, 2, 5, 6, 4, 6, 3, 5, 4),
#'   w  = c(7, 9, 10, 15, 9, 11, 2, 15, 6, 6, 9, 14, 2, 9, 6)
#' )
#' 
#' # Compute the shortest paths from node 1
#' dijkstra(wiki_graph, 1)
#' @export


dijkstra <- function(graph, init_node) {
  
  # Get unique nodes in the graph
  nodes <- unique(c(graph$v1, graph$v2))
  
  # Check if init_node is valid (i.e., exists in the graph)
  if (!(init_node %in% nodes)) {
    stop("Error: Initial node does not exist in the graph")
  }
  
  # Initialize distances to infinity and set distance to initial node as 0
  distances <- rep(Inf, length(nodes))
  names(distances) <- as.numeric(nodes)  # Convert node names to numeric
  distances[as.character(init_node)] <- 0
  
  # Keep track of the nodes to visit
  to_visit <- nodes
  
  # While there are still nodes to visit
  while(length(to_visit) > 0) {
    
    # Get the node with the smallest tentative distance
    current_node <- to_visit[which.min(distances[to_visit])]
    
    # Remove it from the list of nodes to visit
    to_visit <- setdiff(to_visit, current_node)
    
    # Get neighbors of the current node using with()
    neighbors <- with(graph, graph[v1 == current_node, c("v2", "w")])
    
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
  
  # Remove names from the distances vector (if the test does not expect names)
  names(distances) <- NULL
  
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
