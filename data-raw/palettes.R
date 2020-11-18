devtools::load_all("../../ggsegExtra/")
devtools::load_all("../../ggseg/")
devtools::load_all(".")

schaefer7_3d <- unnest(schaefer7_3d, ggseg_3d)
schaefer7_3d <- mutate(schaefer7_3d,
                       region = ifelse(grepl("wall|NA", region),
                                       NA, region),
                       colour = ifelse(is.na(region), NA, colour)
)
schaefer7_3d <- as_ggseg3d_atlas(schaefer7_3d)


schaefer17_3d <- unnest(schaefer17_3d, ggseg_3d)
schaefer17_3d <- mutate(schaefer17_3d,
                       region = ifelse(grepl("wall|NA", region),
                                       NA, region),
                       colour = ifelse(is.na(region), NA, colour)
)
schaefer17_3d <- as_ggseg3d_atlas(schaefer17_3d)



# Make palette ----
schaefer7_pal <- make_palette_ggseg(schaefer7_3d)
schaefer17_pal <- make_palette_ggseg(schaefer17_3d)

brain_pals <- c(schaefer7_pal, schaefer17_pal)
usethis::use_data(brain_pals, internal = TRUE, overwrite = TRUE)
devtools::load_all(".")

# make atlas ----

schaefer7 <- ggsegExtra::make_ggseg3d_2_ggseg(schaefer7_3d,
                                               steps = 6:7,
                                               tolerance = .1,
                                               output_dir = "~/Desktop/test/")

schaefer7 <- as_brain_atlas(schaefer7)
schaefer7$palette <- brain_pals$schaefer7

plot(schaefer7)
ggseg(atlas=schaefer7, show.legend = FALSE,
      colour = "black", position="stacked",
      alpha=.6,
      mapping = aes(fill=region)) +
  scale_fill_brain("schaefer7", package = "ggsegSchaefer")

usethis::use_data(schaefer7,
                  internal = FALSE,
                  overwrite = TRUE,
                  compress="xz")


schaefer17 <- ggsegExtra::make_ggseg3d_2_ggseg(schaefer17_3d,
                                              steps = 6:7,
                                              tolerance = .1,
                                              output_dir = "~/Desktop/test/")

schaefer17 <- as_brain_atlas(schaefer17)
schaefer17$palette <- brain_pals$schaefer17

plot(schaefer17)
ggseg(atlas=schaefer17, show.legend = FALSE,
      colour = "black", position="stacked",
      alpha=.6,
      mapping = aes(fill=region)) +
  scale_fill_brain("schaefer17", package = "ggsegSchaefer")


usethis::use_data(schaefer17,
                  internal = FALSE,
                  overwrite = TRUE,
                  compress="xz")

# # Make palette
# k <- dplyr::slice(schaefer7_3d, 1) %>%
#   unnest(ggseg_3d) %>%
#   select(region, colour) %>%
#   filter(!grepl("wall", region))
#
# j <- dplyr::slice(schaefer17_3d, 1) %>%
#   unnest(ggseg_3d) %>%
#   select(region, colour) %>%
#   filter(!grepl("wall", region))
#
# brain_pals = list(
#   schaefer7 = setNames(k$colour, k$region),
#   schaefer17 = setNames(j$colour, j$region)
# )
# usethis::use_data(brain_pals, internal = TRUE, overwrite = TRUE)
#
#
# devtools::load_all("../../ggsegExtra/")
# schaefer17_3d <- ggsegExtra:::restruct_old_3datlas(schaefer17_3d)
# schaefer17_3d <- as_ggseg3d_atlas(schaefer17_3d)
# usethis::use_data(schaefer17_3d, internal = FALSE, overwrite = TRUE)
#
#
# schaefer7_3d <- ggsegExtra:::restruct_old_3datlas(schaefer7_3d)
# schaefer7_3d <- as_ggseg3d_atlas(schaefer7_3d)
# usethis::use_data(schaefer7_3d, internal = FALSE, overwrite = TRUE)

