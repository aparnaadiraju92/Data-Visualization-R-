# Kiva Crowdfunding Data Visualization

**Data Visualization in R**

This repository will help Data Analytics enthusiasts in you developing some basic plots treemap, bar plots, pie charts etc., I used the Kaggle Competition "Kiva Crowdfunding" as the data source to perform this exercise.

Data for analysis: https://www.kaggle.com/kiva/data-science-for-good-kiva-crowdfunding

## 1. Introduction

**Data Visualization and it's importance**

*As Fred R. Barnard rightly says, A picture is worth a thousand words. Data Visualization is an important and crucial tool in today’s data-focused business world.*

*Here is the link to the article that provides us with an understanding about the importance of Data Visualization* **https://thekinigroup.com/importance-data-visualization/**

Programming Language: R 

Package used to create Visualizations : [ggplot2](https://cran.r-project.org/web/packages/ggplot2/index.html)

## 2. Key Concepts and Learnings

   *1. Combining various plots into one plot using grid package's pushViewport function.*
   
   *2. There are two types of bar charts - geom_bar(), geom_col(). 
         geom_bar uses stat_count. It counts number of observations at each position of x. While, geom_col usses stat_identity , thus leaving the data as is.*
         
   *3. Treemaps display hierarchical data as a set of nested rectangles. When the color and size dimensions are correlated in some way with the tree structure, one can often easily see patterns that would be difficult to spot in other ways, such as if a certain color is particularly relevant.*
   
   *4. Word cloud gives us a greater prominence to words that appear more frequently in the source text.*
   
   *5. [Leaflet](https://rstudio.github.io/leaflet/) package is an interface to the JavaScript library Leaflet to create interactive web maps.*
   
   *6. Time series is a series of data points indexed (or listed or graphed) in time order.*
   
   
## 3. Analysis

**Approach to the solution**

   The R code for the below solution is provided in the [.R file](https://github.com/aparnaadiraju92/Kiva-Crowdfunding-Data-Visualization-/blob/master/Rcode_Kaggle_KivaCrowdfunding.R)

###### #--------Part-1--------#
 1. Work directory
 2. Installing the required packages
 3. Loading necessary libraries
 4. Reading data into R


###### #--------Part-2--------#
 5. Data Exploration
 
 ###### #--------Part-3--------#
 6. Data Visualizations 
 
    **PLOT 1 - Bar plots (using geom_col()) 2x2 plot - Flipped**
    ![alt text](https://github.com/aparnaadiraju92/Kiva-Crowdfunding-Data-Visualization-/blob/master/Plots/Plot1.PNG)
     
    **PLOT 2 - Tree map**
    ![alt text](https://github.com/aparnaadiraju92/Kiva-Crowdfunding-Data-Visualization-/blob/master/Plots/Plot2.PNG)
    
    **PLOT 3 - Pie Chart**
    <img src="https://github.com/aparnaadiraju92/Kiva-Crowdfunding-Data-Visualization-/blob/master/Plots/Plot3.PNG" data-canonical-src="https://github.com/aparnaadiraju92/Kiva-Crowdfunding-Data-Visualization-/blob/master/Plots/Plot3.PNG" width="300" height="300" />
      
    **PLOT 4 - Word Cloud**
    
    ![alt text](https://github.com/aparnaadiraju92/Kiva-Crowdfunding-Data-Visualization-/blob/master/Plots/Plot4.PNG)
      
      
    **PLOT 5 - Bar plot (using goem_col())**
    ![alt text](https://github.com/aparnaadiraju92/Kiva-Crowdfunding-Data-Visualization-/blob/master/Plots/Plot5.PNG)
      
      
    **PLOT 6 - Histogram**
    ![alt text](https://github.com/aparnaadiraju92/Kiva-Crowdfunding-Data-Visualization-/blob/master/Plots/Plot6.PNG)
      
    **PLOT 7 - using geom_count()**
    ![alt text](https://github.com/aparnaadiraju92/Kiva-Crowdfunding-Data-Visualization-/blob/master/Plots/Plot7.PNG)
      
    **PLOT 8 - using facet_grid()**
    ![alt text](https://github.com/aparnaadiraju92/Kiva-Crowdfunding-Data-Visualization-/blob/master/Plots/Plot8.PNG)
      
    **PLOT 9 - using leaflet**
    ![alt text](https://github.com/aparnaadiraju92/Kiva-Crowdfunding-Data-Visualization-/blob/master/Plots/Plot9.PNG)
      
    **PLOT 10 - Time series**
    ![alt text](https://github.com/aparnaadiraju92/Kiva-Crowdfunding-Data-Visualization-/blob/master/Plots/Plot10.PNG)
