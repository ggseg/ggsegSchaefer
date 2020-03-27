library(dplyr)

# Make palette
k <- dplyr::slice(schaefer7_3d, 1) %>%
  unnest(ggseg_3d) %>%
  select(region, colour) %>%
  filter(!grepl("wall", region))

j <- dplyr::slice(schaefer17_3d, 1) %>%
  unnest(ggseg_3d) %>%
  select(region, colour) %>%
  filter(!grepl("wall", region))

brain_pals = list(
  schaefer7 = setNames(k$colour, k$region),
  schaefer17 = setNames(j$colour, j$region)
)
usethis::use_data(brain_pals, internal = TRUE, overwrite = TRUE)

