# Purpose: to ensure dataset avaliabity for plot*.R scripts
# This is a data helper script that checks if the household power consumption
# dataset exists. If the dataset dosen't exist, check if the source Zip
# archive file exists (download if nonexistent) and unzip it.


fPaths <- list(summarySCC_PM25='Data/summarySCC_PM25.rds',
               Source_Classification_Code='Data/Source_Classification_Code.rds',
               zipSrc='Data/FNEI_data.zip')
zipSrcURL <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'

CheckOrDlData <- function(zipFPath = fPaths$zipSrc) {
    if (!dir.exists('Data')) {
      dir.create('Data')
    }
    if (!(
      file.exists(fPaths$summarySCC_PM25) &
      file.exists(fPaths$Source_Classification_Code)
    )) {
      if (!file.exists(zipFPath)) {
        zipFPath <- fPaths$zipSrc
        download.file(zipSrcURL, zipFPath)
      }
      unzip(zipFPath, exdir = 'Data', overwrite = T)
      return(T)
    } else {
      return(T)
    }
}

LoadData <- function(dataset) {
  if (CheckOrDlData() & !is.null(fPaths[dataset][[1]])) {
    data <- readRDS(fPaths[dataset][[1]])
    return(data)
  } else {
    return(NULL)
  }
}
