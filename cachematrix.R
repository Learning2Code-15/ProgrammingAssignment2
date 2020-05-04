## The functions below cache the inverse of the matrix.
## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse

##cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix. 
##If the inverse has already been calculated and the matrix has not changed, then cacheSolve will retrieve the inverse 
##from the cache.



##makeCache function will return a list of functions that can be used to do the below functions
##setMatrix:- will cache the matrix value and inverse value and set the inverse to NULL
##getMatrix:- will return the matrix value present in the cache.
##setInverse:- will set the new value of inverse of the matrix in the cache.
##getInverse:- will return the inverse matrix value in the cache.

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

## CacheSolve:Returns the inverse of the matrix in the cache if the inverse does
## is NULL else it will return the cached inverse matrix value

cacheSolve <- function(f, ...) {
        inv <- f$getInverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    mat_data <- f$getMatrix()
    inv <- solve(mat_data,...)
    inv
}
