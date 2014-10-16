# Function to create X and MR charts following Dr. Donald J. Wheeler's recommendations.

# X is the individual values that are plotted and MR is the moving range of the values to be plotted.

# The X chart evaluates the stability of the series of data.

# The MR chart evaluates the stability of the variance of the data.

# See SPC Press reading room publication "Individual Charts Done Right and Wrong."

# Also see his books.

# This function uses ggplot and so ggplot must be already loaded.

# This function uses the R functions abs(diff()) to calculate MR values

# This function requires a data frame of numeric data values of interest 
# and a date/time column in the data frame which identifies the time order of the numeric data values.

