#instalar os pacotes necessários para o trabalho
install.packages(c("quantmod", "TTR"))

# Carregar pacotes
library(quantmod)
library(TTR)

# Definir símbolo da ação, empresa escolhida foi a maganize luiza
ticker <- "MGLU3.SA"

# Coletando os dados da magalu
getSymbols(ticker, src = "yahoo")

# criando o gráfico de candlestick
grafico <- chartSeries(MGLU3.SA, theme = "white", subset = "last 1 year")

#adicionando o indicador Bandas de Bollinger que traz a linha de média movel simples e as bandas superior e inferior
grafico <- addBBands()

#adicionando mais médias móveis no periodo de 20 a 30
addSMA(n = c(20, 30), on = 1)

#mostrando o grafico
grafico