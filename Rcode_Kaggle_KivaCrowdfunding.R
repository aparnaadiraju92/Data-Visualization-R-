# Introduction:
# Kiva Crowdfunding - Kaggle project
# Author - Aparna Adiraju

# ------------------- PART - 1 -------------------- #
# 1. Work directory
# 2. Installing the required packages
# 3. Loading necessary libraries
# 4. Reading data into R

# 1. checking the working directory
getwd()

# set working directory (* if required)
setwd("C:/Users/aparn/OneDrive/Documents/Learn_Extra/_Kaggle_Kiva Crowdfunding")

# 2. Installing all the necessary packages
install.packages(c("dplyr", "ggplot2", "grid", "treemap", "leaflet", "lubridate", 
                   "tm", "wordcloud"))


# 3. Loading all the necessary libraries 
library(dplyr)
library(ggplot2)
library(grid) # for pushViewport 
library(stringr)
library(treemap)
library(leaflet)
library(lubridate)
library(tm)
library(wordcloud)


# 4. Read and pull the datasets to R
oloans <- read.csv("kiva_loans.csv", stringsAsFactors = FALSE, na.strings=c("","NA"))
oregionloc <- read.csv("kiva_mpi_region_locations.csv", stringsAsFactors = FALSE, na.strings=c("","NA"))
othemeids <- read.csv("loan_theme_ids.csv", stringsAsFactors = FALSE, na.strings=c("","NA"))
othemeregions <- read.csv("loan_themes_by_region.csv", stringsAsFactors = FALSE, na.strings=c("","NA"))


# ------------------- PART - 2 -------------------- #

# 5. Data Exploration

##Glimpse of all the 4 Data Frames
glimpse(oloans)
glimpse(oregionloc)
glimpse(othemeids)
glimpse(othemeregions)

##Check data to see if there are missing values.
length(which(!complete.cases(oloans)))
length(which(!complete.cases(oregionloc)))
length(which(!complete.cases(othemeids)))
length(which(!complete.cases(othemeregions)))

##Summary of all the 4 Data Frames
summary(oloans)
summary(oregionloc)
summary(othemeids)
summary(othemeregions)


# ------------------- PART - 3 -------------------- #

# 6. Data Visualization
#    PLOT 1 - Bar plots (using geom_col()) 2*2 plot - Flipped
#    PLOT 2 - Tree map
#    PLOT 3 - Pie Chart
#    PLOT 4 - Word Cloud
#    PLOT 5 - Bar plots 
#    PLOT 6 - Histogram
#    PLOT 7 - using geom_count()
#    PLOT 8 - using facet_grid()
#    PLOT 9 - using leaflet
#    PLOT 10 - Time series


#    PLOT 1 - Bar plots (using geom_col()) 2*2 plot 

plot1_1 <- 
  oloans %>%
  mutate(country = trimws(country)) %>%
  filter(!is.na(country)) %>%
  group_by(country) %>%
  summarise(Count = n()) %>%
  arrange(desc(Count)) %>%
  ungroup() %>%
  mutate(country = reorder(country,Count)) %>%
  top_n(10, Count) %>%
  
  ggplot(aes(x = country,y = Count)) +
  geom_bar(stat='identity',colour="white", fill = 'yellow3') +
  geom_text(aes(x = country, y = 1, label = paste0("(",Count,")",sep="")),
            hjust=0, vjust=.5, size = 4, colour = 'black',
            fontface = 'bold') +
  labs(x = 'Country', 
       y = 'Count', 
       title = 'Country and Loans') +
  coord_flip() +
  theme( legend.position = "none",
         plot.title=element_text(hjust = 0.5, size=14, face="bold")) 

plot1_2 <- 
  oloans %>%
  mutate(sector = trimws(sector)) %>%
  filter(!is.na(sector)) %>%
  group_by(sector) %>%
  summarise(Count = n()) %>%
  arrange(desc(Count)) %>%
  ungroup() %>%
  mutate(sector = reorder(sector,Count)) %>%
  top_n(10, Count) %>%
  
  ggplot(aes(x = sector,y = Count)) +
  geom_bar(stat='identity',colour="white", fill = 'violet') +
  geom_text(aes(x = sector, y = 1, label = paste0("(",Count,")",sep="")),
            hjust=0, vjust=.5, size = 4, colour = 'black',
            fontface = 'bold') +
  labs(x = 'Sector', 
       y = 'Count', 
       title = 'Sector and Loans') +
  coord_flip() +
  theme( legend.position = "none",
         plot.title=element_text(hjust = 0.5, size=14, face="bold")) 


plot1_3 <- 
  oloans %>%
  mutate(activity = trimws(activity)) %>%
  filter(!is.na(activity)) %>%
  group_by(activity) %>%
  summarise(Count = n()) %>%
  arrange(desc(Count)) %>%
  ungroup() %>%
  mutate(activity = reorder(activity,Count)) %>%
  top_n(10, Count) %>%
  
  ggplot(aes(x = activity,y = Count)) +
  geom_bar(stat='identity',colour="white", fill = 'orangered1') +
  geom_text(aes(x = activity, y = 1, label = paste0("(",Count,")",sep="")),
            hjust=0, vjust=.5, size = 4, colour = 'black',
            fontface = 'bold') +
  labs(x = 'Activity', 
       y = 'Count', 
       title = 'Activity and Loans') +
  coord_flip() +
  theme( legend.position = "none",
         plot.title=element_text(hjust = 0.5, size=14, face="bold")) 

plot1_4 <- 
  oloans %>%
  filter(!is.na(borrower_genders)) %>%
  mutate(gender = ifelse(str_detect(borrower_genders,"female"), "female","male")) %>%
  group_by(gender) %>%
  summarise(Count = n()) %>%
  arrange(desc(Count)) %>%
  ungroup() %>%
  mutate(gender = reorder(gender,Count)) %>%
  top_n(10, Count) %>%
  
  ggplot(aes(x = gender,y = Count)) +
  geom_bar(stat='identity',colour="white", fill = 'cyan') +
  geom_text(aes(x = gender, y = 1, label = paste0("(",Count,")",sep="")),
                hjust=0, vjust=.5, size = 4, colour = 'black',
                fontface = 'bold') +
  labs(x = 'Gender', 
       y = 'Count', 
       title = 'Gender and Loans') +
  coord_flip() +
  theme( legend.position = "none",
         plot.title=element_text(hjust = 0.5, size=14, face="bold"))


pushViewport(viewport(layout = grid.layout(2, 2)))
print(plot1_1, vp = viewport(layout.pos.row = 1, layout.pos.col = 1))
print(plot1_2, vp = viewport(layout.pos.row = 1, layout.pos.col = 2))
print(plot1_3, vp = viewport(layout.pos.row = 2, layout.pos.col = 1))
print(plot1_4, vp = viewport(layout.pos.row = 2, layout.pos.col = 2))

#    PLOT 2 - Treemap

plot2 <- 
  oloans %>%
  group_by(country) %>%
  summarise(FundedAmount = sum(funded_amount)) %>%
  arrange(desc(FundedAmount)) %>%
  ungroup() %>%
  mutate(country = reorder(country,FundedAmount)) %>%
  top_n(25, FundedAmount) %>%
 
  treemap(index="country", 
        vSize = "FundedAmount",  
        title="Top 25 countries with maximum Funded Amounts", 
        palette = "RdBu",
        fontsize.title = 14, fontface.labels = "bold" )

print(plot2)


#    PLOT 3 - Pie Chart

plot3 <- 
  oloans %>%
  filter(!is.na(borrower_genders)) %>%
  mutate(gender = ifelse(str_detect(borrower_genders,"female"), "female","male")) %>%
  group_by(gender) %>%
  summarize(FundedAmount = sum(funded_amount)) %>%
  
  
  ggplot(aes(x="", y=FundedAmount, fill = gender)) + 
  geom_bar(width = 1, stat = "identity") + 
  
  labs(title = 'Gender and Funded Amounts') +
  geom_text(aes(label=paste0('Gender: ',gender, '\n', 
                             FundedAmount, '\n', 
                             round(FundedAmount / sum(FundedAmount) * 100, 3),
                             "%")), 
            position = position_stack(vjust = 0.5),
            fontface = 'bold') +
  coord_polar("y") +
  theme(legend.position = "none",
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid  = element_blank(),
        panel.border = element_blank(),
        plot.title=element_text(hjust = 0.5, size=14, face="bold"))

print(plot3)

#    PLOT 4 - Word Cloud

## Function for creating DTM 
funcTDM <- function(input) {
  my_source <- VectorSource(input)
  corpus<-Corpus(my_source)
  corpus<- tm_map(corpus, tolower)
  corpus <- tm_map(corpus, removePunctuation)
  corpus <- tm_map(corpus, removeWords, stopwords("english"))
  corpus<- tm_map(corpus, stemDocument)
  
  ##Create the dtm again with the new corpus
  tdm <- TermDocumentMatrix(corpus)
  tdm <- removeSparseTerms(tdm, 0.997)
  input_dmatrix <- as.matrix(tdm)
  
  return(input_dmatrix)
}

## Description - Word cloud
DescTDM <- funcTDM(oloans$use)
Desc_termfreq <- rowSums(DescTDM)
Desc_wordfreq <- data.frame(terms = names(Desc_termfreq), num = Desc_termfreq)

pal <- brewer.pal(8, "Dark2")

plot4 <- wordcloud(Desc_wordfreq$terms, Desc_wordfreq$num,
                   scale = c(4,0.5),
                   min.freq = 2, max.words = 150,
                   random.order = T,
                   rot.per = .05,
                   colors = pal
)

print(plot4)

#    PLOT 5 - Bar plot (using geom_col())

plot5 <- 
  oloans %>%
  group_by(sector) %>%
  summarize(FundedAmount = sum(funded_amount),
            Count = n()) %>%
  
  ggplot(aes(x=sector, y=FundedAmount, fill = sector)) + 
  geom_col() + 
  geom_text(aes(label=paste0('Count: ', Count, '\n', 
                             'Amount: ',FundedAmount)), 
            position = position_stack(vjust = 1.05)) +
  labs(x = 'Sector', y = 'Funded Amount', 
       title = 'Funded Amount for Sectors') +
  theme(legend.position = "none",
        panel.grid  = element_blank(),
        panel.border = element_blank(),
        plot.title=element_text(hjust = 0.5, size=14, face="bold"))  
  
print(plot5)
  

#    PLOT 6 - Histogram

plot6 <-
  oloans %>%
  ggplot(aes(term_in_months)) +
  geom_histogram(breaks = seq(0, 200, by = 10),
                 col = "black",
                 fill = "green", 
                 alpha = 0.25) +
  labs(title = "Histogram for Term in Months", x = "Terms in Months", y = "Count") +
  xlim(c(20, 200)) + 
  ylim(c(0, 1500)) +
  theme(plot.title=element_text(hjust = 0.5, size=14, face="bold"))  


print(plot6)


#    PLOT 7 - using geom_count()

plot7 <-
  oloans %>%
  ggplot(aes(term_in_months, lender_count)) +
  geom_count(shape = 17, alpha = 0.7, color = 'chocolate4') +
  labs(title = "Term in Months and Lender Count", x = "Terms in Months", y = "Lender Count") +
  xlim(c(100, 150)) + 
  ylim(c(0, 100)) +
  theme(legend.position = "left", plot.title=element_text(hjust = 0.5, size=14, face="bold")) +
  guides(size = guide_legend("title"))

print(plot7)

#    PLOT 8 - using facet_grid()

plot8 <- 
   oloans %>% 
   group_by(country, repayment_interval) %>% 
   summarize(Count = n()) %>%
   arrange(desc(Count)) %>%
   ungroup() %>%
   head(25) %>%
  
   ggplot(aes(x = country, y = Count, fill = repayment_interval)) +
   geom_col()  +
   labs(title = "Country and Repayment Intervals", x = "Country", y = "") +
   theme(legend.position = "bottom", plot.title=element_text(hjust = 0.5, size=14, face="bold")) + 
   guides(fill=guide_legend(title="Repayment Interval")) +
   facet_grid(repayment_interval ~., scales = "free", labeller = label_parsed) 
   
print(plot8)


#    PLOT 9 - using leaflet

plot9_data <- 
  othemeregions %>%
  filter(country == "India") 
  
  longitude = median(plot9_data$lon, na.rm = TRUE)
  latitude = median(plot9_data$lat, na.rm = TRUE)
  
  
plot9 <- 
  leaflet(plot9_data) %>% addTiles() %>%
  addCircles(lng = ~lon, lat = ~lat, radius = ~(amount/10) ,
             color = ~c("darkblue"))  %>%
  addMarkers(lng=longitude, lat=latitude, popup="India") %>%
  setView(lng=longitude, lat=latitude,zoom = 5) 

print(plot9)


#    PLOT 10 - Time Series

plot10 <- oloans %>%
  filter(country == "India") %>%
  filter(!is.na(funded_time)) %>%
  mutate(Year = year(ymd_hms(funded_time))) %>%
  mutate(Month = month(ymd_hms(funded_time))) %>%
  filter(!is.na(Year)) %>%
  filter(!is.na(Month)) %>%
  group_by(Year,Month) %>%
  summarise(Count = n()) %>%
  mutate(YearMonth = make_date(year=Year,month=Month) ) %>%

  ggplot(aes(x=YearMonth,y=Count,group = 1)) +
  geom_line(size=1.5, color="green")+
  geom_point(size=2, color="blue") +
  labs(x = 'Year', y = 'Loans Count',title = 'Trend of Loans over years') +
  theme(plot.title=element_text(hjust = 0.5, size=14, face="bold")) 

print(plot10)
