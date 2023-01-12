#----------------------
# Programming in R
# 12 January 2023
# Alex Takoudes

#----------------------
#Assignment Operator
  #Used to assign a new value to a variable

x <- 5
print(x)

y = 4 #legal but not used except in functions

#----------------------
#Variables

z <- 3 # Begin with lower case letter 
plantHeight <- 10 # option "camelCaseFormatting"
plant.height <- 4.2 # avoid periods
plant_height <- 3.3  # optimal "snake_case_formatting"
. <- 5.5 # reserve this for a generic temporary variable (more later)

#----------------------
#Functions

square <- function(number = NULL){
  number <- number^2
  print(number)
}

square(4)
x <- 9
square(number = x)

sum(109, 3, 10)

#----------------------
#One-Dimensional Vectors

# c function (combine)
z <- c(3.2, 5, 5, 6)
print(z) # prints
class(z) # returns class
typeof(z) # returns type of variable
is.numeric(z) # returns T/F

# c always "flattens" a vector
z <- c(c(3, 4), c(5, 6))

# character strings with single or double quotes
z <- c("perch","bass",'trout') 

# use both with an internal quote
z <- c("This is only 'one' character string", 'a second')
z <- as.character(z)
length(z)

#randint
z <- runif(5)

## Adding names to vectors
names(z) <- c("chow", "pug", "beagle", "greyhound", "akita")


rep(seq(0.0,3.0,by = 0.5), each = 2, length = 37)
