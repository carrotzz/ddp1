library(shiny) 
shinyUI(
        pageWithSidebar(
                # Application title
                headerPanel("BMI - Body Mass Index (BMI) Calculator"),
                
                sidebarPanel(
                        numericInput('weight', 'Key in your weight (KG)', 70) ,
                        numericInput('height', 'Key in your height (M)', 1.70, min = 0.2, max = 3, step = 0.01),
                        submitButton('Submit'),
                        h3('Description:'),
                        h5('Key in your weight in kg (unit) and your height in metres (unit)'),
                        h5('  E.g : Weight=44 kg, Height=1.55 m'),
                        h5('Enter 44 in weight and 1.65 in height.')
                    
                ), 
                mainPanel(
                        p('BMI is a measurement of body fat ratio against weight and height applicable to everyone.'),
                        p('According to WHO (World Health Organisation Standards, the classification of BMI as follow:'),
                        h4('--------------------------------------------------------------------------------------'),
                        tags$div(
                                tags$ul(
                                        tags$li('BMI <18.5       : Underweight'),
                                        tags$li('BMI [18.5-24.9] : Normal weight'),
                                        tags$li('BMI [25-29.9]   : Overweight'),
                                        tags$li('BMI >=30        : Obesity')
                                )
                        ),
                     
                        h4('Based on the values you input:'), 
                        p('weight:'), verbatimTextOutput("inputweightvalue"),
                        p('height:'), verbatimTextOutput("inputheightvalue"),
                        h4('Your BMI is:'),
                        verbatimTextOutput("estimation"),
                        plotOutput("distPlot"),
                        p('It means that you are:'),strong(verbatimTextOutput("diagnostic"))
                        
                        
                )
                
        )   
)
