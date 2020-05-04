## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(mat_data = matrix()) {
    inv<- NULL
    setMatrix <- function(new_value) {
        mat_data <<- new_value
        inv <<- NULL
    }
    getMatrix <- function() mat_data
    setInverse <- function(new_Inv) inv <<- new_Inv
    getInverse <- function() inv
    list(setMatrix = setMatrix, getMatrix = getMatrix,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(f, ...) {
        ## Return a matrix that is the inverse of 'x'
    
    inv <- f$getInverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    mat_data <- f$getMatrix()
    inv <- solve(mat_data)
p    f$setInverse(inv)
inv
}


