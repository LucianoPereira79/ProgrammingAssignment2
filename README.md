# Coursera
## R Programming

# Programming Assignment 2: Lexical Scoping
## Solution By Luciano Pereira

That's the course's example:
https://github.com/rdpeng/ProgrammingAssignment2

That's a example of inverted Matrix:
https://cran.r-project.org/web/packages/matlib/vignettes/inv-ex1.html

	a <- matrix( c(5, 1, 0, 3,-1, 2, 4, 0,-1), nrow=3, byrow=TRUE)
	b <- solve(a)
	b

And that's my solution to the assignment:

First, I changed the example to work with a matrix.
And I choosed to get a vector as a parameter and create a matrix from it.

That's the main function:

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

And that's how to use it:

	a <- makeCacheMatrix(c(5, 1, 0, 3,-1, 2, 4, 0,-1))

	a$get()
	a$set(a$get())
	a$get()
	a$setInverse(solve(a$get()))
	a$getInverse()

The result to code above is:

	> a <- makeCacheMatrix(c(5, 1, 0, 3,-1, 2, 4, 0,-1))
	> 
	> a$get()
		 [,1] [,2] [,3]
	[1,]    5    3    4
	[2,]    1   -1    0
	[3,]    0    2   -1
	> a$set(a$get())
	> a$get()
		 [,1] [,2] [,3]
	[1,]    5    3    4
	[2,]    1   -1    0
	[3,]    0    2   -1
	> a$setInverse(solve(a$get()))
	> a$getInverse()
		   [,1]    [,2]  [,3]
	[1,] 0.0625  0.6875  0.25
	[2,] 0.0625 -0.3125  0.25
	[3,] 0.1250 -0.6250 -0.50

That's the cache function:
	
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

And that's how to use it:

	a <- makeCacheMatrix(c(5, 1, 0, 3,-1, 2, 4, 0,-1))

	a$get()
	a$set(a$get())
	a$get()
	a$setInverse(solve(a$get()))
	a$getInverse()
	cacheSolve(a)

The result to code above is:

	> a <- makeCacheMatrix(c(5, 1, 0, 3,-1, 2, 4, 0,-1))
	> 
	> a$get()
		 [,1] [,2] [,3]
	[1,]    5    3    4
	[2,]    1   -1    0
	[3,]    0    2   -1
	> a$set(a$get())
	> a$get()
		 [,1] [,2] [,3]
	[1,]    5    3    4
	[2,]    1   -1    0
	[3,]    0    2   -1
	> a$setInverse(solve(a$get()))
	> a$getInverse()
		   [,1]    [,2]  [,3]
	[1,] 0.0625  0.6875  0.25
	[2,] 0.0625 -0.3125  0.25
	[3,] 0.1250 -0.6250 -0.50
	> cacheSolve(a)
	getting cached data
		   [,1]    [,2]  [,3]
	[1,] 0.0625  0.6875  0.25
	[2,] 0.0625 -0.3125  0.25
	[3,] 0.1250 -0.6250 -0.50

That's it.
I hope it's rigth.

Thank you!
