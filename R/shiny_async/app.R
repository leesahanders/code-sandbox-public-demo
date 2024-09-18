library(shiny)
library(glue)
library(callr)

var = 0

do_something_hard <- function(num) {
  
  Sys.sleep(2)
  num_new = num + 1
  print(num_new)
  
  return(num_new)
}

ui <- fluidPage(
  titlePanel("Hello world!"),
  #sidebarLayout(
    # sidebarPanel(
    #   # actionButton("button_counter", "Button Counter"),
    #   # actionButton("button_counter_async", "Button Counter Async")
    # ),
    mainPanel(
      fluidRow(
        column(4,
               actionButton("button_counter", "Button Counter"),
               p("Number of button presses:"),
               verbatimTextOutput("num_button_presses"),
        ),
        
        column(4,
               actionButton("button_counter_async", "Button Counter Async"),
               p("Number of button presses async start:"),
               verbatimTextOutput("num_button_presses_async_start"),
               p("Number of button presses async finish:"),
               verbatimTextOutput("num_button_presses_async_finish"),
        )
        
      #)
    )
  )
)


server <- function(input, output, session) {
  
  v <- reactiveValues(
    num_button_presses = 0
  )
  
  observeEvent(input$button_counter, {
    id <- substr(session$token, 1, 3)
    print(glue("Session {id} - button pressed..."))
    notification <- showNotification("This is a notification that we've started our long running process.", type = "message")
    do_something_hard(v$num_button_presses) # This will run the 5 sec wait within the app and we will see the delay 
    #showNotification("This is a notification that we've finished our long running process", type = "message")
    removeNotification(notification)
    
    v$num_button_presses <- v$num_button_presses + 1
    print(glue("Session {id} - complete"))
  })
  
  output$num_button_presses <- renderText(v$num_button_presses)
  
  v_async <- reactiveValues(
    num_button_presses_async_start = var,
    num_button_presses_async_finish = var
  )
  
  observeEvent(input$button_counter_async, {
    id <- substr(session$token_async, 1, 3)
    print(glue("Session {id} - button pressed..."))
    notification <- showNotification("This is a notification that we've started our long running process.", type = "message")
    #do_something_hard() or Sys.sleep(5) # This will run the 5 sec wait within the app and we will see the delay 
    # rp <- callr::r_bg(do_something_hard(v_async$num_button_presses_async)) # this call async 
    rx <- callr::r_bg(do_something_hard, args = list(num=v_async$num_button_presses_async), supervise = TRUE) # this calls async
    
    
    
    # wait until it is done
    rx$wait()
    rx$is_alive()
    result <- rx$get_result()
    print(result)
    
    showNotification("This is a notification that we've finished our long running process.", type = "message")
    removeNotification(notification)
    
    v_async$num_button_presses_async <- v_async$num_button_presses_async + 1
    # v_async$num_button_presses_async <- result
    
    
    print(glue("Session {id} - complete"))
  })
  
  output$num_button_presses_async_start <- renderText(v_async$num_button_presses_async_start)
  output$num_button_presses_async_finish <- renderText(v_async$num_button_presses_async_finish)
  
  check <- reactive({
    invalidateLater(millis = 1000, session = session)
    
    if (do_something_hard()$is_alive()) {
      x <- "Job running in background"
    } else {
      x <- "Async job in background completed"
    }
    return(x)
  })
  
  output$callr_message<- renderText({
    check()
  })
  
}

shinyApp(ui = ui, server = server)

# https://stackoverflow.com/questions/30474538/possible-to-show-console-messages-written-with-message-in-a-shiny-ui 
# https://www.r-bloggers.com/2020/04/asynchronous-background-execution-in-shiny-using-callr/