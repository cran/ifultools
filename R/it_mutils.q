################################################
## S+IFULTools MUTILS functions 
##
##   mutilsDistanceMetric
##   mutilsFilterType
##   mutilsFilterTypeContinuous
##   mutilsTransformType
##   mutilsWSShrinkageFunction
##   mutilsWSThresholdFunction
##
###################################################

###
# mutilsDistanceMetric
##

"mutilsDistanceMetric" <- function(metric){

  checkScalarType(metric,"numeric")
  if (metric >= 1 && metric <= 2)
    metric <- metric - 1
  else if (metric == Inf)
    metric <- 2
  else
    stop("Acceptable values for metric are: 1, 2, and Inf")

  as.integer(metric)
}

###
# mutilsFilterType
###

"mutilsFilterType" <- function(wavelet="s8")
{
  # parse wavelet filter specs
  if (lowerCase(wavelet) == "haar"){
    filter.length <- 2
    filter.type   <- 7
  }
  else {
    # check for the correct filter types
    supported <- c("d","s","l","c")
    prefix    <- substring(wavelet,1,1)
    if (!is.element(prefix, supported))
      stop("The specified filter is currently unsupported")

    # map filter to index and obtain length
    filter.type   <- match(prefix, supported) - 1
    filter.length <- as.integer(substring(wavelet,2))
  }

  return(list(type=filter.type, length=filter.length))
}

###
# mutilsFilterTypeContinuous
###

"mutilsFilterTypeContinuous" <- function(x)
{
	x <- match.arg(lowerCase(x),c("haar","gauss1","gauss2",
	  "gaussian1","gaussian2","sombrero","mexican hat","morlet"))
	
  filter <- switch(x,
    haar=7,
    gauss1=4,
    gaussian1=4,
    gaussian2=5,
    gauss2=5,
    sombrero=5,
    "mexican hat"=5,
    morlet=6,
    NULL)
  
  as.integer(filter)
}

###
# mutilsTransformType
###

"mutilsTransformType" <- function(x)
{
	checkScalarType(x,"character")
	supported.xforms <- c("modwt","modwpt","dwt","dwpt") 
	x <- match.arg(x, supported.xforms)
	match(x, supported.xforms) - 1
}

###
# mutilsWSShrinkageFunction
###

"mutilsWSShrinkageFunction" <- function(x)
{
	checkScalarType(x,"character")
	supported <- c("hard","soft","mid")
	x <- match.arg(x, supported)
	index <- as.integer(pmatch(x, supported) - 1)
	list(index=index, shrinkfun=x)
}

###
# mutilsWSThresholdFunction
###

"mutilsWSThresholdFunction" <- function(x)
{
	checkScalarType(x,"character")
	supported <- c("universal","minimax","adaptive")
	x <- match.arg(x, supported)
	index <- as.integer(pmatch(x, supported) - 1)
	list(index=index, threshfun=x)
}
