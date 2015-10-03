#' Server function for plot_kinematics
#' 
#' Internal function that defines the server for plot_kinematics
#' 
#' @param input
#' @param output
#' 
#' @author Jeff Goldsmith \email{ajg2202@@cumc.columbia.edu}
#' 
server_kinematics = function(input, output){
  
  plot.col.tar.list = c("#EBC200", "#EB9D00", "#EB0000", "#990099", "#2600A2", "#005597", "#00BC00", "#BCE300")
  
  output$kinem_plot <- renderPlot({
    
    if(is.null(data$Visit)){
      index = which(data$Subject == input$subject & data$Hand == input$hand)
    } else {
      index = which(data$Subject == input$subject & data$Hand == input$hand & data$Visit == input$visit)
    }
    
    plot.dat = data$reg.px[index,] %>% melt %>% rename(., motion = Var1, t = Var2, Px = value) %>%
      mutate(Py = melt(data$reg.py[index,])[['value']]) %>%
      mutate(tar = as.character(rep(data$Target[index], dim(data$reg.px)[2])))
    
    p1 = ggplot(plot.dat, aes(x = Px, y = Py, group = motion, colour=tar)) + geom_path(alpha = .5) + 
      scale_colour_manual(values = plot.col.tar.list, guide = FALSE) + theme_bw() + 
      ylim(-20, 20) + xlim(-20, 20) + labs(x = "X", y = "Y")
    
    p2 = ggplot(plot.dat, aes(x = t, y = Px, group = motion, colour=tar)) + geom_path(alpha = .5) + 
      scale_colour_manual(values = plot.col.tar.list, guide = FALSE) + theme_bw() + 
      ylim(-20, 20) + labs(x = "t* (msec)", y = expression(paste("P"^"X", "(t*)")))
    
    p3 = ggplot(plot.dat, aes(x = t, y = Py, group = motion, colour=tar)) + geom_path(alpha = .5) + 
      scale_colour_manual(values = plot.col.tar.list, guide = FALSE) + theme_bw() + 
      ylim(-20, 20) + labs(x = "t* (msec)", y = expression(paste("P"^"Y", "(t*)")))
    
    grid.arrange(p1,p2,p3, ncol = 3, nrow = 1)
    
  })
    
  } ## end server