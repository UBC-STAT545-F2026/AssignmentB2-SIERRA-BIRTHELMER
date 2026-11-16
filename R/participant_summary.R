#' Summarize Unique Participants
#'
#' @description
#' Counts the number of unique participants in each category
#' of a variable and calculates the percentage in each group.
#' This is useful for datasets with repeated observations
#' per participant, such as daily diary data.
#'
#' @param data A data frame containing participant information.
#' @param id A column identifying each unique participant.
#' @param variable A categorical variable to summarize.
#'
#' @return A tibble containing the number and percentage
#' of unique participants in each category.
#'
#' @examples
#' example_data <- data.frame(
#'   id = c(1, 1, 2, 2, 3, 3),
#'   gender = c("Female", "Female", "Male",
#'              "Male", "Female", "Female")
#' )
#'
#' participant_summary(example_data, id, gender)
#'
#' @importFrom rlang .data
#' @export
participant_summary <- function(data, id, variable) {

  if (!is.data.frame(data)) {
    stop("Input must be a data frame")
  }

  data |>
    dplyr::distinct({{ id }}, .keep_all = TRUE) |>
    dplyr::count({{ variable }}) |>
    dplyr::mutate(
      percentage = round(.data$n / sum(.data$n) * 100, 2)
    )
}
