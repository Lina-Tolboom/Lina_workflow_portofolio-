# Eerste grafiek voor de R Shiny-opdracht
# De gebruiker kiest later in de app een geneesmiddel

library(dplyr)
library(ggplot2)

# Lees de kleine dataset in
shiny_data <- readRDS(
  "R-shiny-opdracht/data/shiny_drug_response_data.rds"
)

# Kies voor de eerste test één geneesmiddel
gekozen_geneesmiddel <- "Camptothecin"

# Selecteer de 20 meest gevoelige cellijnen voor dit geneesmiddel
plot_data <- shiny_data %>%
  filter(DRUG_NAME == gekozen_geneesmiddel) %>%
  arrange(LN_IC50) %>%
  slice_head(n = 20)

# Maak de grafiek
ggplot(
  plot_data,
  aes(x = reorder(CELL_LINE_NAME, LN_IC50), y = LN_IC50,)
) +
  geom_col() +
  coord_flip() +
  labs(
    title = paste("Meest gevoelige cellijnen voor", gekozen_geneesmiddel),
    subtitle = "Top 20 cellijnen met de laagste LN_IC50-waarde",
    x = "Cellijn",
    y = "LN_IC50"
  ) +
  theme_minimal()
