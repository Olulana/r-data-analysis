#Factors


sex <- factor(c("male", "female", "female", "male"))
levels(sex)
nlevels(sex)



#plot of females captured against females

plot(surveys$sex)


# how to create a subset of sex data
sex <- surveys$sex
plot(sex)
levels(sex)

#how to ovewrite the missing label
levels(sex)[1] <- "Undetermined"
levels(sex)

#How to change labels
levels(sex)["F"] <- "M"

levels(sex)[2] <- "M"

levels(sex)[3] <- "F"
levels(sex)[2,3] <- c("F", "M")
levels(sex)[2] <- "Male"
levels(sex)[3] <- "Female"
levels(sex)
plot(sex)
levels(sex)[2:3] <- c('Female', 'Male')

#Reordering the position of all the factors to put 'undetermined' last
sex <- factor(sex, levels = c("Female", "Male", "Undetermined"))
plot(sex)









