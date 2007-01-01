.First.lib <- function(lib, pkg) {
    if(is.R()) {
      library.dynam("ifultools", pkg, lib)
    }
}
