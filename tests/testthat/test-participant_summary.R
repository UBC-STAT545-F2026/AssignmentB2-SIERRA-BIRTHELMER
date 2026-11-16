test_that("participant_summary counts unique participants", {

  example_data <- data.frame(
    id = c(1, 1, 2, 2, 3, 3),
    gender = c("Female", "Female", "Male",
               "Male", "Female", "Female")
  )

  result <- participant_summary(example_data, id, gender)

  expect_equal(sum(result$n), 3)
  expect_equal(result$n[result$gender == "Female"], 2)
  expect_equal(result$n[result$gender == "Male"], 1)

})

test_that("participant_summary calculates percentages", {

  example_data <- data.frame(
    id = c(1, 1, 2, 2, 3, 3),
    gender = c("Female", "Female", "Male",
               "Male", "Female", "Female")
  )

  result <- participant_summary(example_data, id, gender)

  expect_equal(
    result$percentage[result$gender == "Female"],
    66.67
  )

  expect_equal(
    result$percentage[result$gender == "Male"],
    33.33
  )

  expect_equal(sum(result$percentage), 100)

})

test_that("participant_summary rejects invalid input", {

  expect_error(
    participant_summary(c(1, 2, 3), id, gender),
    "Input must be a data frame"
  )

})
