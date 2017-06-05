## this code is breaking in two function. They take a matrix, check if the inverse of this matrix has already
## been computed and stored. If it's the cas, it return these value, else, it computes it and store it
## in the global environnement


## Thse function create a list of four functions. One set an object for the original matrix and 
## inverted one in the global environnement. The second one allows to get the value of the original matrix
## supplied as argumend, the thirst store the inverted value in the global environnement and the last one
## get this value.

makeCacheMatrix <- function(x = matrix()) {
i<-NULL
    set<-function(y){
        x<<-y
        i<<-NULL
  }
    get<- function() x
    setinvert<-function(invert) i<<-invert
    getinvert<-function () i
    list(set=set, get=get, setinvert=setinvert, getinvert=getinvert)
}


## These function use the function set in makeCacheMatrix. it checks if the inverted has already
## computed. If it is the cas, it returns the value, else it computes it and store it in the global 
## environnement.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i<-x$getinvert()
  if(!is.null(i)){
    message("getting catched invert")
    return(i)
  }
  data<-x$get()
  i<-solve(data,...)
  x$setinvert(i)
  i
}
