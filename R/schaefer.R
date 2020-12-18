
## Polygon data ----
#' Local-Global 7-Network Parcellation of the Human Cerebral Cortex
#'
#' Coordinate data for the Schaefer et al. (2018) cortical atlas,
#' with 100-1000 regions on the cortical surface of the brain, aligned with
#' 7 previously described functional networks (Yeo et al., 2011).
#'
#' @docType data
#' @name schaefer7
#' @usage data(schaefer7_100)
#' @keywords datasets
#' @family ggseg_atlases
#'
#' @references Schaefer et al. (2018) Cereb Cortex. 2018 Sep 1;28(9):3095-3114. doi: 10.1093/cercor/bhx179
#' (\href{https://www.ncbi.nlm.nih.gov/pubmed/28981612}{PubMed})
#'
#' @format A \code{brain_atlas} with 1 observation per ROI and 6 variables
#' \describe{
#'   \item{hemi}{name of the hemisphere (left, right)}
#'   \item{side}{which side to view (medial, lateral)}
#'   \item{region}{name of region}
#'   \item{label}{label from recon-all segmentation}
#'   \item{roi}{ROI number in the original atlas lookup table}
#'   \item{geometry}{\code{MULTIPOLYGON} of vertices for that region}
#' }
#' @examples
#' data(schaefer7_100)
"schaefer7_100"

#' @rdname schaefer7
"schaefer7_200"

#' @rdname schaefer7
"schaefer7_400"

#' Local-Global 17-Network Parcellation of the Human Cerebral Cortex
#'
#' Coordinate data for the Schaefer et al. (2018) cortical atlas,
#' with 100-1000 regions on the cortical surface of the brain, aligned with
#' 17 previously described functional networks (Yeo et al., 2011).
#'
#' @docType data
#' @name schaefer17
#' @usage data(schaefer17)
#' @keywords datasets
#' @family ggseg_atlases
#'
#' @references Schaefer et al. (2018) Cereb Cortex. 2018 Sep 1;28(9):3095-3114. doi: 10.1093/cercor/bhx179
#' (\href{https://www.ncbi.nlm.nih.gov/pubmed/28981612}{PubMed})
#'
#' @format A data.frame with 1 observation per ROI and 6 variables
#' \describe{
#'   \item{hemi}{name of the hemisphere (left, right)}
#'   \item{side}{which side to view (medial, lateral)}
#'   \item{region}{name of region}
#'   \item{label}{label from recon-all segmentation}
#'   \item{roi}{ROI number in the original atlas lookup table}
#'   \item{geometry}{\code{MULTIPOLYGON} of vertices for that region}
#' }
#' @examples
#' data(schaefer17_100)
"schaefer17_100"

#' @rdname schaefer17
"schaefer17_200"

### 3d meshes ----

#' Local-Global 7-Network Parcellation of the Human Cerebral Cortex
#'
#' Mesh data for the 7 resting-state networks of
#' the Schaefer et al. (2018) networks.
#'
#' @docType data
#' @name schaefer7_3d
#' @usage data(schaefer7_400_3d)
#' @family ggseg3d_atlases
#' @keywords datasets
#'
#'
#' @references Schaefer et al. (2018) Cereb Cortex. 2018 Sep 1;28(9):3095-3114. doi: 10.1093/cercor/bhx179
#' (\href{https://www.ncbi.nlm.nih.gov/pubmed/28981612}{PubMed})
#'
#' @format A tibble with 4 observations and a nested data.frame
#' \describe{
#'   \item{surf}{type of surface (`inflated` or `white`)}
#'   \item{hemi}{hemisphere (`left`` or `right`)}
#'   \item{data}{data.frame of necessary variables for plotting
#'   }
#'
#'   \item{atlas}{String. atlas name}
#'   \item{roi}{numbered region from surface}
#'   \item{annot}{concatenated region name}
#'   \item{label}{label `hemi_annot` of the region}
#'   \item{mesh}{list of meshes in two lists: vb and it}
#'   \item{area}{name of area in full}
#'   \item{colour}{HEX colour of region}
#' }
#' @examples
#' data(schaefer7_400_3d)
"schaefer7_400_3d"

#' @rdname schaefer7_3d
"schaefer7_100_3d"

#' @rdname schaefer7_3d
"schaefer7_200_3d"

#' @rdname schaefer7_3d
"schaefer7_300_3d"

#' @rdname schaefer7_3d
"schaefer7_500_3d"

#' @rdname schaefer7_3d
"schaefer7_600_3d"

#' @rdname schaefer7_3d
"schaefer7_700_3d"

#' @rdname schaefer7_3d
"schaefer7_800_3d"

#' @rdname schaefer7_3d
"schaefer7_900_3d"

#' @rdname schaefer7_3d
"schaefer7_1000_3d"

#' Local-Global 17-Network Parcellation of the Human Cerebral Cortex
#'
#' Mesh data for the 17 resting-state networks of
#' the Schaefer et al. (2018) networks.
#'
#' @docType data
#' @name schaefer17_3d
#' @usage data(schaefer17_400_3d)
#' @family ggseg3d_atlases
#' @keywords datasets
#'
#' @references Schaefer et al. (2018) Cereb Cortex. 2018 Sep 1;28(9):3095-3114. doi: 10.1093/cercor/bhx179
#' (\href{https://www.ncbi.nlm.nih.gov/pubmed/28981612}{PubMed})
#'
#' @format A tibble with 4 observations and a nested data.frame
#' \describe{
#'   \item{surf}{type of surface (`inflated` or `white`)}
#'   \item{hemi}{hemisphere (`left`` or `right`)}
#'   \item{data}{data.frame of necessary variables for plotting
#'   }
#'
#'   \item{atlas}{String. atlas name}
#'   \item{roi}{numbered region from surface}
#'   \item{annot}{concatenated region name}
#'   \item{label}{label `hemi_annot` of the region}
#'   \item{mesh}{list of meshes in two lists: vb and it}
#'   \item{area}{name of area in full}
#'   \item{colour}{HEX colour of region}
#' }
#' @examples
#' data(schaefer17_400_3d)
"schaefer17_400_3d"

#' @rdname schaefer17_3d
"schaefer17_100_3d"

#' @rdname schaefer17_3d
"schaefer17_200_3d"

#' @rdname schaefer17_3d
"schaefer17_300_3d"

#' @rdname schaefer17_3d
"schaefer17_500_3d"

#' @rdname schaefer17_3d
"schaefer17_600_3d"

#' @rdname schaefer17_3d
"schaefer17_700_3d"

#' @rdname schaefer17_3d
"schaefer17_800_3d"

#' @rdname schaefer17_3d
"schaefer17_900_3d"

#' @rdname schaefer17_3d
"schaefer17_1000_3d"
