source("C:/Luciano Pereira/Git/ProgrammingAssignment2/cachematrix.R")

a <- makeCacheMatrix(c(5, 1, 0, 3,-1, 2, 4, 0,-1))

a$get()
a$set(a$get())
a$get()
a$setInverse(solve(a$get()))
a$getInverse()
cacheSolve(a)