#' Wikipedia Graph Example Dataset
#'
#' This dataset is a small example graph based on the Wikipedia page for 
#' Dijkstra's algorithm. 
#'
#' @format A data frame with 15 rows and 3 variables:
#' \describe{
#'   \item{v1}{Start node of an edge (integer)}
#'   \item{v2}{End node of an edge (integer)}
#'   \item{w}{Weight of the edge between the nodes (numeric)}
#' }
#' @source Wikipedia page on Dijkstra's algorithm: \url{https://en.wikipedia.org/wiki/Dijkstra's_algorithm}
#' @examples
#' data(wiki_graph)
#' print(wiki_graph)
"wiki_graph"
