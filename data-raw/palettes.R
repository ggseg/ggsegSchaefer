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


devtools::load_all("../../ggsegExtra/")
schaefer17_3d <- ggsegExtra:::restruct_old_3datlas(schaefer17_3d)
schaefer17_3d <- as_ggseg3d_atlas(schaefer17_3d)
usethis::use_data(schaefer17_3d, internal = FALSE, overwrite = TRUE)


schaefer7_3d <- ggsegExtra:::restruct_old_3datlas(schaefer7_3d)
schaefer7_3d <- as_ggseg3d_atlas(schaefer7_3d)
usethis::use_data(schaefer7_3d, internal = FALSE, overwrite = TRUE)

