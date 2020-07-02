library(shiny)

library(shinythemes)
library(DT)

library(tidyverse)




# Notes for text/landing page:

# description of tool
# List of common errors and what they should do to fix them (in GOS most likely)
#  Multi-country portfolio -- look at Grant Results table


# CSS for the tables:
style_table <- "font-size: 75%; text-align:center; width: 100%"
#width_table <- "100%"

# List of all countries: (for dropdown menu)
df_countriesRegions <- read.csv("./input/CountryRegions.csv", stringsAsFactors = FALSE)
allCountries <- df_countriesRegions$country_name %>% unique()

# Load the results datasets:
df_countryAnnually <- read.csv("./input/CountryResults.csv", stringsAsFactors = FALSE) %>%
  left_join(df_countriesRegions, by = c("ISO3Code" = "iso3")) %>%
  select(-ISO3Code, -region, -ServiceID, -ServiceCode, -ResultNumeratorPublished)
df_grantResults    <- read.csv("./input/GrantResults.csv", stringsAsFactors = FALSE) %>%
  left_join(df_countriesRegions, by = c("ISO3Code" = "iso3")) %>%
  select(-ISO3Code, -region)
df_grantAnnually   <- read.csv("./input/GrantsAnnually.csv", stringsAsFactors = FALSE) %>%
  left_join(df_countriesRegions, by = c("ISO3Code" = "iso3")) %>%
  select(-ISO3Code, -region)
