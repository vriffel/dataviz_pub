library(shiny)
library(plotly)
library(ggplot2)
library(shinydashboard)
library(markdown)
library(shinyWidgets)
library(ggthemes)
library(stringr)

source("helpers.R")
load("data_mg.Rdata")

ui <- tagList(
    dashboardPage(
        skin = "black",
        header =
            dashboardHeader(
                title = HTML("Análise Visual dos Dados do SIM"),
                disable = FALSE,
                titleWidth  = 400,
                dropdownMenuCustom(
                    type = "message",
                    customSentence = customSentence,
                    messageItem(
                        from = "viniciusricardoriffel@gmail.com",
                        message =  "",
                        icon = icon("envelope"),
                        href = "mailto:viniciusricardoriffel@gmail.com"
                    ),
                    icon = icon('comment')
                )),
        sidebar = dashboardSidebar(
            width = 200,
            sidebarMenu(
                id = "sidebar",
                style = "position: relative; overflow: visible;",
                menuItem("Sobre", tabName = "sobre",
                         icon = icon("info")),
                menuItem("Comparativo", tabName = "Comparativo",
                         icon = icon("magnifying-glass-chart")
                         ), ## menuItem Stadings
                menuItem("Distribuição", tabName = "Distribuição",
                         icon = icon("chart-column")
                         ), ## menuItem Teams
                conditionalPanel(
                    'input.sidebar == "Comparativo"',
                    pickerInput(
                        "select_year",
                        label = "Selecione o ano",
                        choices = unique(da$Ano),
                        selected = unique(da$Ano),
                        options = list(`actions-box` = TRUE),
                        multiple = TRUE),
                    pickerInput(
                        "select_sex",
                        label = "Selecione o sexo",
                        selected = unique(da$Sexo),
                        choices = sort(unique(da$Sexo)),
                        options = list(`actions-box` = TRUE),
                        multiple = TRUE),
                    pickerInput(
                        "select_raca",
                        label = "Selecione a raça",
                        selected = unique(da$Raça),
                        choices = sort(unique(da$Raça)),
                        options = list(`actions-box` = TRUE),
                        multiple = TRUE),
                    pickerInput(
                        "select_esc",
                        label = "Selecione a escolaridade",
                        selected = unique(da$Escolaridade),
                        choices = levels(da$Escolaridade),
                        options = list(`actions-box` = TRUE),
                        multiple = TRUE)
                )
            ) ## sidebarMenu
        ),
        body = dashboardBody(
            tags$style(HTML("
    p {
      font-size: 20px;
    }
  ")),
  tabItems(
      tabItem(
          tabName = "sobre",
          includeMarkdown("sobre.md")
      ), ## sobre
      tabItem(
          tabName = "Comparativo",
          selectInput("select_var", "Selecione a variável",
                      choices = c("Sexo", "Raça", "Ano",
                                  "Escolaridade"),
                      selected = "Ano"),
          plotlyOutput("densityPlot", height = "550px", width = "100%")
      ),
      tabItem(
          tabName = "Distribuição",
          pickerInput(
              "select_cid10",
              label = "Selecione a categoria CID10 da doença",
              selected = "R99",
              choices = sort(paste(unique(da$Categoria), "-", unique(da$Descrição))),
              options = list(`actions-box` = TRUE,
                             `live-search` = TRUE),
              multiple = TRUE),
          plotlyOutput("densityPlot_2", height = "550px", width = "100%")
      )
  ) ## tabItems
  ) ## Body
  ), ## Dashboardpage
  tags$footer("Created by Jesimon Barreto and Vinicius Riffel")
)
