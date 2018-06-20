head(surveys)
surveys
colnames(surveys)
head(surveys)
# use the square bracke subsetting to select rows from 1978 only
surveys[surveys$year == "1978", ]


#dplyr
# filter - used to select rows

filter(surveys, year == 1978)

#select - used to select rows

select(surveys, year, plot_id, species_id)

#select only the three columns but only from 1978
surveys_filtered <- filter(surveys, year == 1978)
surveys_filtered

select(surveys_filtered, year, plot_id, species_id )


#stiching it together with pipe
#%>% shortcut to type a pipe -shift - ctrl- m

surveys %>% 
  
  filter(year == 1978) %>% 
  select(year, plot_id, species_id)
#how to creat a new column and add to the object-mutate
surveys %>% 
    select(weight, species)

surveys %>%
  mutate(weight_kg = weight/1000) %>% 
  select(starts_with("w"))

#challenge
surveys %>%
  mutate(hindfoot_half = hindfoot_length/2) %>% 
  filter(hindfoot_half < 30) %>% 
  select(species_id, hindfoot_half)

#how to remove missing observations


surveys %>%
  mutate(weight_kg = weight/1000) %>%  
  select(starts_with('w')) %>% 
  filter(!ls,na(weight)) 
# filters out rows in column weight taht are not na (missing data)


summary(surveys)
length(table(surveys$year))
range(surveys$year)



#Splitting and running calculations on groups

surveys %>%
  group_by(year) %>% 
  summarise(mean_hindfoot_length = mean(hindfoot_length, na.rm = TRUE))

surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarise(mean_weight = mean(weight), 
            min_weight = min(weight), 
            sd_weight = sd(weight))
surveys %>% 
  count(sex, species) %>% 
  print(n = 81)


surveys %>% 
  count(species, sort = TRUE)

#arrange- rearrange rows - sorting the rows in the specific way

surveys %>%
  count(species, sort = TRUE)

surveys %>%
  count(sex, species) %>%
  arrange(species, desc(n))

#Challenge 2
#how many individuals were caught in each plot_type?

surveys %>%
  count(plot_type)

# Anwer in two ways (using group_by and count)

surveys %>% 
  group_by(plot_type) %>%
  tally()


#Challenge 3
#what is the heaviest animals measured in each year? 
#Return columns, year, genus, species_id and weight. Do not return missing observations. 
  
surveys %>%
  filter(!is.na(weight)) %>% 
  group_by(year) %>% 
  summarise(max_weight = max(weight)) %>% 
  arrange(desc(max_weight))

surveys %>% 
  filter(!is.na(weight)) %>% 
  #group_by(year) %>% 
  filter(weight == max(weight)) %>%
  select(year, genus, species_id, weight) %>% 
  arrange(desc(weight))

surveys_complete <- 
  surveys %>% 
  filter(!is.na(weight), !is.na(hindfoot_length), !is.na(sex))


#keep the species for which there are at least 50 observations
species_counts <- surveys_complete %>%
  count(species_id) %>% 
  filter(n >- 50)


#reduce the surveys_complete object so that it only 
#contains species with at least 50 observation (these species are in object species_count)

numerous_species <- species_counts$species_id

surveys_complete <- 
  surveys_complete %>% 
  filter(species_id %in% numerous_species)

dim(surveys_complete)

write_csv(surveys_complete, 'data/surveys_complete.csv')


#how to plot using ggplot2

ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) + geom_point()

surveys_plot <- ggplot(data = surveys_complete, mapping = aes(x = weight, y = hindfoot_length)) + geom_point()

surveys_plot + geom_point()



















  
  
  
  
  
  
  
  
  




  



  
  
  
  
  
  
  
  
  
  






























  


