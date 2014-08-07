library(swirl)

# Type ls() to see a list of the variables in your workspace. Then, type rm(list=ls()) to clear your workspace. Type swirl() when you are ready to begin.

rm(list=ls())
swirl()

# course - R Programming

# lesson 1 - Basic Building Blocks

# If at any point you'd like more information on a particular topic related to R, you can type help.start() at the prompt,
# which will open a menu of resources (either within RStudio or your default web browser, depending on your setup).
# Alternatively, a simple web search often yields the answer you're looking for.

# In its simplest form, R can be used as an interactive calculator.

5+7

# R simply prints the result of 12 by default.

# However, R is a programming language and often the reason we use a programming language as opposed to a calculator
# is to automate some process or avoid unnecessary repetition.
# In this case, we may want to use our result from above in a second calculation.
# Instead of retyping 5 + 7 every time we need it, we can just create a new variable that stores the result.

# The way you assign a value to a variable in R is by using the assignment operator <-
# Think of the assignment operator as an arrow.
# You are assigning the value on the right side of the arrow to the variable name on the left side of the arrow.

x <- 5 + 7

# You'll notice that R did not print the result of 12 this time.
# When you use the assignment operator, R assumes that you don't want to see the result immediately,
# but rather that you intend to use the result for something else later on.

# To view the contents of the variable x, just type x

x

# Now, store the result of x - 3 in a new variable called y.

y <- x - 3

y

# Now, let's create a small collection of numbers called a vector.
# Any object that contains data is called a data structure and numeric vectors are the simplest type of data structure in R.
# In fact, even a single number is considered a vector of length one.

# The easiest way to create a vector is with the c() function, which stands for 'concatenate' or 'combine'.

z <- c(1.1, 9, 3.14)

# Anytime you have questions about a particular function, you can access R's built-in help files via the `?` command.
# For example, if you want more information on the c() function, type ?c without the parentheses that normally follow a function name.

z
# Notice that there are no commas separating the values in the output.

# You can combine vectors to make a new vector.

c(z, 555, z)

# Numeric vectors can be used in arithmetic expressions.

z * 2 + 100

# First, R multiplied each of the three elements in z by 2. Then it added 100 to each element

# Other common arithmetic operators are `+`, `-`, `/`, and `^` (where x^2 means 'x squared').
# To take the square root, use the sqrt() function and to take the absolute value, use the abs() function.

my_sqrt <- sqrt(z-1)

my_sqrt

# R first subtracted 1 from each element of z, then took the square root of each element.
# This leaves you with a vector of the same length as the original vector z.

my_div <- z/my_sqrt

my_div

# When given two vectors of the same length, R simply performs the specified arithmetic operation | (`+`, `-`, `*`, etc.) element-by-element.
# If the vectors are of different lengths, R 'recycles' the shorter vector until it is the same length as the longer vector.

# When we did z * 2 + 100 in our earlier example, z was a vector of length 3, but technically 2 and 100 are each vectors of length 1.

# Behind the scenes, R is 'recycling' the 2 to make a vector of 2s and the 100 to make a vector of 100s.
# In other words, when you ask R to compute z * 2 + 100, what it really computes is this: z * c(2, 2, 2) + c(100, 100, 100).

c(1, 2, 3, 4) + c(0,10)

# If the length of the shorter vector does not divide evenly into the length of the longer vector, R will still apply the 'recycling' method,
# but will throw a warning to let you know something fishy might be going on.

c(1, 2, 3, 4) + c(0, 10, 100)

# Earlier in the lesson, you computed z * 2 + 100. Let's pretend that you made a mistake and that you meant to add 1000 instead of 100.
# You could either re-type the expression, or In many programming environments, the up arrow will cycle through previous commands.
# Try hitting the up arrow on your keyboard until you get to this command, then change 100 to 1000 and hit Enter.

z * 2 + 1000

# Finally, let's pretend you'd like to view the contents of a variable that you created earlier, 
# but you can't seem to remember if you named it my_div or myDiv.
# You could try both and see what works, or... You can type the first two letters of the variable name, then hit the Tab key.
# Most programming environments will provide a list of variables that you've created that begin with 'my'.
# This is called auto-completion and can be quite handy when you have many variables in your workspace.

# lesson 2 - Sequences of Numbers

# The simplest way to create a sequence of numbers in R is by using the `:` operator.

1:20

# That gave us every integer between (and including) 1 and 20. We could also use it to create a sequence of real numbers.

pi:10

# The result is a vector of real numbers starting with pi (3.142...) and increasing in increments of 1.
# The upper limit of 10 is never reached, since the next number in our sequence would be greater than 10.

15:1

# It counted backwards in increments of 1!

# Remember that if you have questions about a particular R function, you can access its documentation with a question mark followed by the function name:
# ?function_name_here. However, in the case of an operator like the colon used above, you must enclose the symbol in backticks like this: ?`:`.
# (NOTE: The backtick (`) key is generally located in the top left corner of a keyboard, above the Tab key.
# If you don't have a backtick key, you can use regular quotes.)

# Often, we'll desire more control over a sequence we're creating than what the `:` operator gives us. The seq() function serves this purpose.

# The most basic use of seq() does exactly the same thing as the `:` operator.

seq(1, 20)

# This gives us the same output as 1:20. However, let's say that instead we want a vector of numbers ranging from 0 to 10, incremented by 0.5.

seq(0, 10, by=0.5)

# Or maybe we don't care what the increment is and we just want a sequence of 30 numbers between 5 and 10.

my_seq <- seq(5, 10, length=30)

# To confirm that my_seq has length 30, we can use the length() function.

length(my_seq)

# Let's pretend we don't know the length of my_seq, but we want to generate a sequence of integers from 1 to N,
# where N represents the length of the my_seq vector. In other words, we want a new vector (1, 2, 3, ...) that is the same length as my_seq.

# One possibility is to combine the `:` operator and the length() function like this: 1:length(my_seq)

1:length(my_seq)

# Another option is to use seq(along = my_seq).

seq(along = my_seq)

# However, as is the case with many common tasks, R has a separate built-in function for this purpose called seq_along().

seq_along(my_seq)

# One more function related to creating sequences of numbers is rep(), which stands for 'replicate'.
# If we're interested in creating a vector that contains 40 zeros, we can use rep(0, times = 40).

rep(0, times = 40)

# If instead we want our vector to contain 10 repetitions of the vector (0, 1, 2)

rep(c(0, 1, 2), times = 10)

# Finally, let's say that rather than repeating the vector (0, 1, 2) over and over again,
# we want our vector to contain 10 zeros, then 10 ones, then 10 twos. We can do this with the `each` argument.

rep(c(0, 1, 2), each = 10)

# lesson 3 - Vectors

# The simplest and most common data structure in R is the vector.

# Vectors come in two different flavors: atomic vectors and lists.
# An atomic vector contains exactly one data type, whereas a list may contain multiple data types.
# We'll explore atomic vectors further before we get to lists.

# In previous lessons, we dealt entirely with numeric vectors, which are one type of atomic vector.
# Other types of atomic vectors include logical, character, integer, and complex.

# Logical vectors can contain the values TRUE, FALSE, and NA (for 'not available'). These values are generated as the result of logical 'conditions'.

num_vect <- c(0.5, 55, -10, 6)

tf <- num_vect < 1

tf

# The statement num_vect < 1 is a condition and tf tells us whether each corresponding element of our numeric vector num_vect satisfies this condition.

num_vect >= 6

# The `<` and `>=` symbols in these examples are called 'logical operators'.
# Other logical operators include `>`, `<=`, `==` for exact equality, and `!=` for inequality.

# If we have two logical expressions, A and B, we can ask whether at least one is TRUE with A | B (logical 'or' a.k.a. 'union') or
# whether they are both TRUE with A & B (logical 'and' a.k.a. 'intersection').
# Lastly, !A is the negation of A and is TRUE when A is FALSE and vice versa.

(3 > 5) & (4 == 4)

(TRUE == TRUE) | (TRUE == FALSE)

((111 >= 111) | !(TRUE)) & ((4 + 1) == 5)

# Double quotes are used to distinguish character objects

my_char <- c("My", "name", "is")

my_char

# Right now, my_char is a character vector of length 3.
# Let's say we want to join the elements of my_char together into one continuous character string (i.e. a character vector of length 1).
# We can do this using the paste() function.

paste(my_char, collapse = " ")

# The `collapse` argument to the paste() function tells R that when we join together the elements of the my_char character vector,
# we'd like to separate them with single spaces.

# To add (or 'concatenate') your name to the end of my_char, use the c() function

my_name <- c(my_char, "RAVI PAREKH")

my_name

# Now, use the paste() function once more to join the words in my_name together into a single character string.

# In this example, we used the paste() function to collapse the elements of a single character vector.
# paste() can also be used to join the elements of multiple character vectors.

# In the simplest case, we can join two character vectors that are each of length 1 (i.e. join two words).

paste("Hello", "world!", sep = " ")

# For a slightly more complicated example, we can join two vectors, each of length 3.

paste(1:3, c("X", "Y", "Z"), sep = "")

# What do you think will happen if our vectors are of different length? Vector recycling!

# LETTERS is a predefined variable in R containing a character vector of all 26 letters in the English alphabet.

paste(LETTERS, 1:4, sep = "-")

# Since the character vector LETTERS is longer than the numeric vector 1:4, R simply recycles, or repeats, 1:4 until it matches the length of LETTERS.

# Also worth noting is that the numeric vector 1:4 gets 'coerced' into a character vector by the paste() function.

# coercion - the numbers 1, 2, 3, and 4 in the output above are no longer numbers to R, but rather characters "1", "2", "3", and "4".

# lesson 4 - Missing Values

# Missing values play an important role in statistics and data analysis.
# Often, missing values must not be ignored,
# but rather they should be carefully studied to see if there's an underlying pattern or cause for their missingness.

# In R, NA is used to represent any value that is 'not available' or 'missing' (in the statistical sense).

# Any operation involving NA generally yields NA as the result.

x <- c(44, NA, 5, NA)

x * 3

# Notice that the elements of the resulting vector that correspond with the NA values in x are also NA.

# lets create a vector containing 1000 draws from a standard normal distribution with y <- rnorm(1000)

y <- rnorm(1000)

# let's create a vector containing 1000 NAs with z <- rep(NA, 1000)

z <- rep(NA, 1000)

# Finally, let's select 100 elements at random from these 2000 values (combining y and z)
# such that we don't know how many NAs we'll wind up with or what positions they'll occupy in our final vector.

my_data <- sample(c(y, z), 100)

# Let's first ask the question of where our NAs are located in our data. The is.na() function tells us whether each element of a vector is NA.

my_na <- is.na(my_data)

my_na

# In our previous discussion of logical operators, we introduced the `==` operator as a method of testing for equality between two objects.
# So, you might think the expression my_data == NA yields the same results as is.na().

my_data == NA

# The reason you got a vector of all NAs is that NA is not really a value, but just a placeholder for a quantity that is not available.
# Therefore the logical expression is incomplete and R has no choice but to return a vector of the same length as my_data that contains all NAs.

# The key takeaway is to be cautious when using logical expressions anytime NAs might creep in, since a single NA value can derail the entire thing.

# So, back to the task at hand.
# Now that we have a vector, my_na, that has a TRUE for every NA and FALSE for every numeric value, we can compute the total number of NAs in our data.

# The trick is to recognize that underneath the surface, R represents TRUE as the number 1 and FALSE as the number 0.
# Therefore, if we take the sum of a bunch of TRUEs and FALSEs, we get the total number of TRUEs.

# Call the sum() function on my_na to count the total number of TRUEs in my_na, and thus the total number of NAs in my_data.

sum(my_na)

# second type of missing value -- NaN, which stands for 'not a number'

0/0

# In R, Inf stands for infinity.

Inf/Inf

Inf - Inf

# lesson 5 - Subsetting Vectors

# In this lesson, we'll see how to extract elements from a vector based on some conditions that we specify.
# For example, we may only be interested in the first 20 elements of a vector, or only the elements that are not NA,
# or only those that are positive or correspond to a specific variable of interest.

# a vector called x that contains a random ordering of 20 numbers (from a standard normal distribution) and 20 NAs

x <- sample(c(rnorm(20), rep(NA,20)), 40)

# The way you tell R that you want to select some particular elements (i.e. a 'subset') from a vector
# is by placing an 'index vector' in square brackets immediately following the name of the vector.

x[1:10]

# Index vectors come in four different flavors -- logical vectors, vectors of positive integers, vectors of negative integers, and
# vectors of character strings

# Let's start by indexing with logical vectors.
# One common scenario when working with real-world data is that we want to extract all elements of a vector that are not NA (i.e. missing data).
# Recall that is.na(x) yields a vector of logical values the same length as x,
# with TRUEs corresponding to NA values in x and FALSEs corresponding to non-NA values in x.

x[is.na(x)]

# Remember that is.na(x) tells us where the NAs are in a vector. So if we subset x based on that, it will give a vector of all NAs

# Recall that `!` gives us the negation of a logical expression, so !is.na(x) can be read as 'is not NA'.
# Therefore, if we want to create a vector called y that contains all of the non-NA values from x

y <- x[!is.na(x)]

# Now that we've isolated the non-missing values of x and put them in y, we can subset y as we please.

# Recall that the expression y > 0 will give us a vector of logical values the same length as y,
# with TRUEs corresponding to values of y that are greater than zero and FALSEs corresponding to values of y that are less than or equal to zero.

y[y > 0]

# You might wonder why we didn't just start with x[x > 0] to isolate the positive elements of x.

x[x > 0]

# Since NA is not a value, but rather a placeholder for an unknown quantity, the expression NA > 0 evaluates to NA.
# Hence we get a bunch of NAs mixed in with our positive numbers when we do this.

# Combining our knowledge of logical operators with our new knowledge of subsetting

x[!is.na(x) & x > 0]

# In this case, we request only values of x that are both non-missing AND greater than zero.

# To subset just the first ten values of x using x[1:10]. In this case, we're providing a vector of positive integers inside of the square brackets,
# which tells R to return only the elements of x numbered 1 through 10.

# Many programming languages use what's called 'zero-based indexing', which means that the first element of a vector is considered element 0.
# R uses 'one-based indexing', which means the first element of a vector is considered element 1.

# Subset the 3rd, 5th, and 7th elements of x. Hint -- Use the c() function to specify the element numbers as a numeric vector.

x[c(3,5,7)]

# It's important that when using integer vectors to subset our vector x, we stick with the set of indexes {1, 2, ..., 40} since x only has 40 elements.
# What happens if we ask for the zeroth element of x (i.e. x[0])?

x[0]

# As you might expect, we get nothing useful. Unfortunately, R doesn't prevent us from doing this. What if we ask for the 3000th element of x?

x[3000]

# Again, nothing useful, but R doesn't prevent us from asking for it. This should be a cautionary tale.
# You should always make sure that what you are asking for is within the bounds of the vector you're working with.

# What if we're interested in all elements of x EXCEPT the 2nd and 10th?
# It would be pretty tedious to construct a vector containing all numbers 1 through 40 EXCEPT 2 and 10.

# Luckily, R accepts negative integer indexes.
# Whereas x[c(2, 10)] gives us ONLY the 2nd and 10th elements of x, x[c(-2, -10)] gives us all elements of x EXCEPT for the 2nd and 10 elements.

x[c(-2, -10)]

# A shorthand way of specifying multiple negative numbers is to put the negative sign out in front of the vector of positive numbers.

x[-c(2, 10)]

# the concept of 'named' elements

# Create a numeric vector with three named elements

vect <- c(foo = 11, bar = 2, norf = NA)

# each element has a name

vect

# We can also get the names of vect by passing vect as an argument to the names() function.

# Alternatively, we can create an unnamed vector vect2

vect2 <- c(11, 2, NA)

# Then, we can add the `names` attribute to vect2

names(vect2) <- c("foo", "bar", "norf")

# Now, let's check that vect and vect2 are the same by passing them as arguments to the identical() function.

identical(vect, vect2)

# Indeed, vect and vect2 are identical named vectors.

# command to give the second element of vect

vect["bar"]

# Likewise, we can specify a vector of names

vect[c("foo", "bar")]

# lesson 6 - Matrices and Data Frames

# matrices and data frames - Both represent 'rectangular' data types, meaning that they are used to store tabular data, with rows and columns

# The main difference is that matrices can only contain a single class of data, while data frames can consist of many different classes of data.

my_vector <- 1:20

my_vector

# The dim() function tells us the 'dimensions' of an object.

dim(my_vector)

# Since my_vector is a vector, it doesn't have a `dim` attribute (so it's just NULL), but we can find its length using the length() function.

length(my_vector)

# But, what happens if we give my_vector a `dim` attribute?

dim(my_vector) <- c(4, 5)

# The dim() function allows you to get OR set the `dim` attribute for an R object.
# In this case, we assigned the value c(4, 5) to the `dim` attribute of my_vector.

dim(my_vector)

attributes(my_vector)

# Just like in math class, when dealing with a 2-dimensional object (think rectangular table),
# the first number is the number of rows and the second is the number of columns.
# Therefore, we just gave my_vector 4 rows and 5 columns.

# That doesn't sound like a vector any more. Well, it's not. Now it's a matrix.

my_vector

# Now, let's confirm it's actually a matrix by using the class() function.

class(my_vector)

my_matrix <- my_vector

# The example that we've used so far was meant to illustrate the point that a matrix is simply an atomic vector with a dimension attribute.
# A more direct method of creating the same matrix uses the matrix() function.

my_matrix2 <- matrix(data = 1:20, nrow = 4, ncol = 5)

# The identical() function will tell us if its first two arguments are the same.

identical(my_matrix, my_matrix2)

# Now, imagine that the numbers in our table represent some measurements from a clinical experiment,
# where each row represents one patient and each column represents one variable for which measurements where taken.

# We may want to label the rows, so that we know which numbers belong to each patient in the experiment.
# One way to do this is to add a column to the matrix, which contains the names of all four people.

# Let's start by creating a character vector containing the names of our patients -- Bill, Gina, Kelly, and Sean.
# Remember that double quotes tell R that something is a character string. Store the result in a variable called patients.

patients <- c("Bill", "Gina", "Kelly", "Sean")

# use the cbind() function to 'combine columns'

cbind(patients, my_matrix)

# Something is fishy about our result!
# It appears that combining the character vector with our matrix of numbers caused everything to be enclosed in double quotes.
# This means we're left with a matrix of character strings, which is no good.

# Matrices can only contain ONE class of data.
# Therefore, when we tried to combine a character vector with a numeric matrix, R was forced to 'coerce' the numbers to characters, hence the double quotes.

# This is called 'implicit coersion', because we didn't ask for it. It just happened. But why didn't R just convert the names of our patients to numbers?
# I'll let you ponder that question on your own.

# So, we're still left with the question of how to include the names of our patients in the table without destroying the integrity of our numeric data.

my_data <- data.frame(patients, my_matrix)

my_data

# The data.frame() function allowed us to store our character vector of names right alongside our matrix of numbers

# Behind the scenes, the data.frame() function takes any number of arguments and returns a single object of class `data.frame`
# that is composed of the original objects.

class(my_data)

# It's also possible to assign names to the individual rows and columns of a data frame,
# which presents another possible way of determining which row of values in our table belongs to each patient.

# assigning names to the columns of our data frame so that we know what type of measurement each column represents

# Since we have six columns (including patient names), we'll need to first create a vector containing one element for each column.

cnames <- c("patient", "age", "weight", "bp", "rating", "test")

# The colnames() function to set the `colnames` attribute for our data frame. This is similar to the way we used the dim() function.

colnames(my_data) <- cnames

my_data