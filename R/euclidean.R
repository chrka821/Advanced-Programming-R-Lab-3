euclidean <- function(x, y){
  
  if (y > x){ # ensure t that the bigger value is stored in x
    temp <- x
    x <- y
    y <- temp
  }
  remainder <- -1 
  
  while(remainder != 0){ # The operation stops if the remainder is 0
    remainder = x%%y # Compute the remainder of the division of x and y
    x <- y 
    y <- remainder # X turns into y, y turns into the remainder
  }
  return(x) # X holds the value of the last non zero remainder and thus is the largest divisor
}

