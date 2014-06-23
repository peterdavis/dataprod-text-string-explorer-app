

shinyUI(fluidPage(
    titlePanel("Text String Distance Explorer"),
    fluidRow(
        column(4, wellPanel(
            p("Enter text strings to compare below.  Results of the comparison are shown on the right."),
            textInput("startText", "Enter starting text:", "start Text"),
            textInput("endText", "Enter text to compare:", "end text"),
            
            br(),
            p("This application takes two strings as inputs.  It then computes the distance distance between the strings.  The distance is a calculation of the minimal number of insertions, deletions and substitutions needed to transform the strings.")
        )),
        column(8,
               h6("Starting Text"),
               textOutput("startText"),
               h6("Comparison Text"),
               textOutput("endText"),
               
               br(),
               h6("Distance to convert strings"),
               textOutput("distance"),
               
               br(),
               h6("Counts of steps to convert"),
               textOutput("counts"),
               
               br(),
               h6("Transformation Sequence"),
               h6("S = Substitution, D = Deletion, M = Modification"),
               htmlOutput("trafos"),
               br(),
               p("The above comparison was produced using the R adist function.  E.g. adist('string1', 'string2')")
               
        )
    )
))
