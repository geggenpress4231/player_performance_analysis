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




## Data Preprocessing
Mixed-Type Column Identification
Overview: Essential for data integrity, this process detects and flags columns mixing numeric and string values to prevent analysis errors.

Code Insight: Uses sapply(data, is.character) and as.numeric() conversion, identifying columns that cause NA values, indicating mixed types.

Missing Values Assessment
Overview: Critical for ensuring analysis accuracy, missing values are identified to guide corrective actions like imputation or exclusion.

Code Insight: Iterates with is.na(data[[column]]), summarizing missing data to inform further handling strategies.

Duplicate Entry Removal
Overview: Vital for data accuracy, duplicates are removed to ensure unique representation of each player, avoiding skewed results.

Code Insight: Employs dplyr's distinct(short_name, .keep_all = TRUE), eliminating duplicates based on the short_name column.

## Analysis

Striker Selection
Objective: The primary goal in striker selection was to identify prospects with high potential based on specific criteria such as pace, workrate, and market value. The focus was on finding players who could contribute significantly to the offensive play, showcasing speed, agility, and the ability to consistently perform at a high level.

Approach: To tackle this objective, a multifaceted analysis was conducted. Initially, the dataset was filtered to isolate strikers, utilizing positions data. Following this, the focus shifted to evaluating each player based on the identified criteria:

Pace: A key attribute for strikers, indicating the ability to outrun defenders. Players were ranked based on their pace attribute, prioritizing those with higher ratings.
Workrate: This reflects a player's commitment and energy on the field, both in offensive and defensive actions. High workrate players were considered valuable for their ability to contribute across the field.
Market Value: An indicator of a player's worth, which can reflect their skill level, potential, and demand in the football market. Players with high market values were considered for their proven or perceived abilities.
Data analysis techniques, including statistical summaries and comparative analysis, were employed to sift through the dataset and identify players who excelled in these areas. The selection process involved both quantitative analysis of the attributes and qualitative considerations, such as potential for growth and consistency in performance.

Fullback Selection
Objective: The aim here was to pinpoint young, promising fullbacks with strong defensive attributes. The focus was on defensive capabilities, stamina, and the potential to develop into key players for a team's defensive lineup.

Approach: The selection process for fullbacks differed slightly from that of strikers, with a stronger emphasis on defensive skills and potential for growth. The steps were as follows:

Defensive Attributes: Players were assessed based on their defensive ratings, including tackling, interceptions, and defensive positioning. High ratings in these areas were crucial for selection.
Stamina: Given the demanding nature of the fullback position, which requires players to contribute both defensively and offensively, stamina was a key attribute. Players with high stamina ratings were prioritized.
Age: A focus on younger players was integral to this selection process, aiming to identify those with the potential for significant development and long-term contributions to their teams.
Data preprocessing included filtering the dataset for fullbacks and then applying criteria-specific filters to identify suitable candidates. Statistical analysis tools were used to evaluate players, focusing on those who met or exceeded the benchmarks for the desired attributes.
