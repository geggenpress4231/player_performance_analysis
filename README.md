# Association Football Player Analysis Project

## Project Overview

This project aims to identify top association football player prospects for two key positions: strikers and fullbacks. Utilizing data from a comprehensive dataset of male players, we employ various data analysis techniques to process, analyze, and visualize player statistics. Our goal is to find players who match specific criteria, including pace, workrate, and market value for strikers, and defensive attributes for young fullbacks.

Dataset Source: [FIFA Players Dataset on Kaggle](https://www.kaggle.com/datasets/joebeachcapital/fifa-players?select=male_players_23.csv)

## Table of Contents

- [Installation](#installation)
- [Data Preprocessing](#data-preprocessing)
- [Analysis](#analysis)
  - [Striker Selection](#striker-selection)
  - [Fullback Selection](#fullback-selection)
- [Results](#results)
- [Visualization](#visualization)


## Installation

This project requires R and the following R libraries:

- `dplyr`
- `stringr`
- `ggplot2`
- `plotly`
- `fmsb`
- `GGally`
- `htmltools`
- `knitr`
- `markdown`

To replicate this analysis, clone this repository to your local machine:

```bash
git clone https://github.com/geggenpress4231/player_performance_analysis

##Data Preprocessing
Checking for Mixed-Type Columns
The first step involves identifying columns that contain mixed data types, specifically columns that might have both numeric and string values. This is crucial because mixed-type columns can cause errors later in the analysis. The process starts by checking each column to see if it's of character type. For these character columns, an attempt is made to convert them to numeric. If the conversion results in NA for some entries but not others, it suggests that the column contains mixed types—numeric values that could be converted and non-numeric strings that couldn't. Identifying these columns allows you to decide how to handle them, whether by cleaning, splitting, or converting the data to a consistent format.

Checking for Missing Values
Next, you address the issue of missing values in the dataset. Missing values can lead to biased analyses and incorrect conclusions. The provided code iterates through each column, checking for NA values. By summarizing the missing values for each column, you gain insight into the completeness of your data. This step is critical for deciding on further actions, such as imputing missing values, removing rows or columns with too many missing values, or acknowledging these gaps in your analysis.

Removing Duplicate Entries
Duplicate entries in a dataset can skew results and give an inaccurate representation of the data. In your project, you focus on ensuring that each football player is represented only once. This is achieved by removing duplicate rows based on the short_name column, which presumably contains the players' names. Using the distinct function from the dplyr package, you keep the first occurrence of each player and remove subsequent duplicates, thus cleaning the data and preventing any biased analysis caused by redundancy.


