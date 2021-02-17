## setup ----

# Prefer not to do this in the future if possible but
# ggsegExtra::has_orca() relies on a system() call to return a valid orca version
# and this will fail by default because .zprofile isn't connected to R's PATH
# so new python installations don't get added to PATH
Sys.setenv(PATH = paste("/opt/miniconda3/bin", Sys.getenv("PATH"),sep=":"))
require(tidyverse)
require(magrittr)
# Newer freesurfer installations go into version-specific subfolders
# reset freesurfer.path to the newest version subfolder found on the computer
options(freesurfer.path = tail(list.files("/Applications/freesurfer", full.names = T), 1))

## wrapper definition ----

make_schaefer_3d <- function (n_parcels, n_networks, ...) {

  out <- tibble(hemi = c("lh", "rh")) %>%
    mutate(atlas3d = map(hemi,
                         ~ggsegExtra::make_aparc_2_3datlas(annot = glue::glue("Schaefer2018_{n_parcels}Parcels_{n_networks}Networks_order"),
                                                           hemisphere = .x,
                                                           surface = c("LCBC", "white", "inflated"),
                                                           subjects_dir = here::here("data-raw"),
                                                           output_dir = here::here("data-raw", "temp"),
                                                           ...
                         ))) %>%
    # get only the atlas3d column to fold both hemi atlases into one df
    select(-hemi) %>%
    unnest(atlas3d) %>%
    mutate(
      atlas = str_remove(atlas, "order_"),
      region = str_remove(region, "17Networks_|RH_|LH_"),
      region = ifelse(grepl("Background", region), NA, region),
      network = str_split_fixed(region, "_", 2),
      network = ifelse(network[,1] == "", NA_character_, network[,1])
    ) %>%
    ggseg3d::as_ggseg3d_atlas()

  return (out)
}

make_schaefer_2d <- function (atlas, n_parcels, n_networks) {

  atlas_name <- unique(atlas$atlas) %>%
    str_remove("_3d")

  # detect how many steps need to get run
  # steps must be run in order, so if any of these fail,
  # run that step and all the ones after
  if (!all(c("full_left_lateral.png",
            "full_left_medial.png",
            "full_right_lateral.png",
            "full_right_medial.png") %in%
          list.files(here::here("data-raw", "temp", atlas_name)))) {
    these_steps <- 1:7
  } else if (list.files(here::here("data-raw", "temp", atlas_name, "img")) %>%
      # count just the unique ROI number x hemisphere combos
      str_split("_") %>%
      map(~.[-3]) %>%
      map_chr(str_flatten, collapse = "_") %>%
      unique() %>%
      length() < n_parcels + 2) {
    # roi 0001 seems consistently to be freesurfer background
    # so expect n_parcels+2 total files to exist if it's done
    these_steps <- 2:7
  } else if (list.files(here::here("data-raw", "temp", atlas_name, "masks")) %>%
      # count just the unique ROI number x hemisphere combos
      str_split("_") %>%
      map(~.[-3]) %>%
      map_chr(str_flatten, collapse = "_") %>%
      unique() %>%
      length() < n_parcels + 2 &
      list.files(here::here("data-raw", "temp", atlas_name, "regions")) %>%
      # count just the unique ROI number x hemisphere combos
      str_split("_") %>%
      map(~.[-3]) %>%
      map_chr(str_flatten, collapse = "_") %>%
      unique() %>%
      length() < n_parcels + 2) {
    these_steps <- 3:7
  } else if (!("contours.rda" %in% list.files(here::here("data-raw", "temp", atlas_name)))) {
    these_steps <- 4:7
  } else if (!("contours_smoothed.rda" %in% list.files(here::here("data-raw", "temp", atlas_name)))) {
    these_steps <- 5:7
  } else if (!("contours_reduced.rda" %in% list.files(here::here("data-raw", "temp", atlas_name)))) {
    these_steps <- 6:7
  } else {
    these_steps <- 7
  }

  out <- ggsegExtra::make_ggseg3d_2_ggseg(ggseg3d_atlas = atlas,
                                          steps = these_steps,
                                          output_dir = here::here("data-raw", "temp"),
                                          tolerance = 2)

  return (out)
}
