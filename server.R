library(shiny) 

BMI<-function(weight,height) {weight/(height^2)}
calcBMI <-function(height,weight) weight/((height/100)*(height/100))

diagnostic_f<-function(weight,height){
        BMI_value<-weight/(height^2)
        ifelse(BMI_value<18.5,"underweight",ifelse(BMI_value<25,"normal weight",ifelse(BMI_value<30,"overweight","obesity")))
}

shinyServer(
        function(input, output) {
                
                output$inputweightvalue <- renderPrint({input$weight})
                output$inputheightvalue <- renderPrint({input$height})
                output$estimation <- renderPrint({BMI(input$weight,input$height)})
                output$diagnostic <- renderPrint({diagnostic_f(input$weight,input$height)})
                output$distPlot <- renderPlot({
                  height <- seq(100,230, length.out=100)
                  weight <- seq(40,150, length.out=100)
                  wtht <- expand.grid(x=height, y=weight)
                  
                  bmiwtht <- matrix(calcBMI(wtht$x,wtht$y),length(height),length(weight))
                  
                  
                  contour(height,weight,bmiwtht,levels = c(18.5,25), drawlabels=FALSE,
                          xlab="Height (cm)",ylab="Weight (kg)",
                          main="BMI by height and weight")
                  
                  text(175,95,"Overweight",cex=2,srt=40,col="Red")
                  text(185,75,"Normal",cex=2,srt=35,col="Blue")
                  text(195,55,"Underweight",cex=2,srt=38,col="Yellow")
                
        } 
)

})

