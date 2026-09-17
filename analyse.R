# Setup
library(tidyverse)

# Stunde 1: Daten laden und verstehen
autos <- mpg
glimpse(autos)

# Stunde 2: Daten filtern und berechnen
suv_vs_kleinwagen <- autos %>%
  filter(class %in% c("suv", "compact")) %>%
  mutate(verbrauch_l100km = 235.21 / hwy) %>%
  select(manufacturer, model, class, displ, verbrauch_l100km)

print(suv_vs_kleinwagen)

# Stunde 3: Die schicke Grafik (ggplot2 im Albert-Rapp-Stil)
ggplot(
  data = suv_vs_kleinwagen,
  aes(x = displ, y = verbrauch_l100km, color = class)
) +
  geom_point(size = 3, alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  scale_color_manual(values = c("compact" = "#2a9d8f", "suv" = "#e76f51")) +
  labs(
    title = "Hubraum vs. Kraftstoffverbrauch",
    subtitle = "Ein Vergleich zwischen SUVs und Kompaktwagen",
    x = "Hubraum (in Litern)",
    y = "Autobahnverbrauch (l/100 km)",
    color = "Fahrzeugklasse"
  ) +
  theme_minimal()