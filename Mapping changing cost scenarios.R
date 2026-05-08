---
  title: "SetChangeMaps for Trip Cost Changes Scenarios"
output: html_document
---
  
  # Purpose
#The purpose of this script is to create maps of projected change in seep sets as a result of changing trip costs. 

# Clear workspace
rm(list=ls())

# Set working directory
mainDir <- 'G:/Location Choice Modeling/Model results/Final Models/'  ## Change this to fit the directory you are working in

setwd(mainDir)

install.packages('here')
install.packages('scales')

# Set up environment
library(tidyverse, quietly = TRUE)
library(here)
library(readxl)
library(scales)


# Load data
ModeledCostChange<-read.csv("G:/Location Choice Modeling/Model results/Final Models/Scenario Changes from cost increase and decrease.csv")
str(ModeledCostChange)     #n=68.


# Convert to 360-deg longitude
ModeledCostChange$LonCenter <- ModeledCostChange$LonCenter + 360

# Create each panel and combine in Illustrator
X40inccostmap <- ggplot(ModeledCostChange, aes(LonCenter, LatCenter, fill = X40inccost)) + 
  geom_tile() + 
  scale_fill_gradientn(colours=c("blue","white","red"),
                       limits = c(-800,500),
                       values = rescale(c(-800, 0, 500))) +
  coord_quickmap(c(180.5, 244.5), ylim = c(-0.5, 43.5)) +
  annotation_borders("world2", fill = "#A5AAAF") 
X40inccostmap
pdf(here("Figures", "X40inccostmap.pdf"))
ggsave("G:/Location Choice Modeling/Data/For paper/X40inccostmap.jpg", width = 10, height = 10, units = "in")
dev.off()


X20inccostmap <- ggplot(ModeledCostChange, aes(LonCenter, LatCenter, fill = X20inccost)) + 
  geom_tile() + 
  scale_fill_gradientn(colours=c("blue","white","red"),
                       limits = c(-800,500),
                       values = rescale(c(-800, 0, 500))) +
  coord_quickmap(c(180.5, 244.5), ylim = c(-0.5, 43.5)) +
  annotation_borders("world2", fill = "#A5AAAF") 
X20inccostmap
pdf(here("Figures", "X20inccostmap.pdf"))
ggsave("G:/Location Choice Modeling/Data/For paper/X20inccostmap.jpg", width = 10, height = 10, units = "in")
dev.off()


X40deccostmap <- ggplot(ModeledCostChange, aes(LonCenter, LatCenter, fill = X40deccost)) + 
  geom_tile() + 
  scale_fill_gradientn(colours=c("blue","white","red"),
                       limits = c(-800,500),
                       values = rescale(c(-800, 0, 500))) +
  coord_quickmap(c(180.5, 244.5), ylim = c(-0.5, 43.5)) +
  annotation_borders("world2", fill = "#A5AAAF") 
X40deccostmap
pdf(here("Figures", "X40deccostmap.pdf"))
ggsave("G:/Location Choice Modeling/Data/For paper/X40deccostmap.jpg", width = 10, height = 10, units = "in")
dev.off()

X20deccostmap <- ggplot(ModeledCostChange, aes(LonCenter, LatCenter, fill = X20deccost)) + 
  geom_tile() + 
  scale_fill_gradientn(colours=c("blue","white","red"),
                       limits = c(-800,500),
                       values = rescale(c(-800, 0, 500))) +
  coord_quickmap(c(180.5, 244.5), ylim = c(-0.5, 43.5)) +
  annotation_borders("world2", fill = "#A5AAAF") 
X20deccostmap
pdf(here("Figures", "X20deccostmap.pdf"))
ggsave("G:/Location Choice Modeling/Data/For paper/X20deccostmap.jpg", width = 10, height = 10, units = "in")
dev.off()