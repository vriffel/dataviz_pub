load("data_mg.Rdata")

server <- function(input, output) {
    ## cols <- c("#000000", "#004949", "#009292", "#ff6db6", "#ffb6db", "#490092",
    ##           "#006ddb", "#b66dff", "#6db6ff", "#b6dbff")
    cols <- c("#E69F00", "#D36060", "#77B300", "#F0E442", "#0072B2", "#D55E00",
              "#CC79A7", "#999999", "#F0A3FF", "#5DA5DA")
    output$densityPlot <- renderPlotly({
        data <- da[da$Idade < 110 &
                   da$Sexo %in% input$select_sex &
                   da$Ano %in% input$select_year &
                   da$Escolaridade %in% input$select_esc &
                   da$Raça %in% input$select_raca, ]
        top10 <- names(sort(table(data$Categoria), decreasing = TRUE)[1:10])
        p <- ggplot(data[data$Categoria %in% top10, ],
                    aes(x = Idade, fill = Categoria, label = Descrição)) +
            geom_density(adjust = 1.5, position = "fill") +
            facet_wrap(as.formula(paste("~", input$select_var))) +
            ylab("Densidade") +
            theme_bw() +
            scale_fill_manual(values = cols)
        ggplotly(p, tooltip = c("Idade", "Categoria", "Descrição"))
    })
    output$densityPlot_2 <- renderPlotly({
        cat_selected <- substr(input$select_cid10, start = 1, stop = 3)
        data_2 <- da[da$Idade < 110 &
                     da$Categoria %in% cat_selected, ]
        p_2 <- ggplot(data_2,
                      aes(x = Idade,
                          y = after_stat(count),
                          fill = Categoria, label = Descrição)) +
            geom_density(adjust = 1.5, alpha = 0.6) +
            ylab("Contagem") +
            theme_bw()
        ggplotly(p_2, tooltip = c("Idade", "Categoria", "Descrição"))
    })
}
