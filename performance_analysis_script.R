data <- read.csv("D:/male_players.csv")
columns <- names(data)

# Data preprocessing
#check for mixed type columns. a column having mixed numeric and str types might throw errors later, 
#we want to eliminate such errors

character_columns <- sapply(data, is.character)

# Initialize a vector to hold names of columns that might truly have mixed types
potential_mixed_columns <- vector()

for (column in names(data)) {
  if (is.character(data[[column]])) {
    temp <- suppressWarnings(as.numeric(data[[column]]))
    if (any(is.na(temp)) && any(!is.na(data[[column]]))) {
      potential_mixed_columns <- c(potential_mixed_columns, column)
    }
  }
}

# Print the names of columns that might truly have mixed types
cat("Columns that might have mixed types:", paste(potential_mixed_columns, collapse=", "), "\n")


#checking for missing values
summary_list <- list()
summary_list <- vector()
for (column in names(data)) {
  if (any(is.na(data[[column]]))) {
    summary_list <- c(summary_list, column)
  }
}
print(summary_list)
print(summary_list)
print(mixed_columns)

install.packages("dplyr")
library(dplyr)
data <- data %>% distinct(short_name, .keep_all = TRUE)

library(stringr)






#Manager has a budget. He wants a striker - high main priorities
#1. high pace
#2. high workrate
#3. market value 75 million euros.



install.packages("ggplot")

library(dplyr)
library(stringr)

# Further filter for players whose market value is not more than 75 million euros
affordable_strikers <- high_work_rate_strikers %>%
  filter(value_eur <= 55000000)

# Sort the affordable strikers by 'pace' in descending order
sorted_strikers <- affordable_strikers %>%
  arrange(desc(pace))

# Calculate a composite score based on prioritized attributes for the top 5 strikers
top_5_strikers_with_score <- sorted_strikers %>%
  head(5) %>%
  mutate(composite_score = (attacking_finishing * 0.4) + 
           (passing * 0.3) + 
           (attacking_short_passing * 0.2) + 
           (dribbling * 0.1)) %>%
  # Select relevant columns to display including the composite score
  select(short_name, pace, work_rate, value_eur, attacking_finishing, passing, attacking_short_passing, dribbling, composite_score)

# Print the top 5 strikers' details including their composite scores
print(top_5_strikers_with_score)







#Plotting Results

#install.packages("plotly")
#install.packages("purrr")
library(ggplot2)
library(plotly)

library(tidyr)
library(ggplot2)
library(plotly)

library(fmsb)
# this radar chart is for individual strikers and their attributes but its difficult to view one by one
create_radar_chart_for_each_player <- function(data, attributes) {
 
  for (i in 1:nrow(data)) {
   
    player_data <- sapply(data[i, attributes], function(x) {
      tryCatch(as.numeric(x), error = function(e) NA)
    })
    
    player_data[is.na(player_data)] <- 0
    max_values <- apply(data[, attributes], 2, max, na.rm = TRUE)
    min_values <- apply(data[, attributes], 2, min, na.rm = TRUE)
    normalized_player_data <- (player_data - min_values) / (max_values - min_values)
    
    radar_df <- data.frame(t(c(normalized_player_data)))
    colnames(radar_df) <- attributes
    radar_base <- setNames(data.frame(t(rep(1, length(attributes)))), attributes)
    radar_df <- rbind(radar_base, radar_base * 0, radar_df) 
    row.names(radar_df) <- c("Max", "Min", as.character(data[i, "short_name"]))
    
    
    radarchart(radar_df, axistype = 1,
               pcol = c("red", "blue", "green"), 
               plwd = c(2, 2, 2), 
               plty = 1, 
               pdensity = 0, 
               title = paste("Attributes of", data[i, "short_name"]))
  }
}

attributes <- c('pace', 'shooting', 'passing', 'dribbling', 'defending', 'physic', 
                'attacking_crossing', 'attacking_finishing', 'attacking_heading_accuracy', 
                'attacking_short_passing')
create_radar_chart_for_each_player(top_5_strikers, attributes)

# we solved the challenge using a combined radar chart
library(fmsb)

create_combined_radar_chart <- function(data, attributes) {

  max_values <- apply(data[, attributes], 2, max, na.rm = TRUE)
  min_values <- apply(data[, attributes], 2, min, na.rm = TRUE)

  normalized_data_list <- list()
  

  for (i in 1:nrow(data)) {
    player_data <- sapply(data[i, attributes], function(x) tryCatch(as.numeric(x), error = function(e) NA))
    player_data[is.na(player_data)] <- 0 
    normalized_player_data <- (player_data - min_values) / (max_values - min_values)
    normalized_data_list[[i]] <- normalized_player_data
  }
  
 
  combined_normalized_data <- do.call(rbind, normalized_data_list)
  radar_base <- setNames(data.frame(t(rep(1, length(attributes)))), attributes)
  radar_combined <- rbind(radar_base, radar_base * 0, combined_normalized_data)
  row.names(radar_combined) <- c("Max", "Min", data$short_name)

  colors <- rainbow(nrow(data))

  radarchart(radar_combined, axistype = 1,
             pcol = colors, 
             plwd = 2, 
             plty = 1, 
             pdensity = 0, 
             title = "Attributes of Top 5 Strikers")

  legend("topright", legend = data$short_name, col = colors, lwd = 2, cex = 0.7)
}


attributes <- c('pace', 'shooting', 'passing', 'dribbling', 'defending', 'physic', 
                'attacking_crossing', 'attacking_finishing', 'attacking_heading_accuracy', 
                'attacking_short_passing')

create_combined_radar_chart(top_5_strikers, attributes)








#find the one top player based on other [prioritised attributes]
library(dplyr)
library(stringr)

# Assuming 'top_5_strikers' is already defined
# Calculate a composite score and then rank players based on that score
top_player <- top_5_strikers %>%
  mutate(composite_score = (attacking_finishing * 0.4) + 
           (passing * 0.3) + 
           (attacking_short_passing * 0.2) + 
           (dribbling * 0.1)) %>%
  mutate(rank = rank(-composite_score)) %>%
  filter(rank == 1) %>%
  select(short_name, attacking_finishing, passing, attacking_short_passing, dribbling, player_face_url, composite_score, rank)

# Print the top player based on composite score
print(top_player)

install.packages("htmltools")
install.packages("knitr")
install.packages("markdown")
library(htmltools)
library(knitr)



library(htmltools)

# Construct the HTML content
html_content <- tags$div(
  tags$img(src = top_player$player_face_url[1], width = "100", height = "100"),
  tags$ul(
    tags$li(paste("Short Name:", top_player$short_name[1])),
    tags$li(paste("Attacking Finishing:", top_player$attacking_finishing[1])),
    tags$li(paste("Passing:", top_player$passing[1])),
    tags$li(paste("Attacking Short Passing:", top_player$attacking_short_passing[1])),
    tags$li(paste("Dribbling:", top_player$dribbling[1]))
  )
)

# Use the Viewer to display the HTML content
browsable(html_content)



library(dplyr)
library(stringr)



#Manager wants a fullback age between 18 and 21 strong defensive atributes
#clubs wants to give him a longterm contract and spend well

# Filter for fullbacks (Left Wing Backs or Right Wing Backs)
fullbacks <- data %>%
  filter(str_detect(player_positions, "LWB|RWB"))

# Further filter for players within the age range of 18 to 20 years old
age_filtered_fullbacks <- fullbacks %>%
  filter(age >= 18 & age <= 20)

# Further filter for players whose market value is not more than 75 million euros
affordable_fullbacks <- age_filtered_fullbacks %>%
  filter(value_eur <= 75000000) # Adjusted to match the 75 million condition

# Sort the affordable and age-appropriate fullbacks by the specified attributes in descending order
sorted_fullbacks <- affordable_fullbacks %>%
  arrange(desc(power_stamina), desc(pace), desc(mentality_aggression), desc(mentality_interceptions))

# Calculate a composite score based on prioritized attributes for the top 5 fullbacks
top_5_fullbacks_with_score <- sorted_fullbacks %>%
  head(5) %>%
  mutate(composite_score = (power_stamina * 0.4) + 
           (pace * 0.3) + 
           (mentality_aggression * 0.2) + 
           (mentality_interceptions * 0.1)) %>%
  # Select relevant columns to display including the composite score
  select(short_name, 'attacking_crossing',
         'dribbling',
         'defending',
         'mentality_interceptions',
         'mentality_vision',
         'defending_marking_awareness',
         'defending_standing_tackle','player_face_url',
         'defending_sliding_tackle', composite_score)

# Print the top 5 fullbacks' details including their composite scores
print(top_5_fullbacks_with_score)



attributes <- c(
  'attacking_crossing',
  'dribbling',
  'defending',
  'mentality_interceptions',
  'mentality_vision',
  'defending_marking_awareness',
  'defending_standing_tackle',
  'defending_sliding_tackle'
)

# Call the modified function with the new attributes and updated DataFrame
# Ensure 'top_5_fullbacks' is already defined and contains the relevant attributes in lowercase
create_combined_radar_chart(top_5_fullbacks_with_score, attributes)


# Assuming 'top_5_fullbacks' is your DataFrame that contains the top 5 fullbacks
top_fullback <- top_5_fullbacks_with_score %>%
  mutate(composite_score = (attacking_crossing * 0.2) + 
           (dribbling * 0.2) +
           (defending * 0.2) +
           (mentality_interceptions * 0.2) +
           (mentality_vision * 0.2)) %>%
  mutate(rank = rank(-composite_score)) %>%
  filter(rank == 1) %>%
  select(short_name, attacking_crossing, dribbling, defending, 
         mentality_interceptions, mentality_vision, player_face_url, composite_score, rank)

# Print the top fullback's details
print(top_fullback)

html_content_fullback <- tags$div(
  tags$img(src = top_fullback$player_face_url[1], width = "100", height = "100"),
  tags$ul(
    tags$li(paste("Short Name:", top_fullback$short_name[1])),
    tags$li(paste("Attacking Crossing:", top_fullback$attacking_crossing[1])),
    tags$li(paste("Dribbling:", top_fullback$dribbling[1])),
    tags$li(paste("Defending:", top_fullback$defending[1])),
    tags$li(paste("Mentality Interceptions:", top_fullback$mentality_interceptions[1])),
    tags$li(paste("Mentality Vision:", top_fullback$mentality_vision[1]))
  )
)

# Use the Viewer to display the HTML content for the top fullback
browsable(html_content_fullback)

install.packages("GGally")

# Assuming 'top_5_fullbacks' is already loaded into your R session

library(GGally)
library(dplyr)
library(tidyr)

#Parallel Coordinates Plot
normalized_data <- top_5_fullbacks_with_score %>%
  select(short_name, attacking_crossing, dribbling, defending, 
         mentality_interceptions, mentality_vision, 
         defending_marking_awareness, defending_standing_tackle, defending_sliding_tackle) %>%
  mutate(across(attacking_crossing:defending_sliding_tackle, scale)) #
ggparcoord(data = normalized_data, 
           columns = 2:ncol(normalized_data),  
           groupColumn = 1,  # Grouping by the first column which should be 'short_name'
           scale = "globalminmax") +
  scale_color_discrete(name = "Player") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Parallel Coordinates Plot of Top 5 Fullbacks",
       x = "Attributes", 
       y = "Normalized Score")

