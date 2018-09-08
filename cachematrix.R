## Coursera
## R Programming

# Programming Assignment 2: Lexical Scoping
# By Luciano Pereira

# That's the course's example:
# https://github.com/rdpeng/ProgrammingAssignment2

# That's a example of inverted Matrix:
# https://cran.r-project.org/web/packages/matlib/vignettes/inv-ex1.html

# a <- matrix( c(5, 1, 0, 3,-1, 2, 4, 0,-1), nrow=3, byrow=TRUE)
# b <- solve(a)
# b

## 

makeCacheMatrix <- function(x) {
    
    num <- sqrt(length(x))
    x <- matrix(x, nrow = num, ncol = num)
    
    m <- NULL
    
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    get <- function() {
        x
    }
    
    setInverse <- function(invrs) {
        m <<- invrs
        
    }
    
    getInverse <- function() {
        m
    }
    
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getInverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$setInverse(m)
    m
}
