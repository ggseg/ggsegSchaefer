## setup ----

source(here::here("data-raw", "setup.R"))

## make ggseg3d atlas ----

schaefer17_900_3d <- make_schaefer_3d(17, 900)
schaefer17_900_3d <- schaefer17_900_3d %>%
  tidyr::unnest(ggseg_3d) %>%
  as_tibble() %>%
  mutate(
    region = gsub("17Networks_|RH_|LH_", "", region),
    region = ifelse(grepl("Background", region), NA, region)
  ) %>%
  ggseg3d::as_ggseg3d_atlas()

schaefer17_900 <- make_ggseg3d_2_ggseg(schaefer17_900_3d,
                                       steps = 2:7,
                                       tolerance = 1,
                                       output_dir = "~/Desktop/")
plot(schaefer17_900, show.legend = FALSE)

## write out ----
usethis::use_data(schaefer17_900_3d,
                  schaefer17_900,
                  overwrite = TRUE)
