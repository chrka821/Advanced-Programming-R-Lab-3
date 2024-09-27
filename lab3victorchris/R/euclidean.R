euclidean <-
function(x, y){
  
  if (y > x){ # ensure t that the bigger value is stored in x
    temp <- x
    x <- y
    y <- temp
  }
  remainder <- -1 
  while(remainder != 0){
    remainder = x%%y
    print(remainder)
  }
  
}
