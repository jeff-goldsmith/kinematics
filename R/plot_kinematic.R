#' @title plot_shiny: The generic function for interactive plots of functional data analyses
#' 
#' Interactive Plotting for Kinematic Data
#' 
#' @param data dataset to be plotted
#' 
#' @author Jeff Goldsmith \email{jeff.goldsmith@@columbia.edu}
#' @import dplyr
#' @import ggplot2
#' @import magrittr
#' @export plot_kinematics
#' 
#' 
#' 
plot_kinematics <- function(data, ...){

  shinyApp(ui = ui_kinematics, server = server_kinematics)

}
