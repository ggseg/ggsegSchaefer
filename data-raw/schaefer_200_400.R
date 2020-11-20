devtools::load_all("../../ggsegExtra/")
devtools::load_all("../../ggseg/")

# 200 ----
schaefer17_200_3d <- make_aparc_2_3datlas(annot = "Schaefer2018_200Parcels_17Networks_order",
                                          annot_dir = "data-raw/",
                                          output_dir = "data-raw")
schaefer17_200_3d <- schaefer17_200_3d %>%
  unnest(ggseg_3d) %>%
  mutate(
    atlas = "schaefer17_200_3d",
    region = gsub("17Networks_|LH_|RH_", "", region),
    region = ifelse(grepl("Background", label), NA, region),
    network = sapply(region, function(x) strsplit(x, "_")[[1]][1])
  ) %>%
  nest_by(atlas, surf, hemi, .key = "ggseg_3d") %>%
  as_ggseg3d_atlas()

ggseg3d(atlas = schaefer17_200_3d)
ggseg3d(atlas = schaefer17_200_3d, surface = "white")

schaefer17_200 <- make_ggseg3d_2_ggseg(schaefer17_200_3d,
                                       steps = 5:7,
                                       output_dir = "data-raw",
                                       tolerance = .1,
                                       smoothness = 5)

schaefer17_200$data <- mutate(schaefer17_200$data,
                              network = sapply(region, function(x) strsplit(x, "_")[[1]][1]))

# edit palette
pal <- schaefer17_200_3d %>%
  unnest(ggseg_3d) %>%
  select(region, colour) %>%
  filter(!duplicated(region))
idx <- !is.na(pal$colour)
schaefer17_200$palette <- stats::setNames(unique(pal$colour[idx]), unique(pal$region[idx]))

plot(schaefer17_200, position = position_brain(hemi ~ side))


usethis::use_data(schaefer17_200, schaefer17_200_3d,
                  internal = FALSE,
                  overwrite = TRUE,
                  compress="xz")

# 400 ----
schaefer17_400_3d <- make_aparc_2_3datlas(annot = "Schaefer2018_400Parcels_17Networks_order",
                                          annot_dir = "data-raw/",
                                          output_dir = "data-raw")

schaefer17_400_3d <- schaefer17_400_3d %>%
  unnest(ggseg_3d) %>%
  mutate(
    atlas = "schaefer17_400_3d",
    region = gsub("17Networks_|LH_|RH_", "", region),
    region = ifelse(grepl("Background", label), NA, region),
    network = sapply(region, function(x) strsplit(x, "_")[[1]][1])
  ) %>%
  nest_by(atlas, surf, hemi, .key = "ggseg_3d") %>%
  as_ggseg3d_atlas()

ggseg3d(atlas = schaefer17_400_3d)
ggseg3d(atlas = schaefer17_400_3d, surface = "white")

schaefer17_400 <- make_ggseg3d_2_ggseg(schaefer17_400_3d,
                                       output_dir = "data-raw",
                                       steps = 5:7,
                                       tolerance = 1.2,
                                       smoothness = 3)

schaefer17_400$data <- mutate(schaefer17_400$data,
                              network = sapply(region, function(x) strsplit(x, "_")[[1]][1]))

# edit palette
pal <- schaefer17_400_3d %>%
  unnest(ggseg_3d) %>%
  select(region, colour) %>%
  filter(!duplicated(region))
idx <- !is.na(pal$colour)
schaefer17_400$palette <- stats::setNames(unique(pal$colour[idx]), unique(pal$region[idx]))

plot(schaefer17_400,
     show.legend = FALSE,
     position = position_brain(hemi ~ side))


usethis::use_data(schaefer17_400, schaefer17_400_3d,
                  internal = FALSE,
                  overwrite = TRUE,
                  compress="xz")

# palettes ----
brain_pals <- list(schaefer17 = schaefer17$palette,
                   schaefer7 = schaefer7$palette,
                   schaefer17_200 =  schaefer17_200$palette,
                   schaefer17_400 = schaefer17_400$palette)

usethis::use_data(brain_pals,
                  internal = TRUE,
                  overwrite = TRUE,
                  compress="xz")
