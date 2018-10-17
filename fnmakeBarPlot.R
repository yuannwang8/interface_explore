 
fn.makeBarPlot <- function(npick, nrun){
  
  #### Update this to change integer selection range
  
  Imin <- 1	
  Imax <- 50	

  #### Update this to change integer selection range
  
  x1 <- NULL
  for(i in 1:nrun){
    xi <- sort(sample(Imin:Imax, npick, replace = FALSE))
    x1 <- c(x1, xi)
  }
  
  mostfreqpicks <- names(sort(table(x1), decreasing = TRUE))[1:npick]  
  x0 <- setdiff(Imin:Imax, unique(x1))
  t0 <- rep(0, length(x0))
  names(t0) <- x0
  t1 <- c(table(x1), t0)
  t1 <- t1[order(as.numeric(names(t1)))]
  
  myplot <- barplot(t1, 
                    col = "lightsteelblue", border = NA,
                    xlim = NULL, xaxt = 'n',
                    ylim = c(0,1.2*max(t1)),
                    xlab = paste0("Most picked: ", paste(mostfreqpicks, collapse = ", ") ),
                    ylab = "Count",
                    main = paste0("Picking ", npick, " integers between ", Imin, " and ", Imax, " ", nrun, " times")
  )
  text(myplot, t1 + 0.03*max(t1), names(t1), cex=0.7)
  abline(h = (npick*nrun)/(Imax-Imin), col = "red")
}

# test
# npick <- 5 ; nrun <- 10
# fn.makeBarPlot(npick, nrun)