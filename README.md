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
Objective: Identify high-potential strikers based on pace, workrate, and market value to enhance offensive play.

Approach:

Filtering: Isolate strikers using position data.
Criteria: Focus on pace (speed and ability to outrun defenders), workrate (commitment and energy on the field), and market value (worth reflecting skill and demand).
Analysis: Employ statistical summaries and comparative analysis to select players with high ratings in these areas, considering both quantitative attributes and qualitative factors like growth potential and performance consistency.
Fullback Selection
Objective: Target young, promising fullbacks with strong defensive attributes for team's defensive lineup.

Approach:

Emphasis: More on defensive skills and growth potential compared to strikers.
Criteria: Assess defensive ratings (tackling, interceptions, positioning), stamina (for both defensive and offensive contributions), and age (focus on younger players with development potential).
Preprocessing and Analysis: Filter for fullbacks, apply criteria-specific filters, and use statistical tools to evaluate players, prioritizing those meeting or exceeding desired benchmarks.

## Visualization

### Combined Fullback Radar
![Combined Fullback Radar](/path/to/combined_fullback_radar.png)

### Combined Parallel Plot for Fullbacks
![Combined Parallel Plot for Fullbacks](/path/to/combined_paralleplot_fullback.png)

### Combined Striker Radar
![Combined Striker Radar](/path/to/combined_striker_radar.png)

### Individual Player Radar
![Individual Player Radar](/path/to/individual_player_radar.png)

### Top Striker Viewer
![Top Striker Viewer](/path/to/top_one_striker_viewer.png)

