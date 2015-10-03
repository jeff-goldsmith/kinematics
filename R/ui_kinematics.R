#' UI function for plot_kinematics
#' 
#' Internal function that defines the UI for plot_kinematics
#' 
#' @author Jeff Goldsmith \email{ajg2202@@cumc.columbia.edu}
#' 
ui_kinematics = function(){
  
  subj.list = unique(data$Subject)
  hand.list = c("Right", "Left")
  if(!is.null(data$Visit)) {visit.list = levels(data$Visit)}
  
  fluidPage(
    h2("Expected shape of reaching motions"),
    fluidRow(
      column(3,
             selectInput("subject", label = ("Select Subject"), choices = subj.list, selected = subj.list[1]),
             selectInput("hand", label = ("Hand Used"), choices = hand.list, selected = hand.list[1]),
             if(!is.null(data$Visit)){
               selectInput("visit", label = ("Visit"), choices = visit.list, selected = visit.list[1])
             }
      ),
      column(9,
             plotOutput('kinem_plot', width = "750px", height = "250px")
      )
    )
  )
}

