## setup ----

source(here::here("data-raw", "setup.R"))

## make ggseg3d atlas ----

schaefer7_900_3d <- make_schaefer_3d(7, 900)

schaefer7_900_3d <- schaefer7_900_3d %>%
  tidyr::unnest(ggseg_3d) %>%
  as_tibble() %>%
  mutate(
    region = gsub("17Networks_|RH_|LH_", "", region),
    region = ifelse(grepl("Background", region), NA, region)
  ) %>%
  ggseg3d::as_ggseg3d_atlas()

schaefer7_900 <- make_ggseg3d_2_ggseg(schaefer7_900_3d,
                                      steps = 6:7,
                                      tolerance = 1,
                                      output_dir = "~/Desktop/")
plot(schaefer7_900, show.legend = FALSE)

## write out ----
usethis::use_data(schaefer7_900_3d,
                  schaefer7_900, overwrite = TRUE)
