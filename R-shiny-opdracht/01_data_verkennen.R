
# Dataset: GDSC2 geneesmiddelresponsdata

library(readxl)

gdsc_data <- read_excel(
  "R-shiny-opdracht/data/GDSC2_fitted_dose_response_27Oct23.xlsx"
)

# Bekijk hoe groot de dataset is
dim(gdsc_data)

# Bekijk de namen van de kolommen
names(gdsc_data)

# Bekijk de eerste regels
head(gdsc_data)

# Open de dataset
View(gdsc_data)

# Maak een kleinere dataset voor de Shiny-app
shiny_data <- gdsc_data[
  complete.cases(
    gdsc_data$CELL_LINE_NAME,
    gdsc_data$TCGA_DESC,
    gdsc_data$DRUG_NAME,
    gdsc_data$LN_IC50
  ),
  c("CELL_LINE_NAME", "TCGA_DESC", "DRUG_NAME", "LN_IC50")
]

# Controleer de kleine dataset
dim(shiny_data)
head(shiny_data)

# Bekijk hoeveel verschillende geneesmiddelen aanwezig zijn
length(unique(shiny_data$DRUG_NAME))

# Sla de kleine dataset op 
saveRDS(
  shiny_data,
  "R-shiny-opdracht/data/shiny_drug_response_data.rds"
)
