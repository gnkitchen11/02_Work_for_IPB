# Script file for learning R


a <- c(1,2,3,4,5)
b <- c(6,7,8,9,10)
a+b

ab <- c(a,b)
ab

d <- c(1:10,30:40,5,7,9,12)
d
median(d)
sum(d)
x <- sample(letters,10)
x
x[x>10]

rep(letters,5)

y <- NULL

y <- c(y,1,3,x)

c <- c(TRUE,TRUE,TRUE,T,F)
which(c[c==F])

a <- c(1,3,5,3,5.5)
b <- a[a>1 & a < 4]
a
b
c <- which(a>1 & a < 4)
c

# some ways of creating a sequence

d <- seq(2,100,4)
d

e <- c(2:10)
e

f <- c(paste("A", 1:6, sep = ""))
f

g <- c("John", "David", "Kumar", "Jane", "Mariam")
g

h <- c(rep(g,2))
h

i <- c(rep(letters[1:5],2))
i

#sample with or without replacement by setting replace = TRUE or FALSE

j <- c(sample(letters, 75, replace = TRUE))
j

k <- c(sample(g,15,replace=TRUE))
k

l <- c(sample(LETTERS, 5, replace = TRUE))
l

m <- c(rep(sample(LETTERS, 5, replace = TRUE), 3 ) )
m

# Sometimes it is useful to create a random sample, but in a reporducible way.
# use set.seed(#) - example -

n <- sample(LETTERS,5, replace = TRUE , set.seed(200) )
n

o <- c(rep(sample(LETTERS,5, replace = TRUE , set.seed(200) ) , 3 ) )
o

dice <- sample(1:6, 50, replace = TRUE)
dice

typeof(dice) # type of object

str(dice) # storage information about dice, length and a few examples

is.vector(dice)

M <- dice

is.vector(M)

dim(M) <- c(10,5)

str(M)

M

M[,2]

fix(M) # opens data editor

TM <- t(M)

TM

MyList <- list(M,a,dice)

MyList

a <- c(1,3,5,3,5.5)

b <- c("john", "david", "kumar", "jane", "mariam")

c <- c("TRUE", "TRUE", "FALSE", "TRUE", "FALSE")

MyDataFrame <- data.frame(a,b,c)

MyDataFrame

str(MyDataFrame)

MyDataFrame$a

MyDataFrame[,1]

# calculate circle area radius 5

CircleArea <- function(radius) {
	radius*radius*pi
}

CircleArea(5)

CircleArea(a)

plot(a,CircleArea(a))

CircleArea

# How can we remove everything from R's workspace?

rm(list = ls())

ls()

data() #gives a list of datasets available to R

head(infert)

names(infert)

head(infert$education)

save(infert, file = "infertprocessed.rda")

# install packages with install.packages("name of package")

install.packages("maps")

search()

library("maps")

map("world")

points(18,59)

points(18,59,pch=19, col = "blue")

# To bring back all recent commands use history()

save.image() # same as save workplace use load() to load the workspace

# example save.image(file = "lifescienceproject01.RData")
# then load("lifescienceproject01") to bring it back.

# Some homework 1 code

length <- rnorm(10, 180, 10)

weight <- (length/100)^2 * 25

measurements <- data.frame(cbind(length, weight))





