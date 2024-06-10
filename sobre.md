Este dashboard foi criado como projeto final da disciplina de Visualização de
Dados ofetada pelo [Programa de pós-graduação em Ciência da Computação da
UFMG](https://ppgcc.dcc.ufmg.br/). O dashboard interativo serve como uma análise
visual dos dados do [Sistema de Informacao Sobre Mortalidade (SIM) do Sistema
Único de Saúde (SUS)](https://svs.aids.gov.br/daent/cgiae/sim/apresentacao/). O
objetivo principal do dashboard é oferecer uma ferramenta intuitiva e eficaz que
permita aos usuários explorar, entender e interpretar as estatísticas de
mortalidade de maneira visual.

O dashboard apresenta gráficos interativos, que permitem aos usuários focar em
diferentes períodos e causas de morte. A plataforma inclui filtros de seleção
para critérios como gênero, escolaridade, raça tipo de doença ou causa da
mortalidade, permitindo uma análise detalhada e segmentada. O layout e a escolha
das visualizações foi feita de acordo com os tópicos estudados durante a
discplina.

Toda esse trabalho foi realizado em [`R`](https://www.r-project.org/). O código
para gerar esse dashboard está disponível em
[https://github.com/vriffel/dataviz_pub](https://github.com/vriffel/dataviz_pub).
Para a coleta dos dados utilizamos o pacote
[microdatasus](https://github.com/rfsaldanha/microdatasus). Os gráficos foram
gerados utilizando [ggplot2](https://ggplot2.tidyverse.org/) e [plotly](https://plotly.com/). O
dashboard é gerado a partir do pacote [Shiny](https://shiny.posit.co/).

### Informações relevantes sobre a base de dados

Embora o SIM ofereça dados mais antigos, optamos por utilizar o período de 2019
à 2022. A razão disto é que a plataforma onde estamos hospedando o dashboard
([shinyapps](https://www.shinyapps.io/)) não suporta uma base de dados grande em
sua versão gratuita. Também, estamos utilizando somente os óbitos corridos no
Estado de Minas Gerais. No início, coletamos dados a partir de 2012 em todo o
Brasil, totalizando em torno de 40 milhões de registros, com os filtros
aplicados a base que estamos utilizando conta com 643597 registros.

Dentre as variáveis disponíveis, selecionamos:

+ **Causa básica do óbito**. Código Internacional de Doença (CID-10) da doença que
  causou o óbito.

+ **Escolaridade**. Disponível nas faixas: Nenhuma, 1 a 3 anos, 4 a 7 anos, 8 a
  11 anos, e 12 ou mais anos.

+ **Raça**: Amarela, branca, indígena, parda, e preta.

+ **Sexo**: Feminino, e masculino
