#download data

download.file("https://ndownloader.figshare.com/files/2292169", "data/portal_data_joined.csv")
# load the data
surveys <- read.csv('data/portal_data_joined.csv')
surveys

#Examine the first 6 lines
head (surveys)

# look at the structure
str(surveys)


#Indexing and subsetting
surveys[1, 1]  #first element in the first columv
surveys[1, 6]  #first element in the first column
surveys[1:3, 7] # the elements in the first, second and the 7 column
surveys[ , 1]   # all the elements in the first column
surveys[8:11, ] # all the elements in the row 8,9,10, and 11
surveys[1:13, ]  # all the elemnets in row 1to 13 in all the column

#Create a data.frame (surveys_200) containing only the data in row 200 of the surveys dataset.
surveys_200[200] #all the element in the row 200 of all the column
surveys_200 <- surveys[200, ] # the element in the row 200 of all the column

#Notice how nrow() gives you the number of rows in a data.frame
nrow(surveys)

#Use that number to pull out just that last row in the data frame
n_row <- nrow(surveys)
surveys_last <- surveys[n_row, ]

#Compare that with what you see as the last row using tail() to make sure it’s meeting expectations
tail(surveys)

#Use nrow() to extract the row that is in the middle of the data frame
middle_row <- nrow(surveys)/2
surveys_middle <- surveys[middle_row, ]

#Store the content of this row in an object named surveys_middle.

#Combine nrow() with the - notation above to reproduce the behavior of head(surveys), 
#keeping just the first through 6th rows of the surveys dataset.
surveys_head <- surveys[-(7:n_row), ]







