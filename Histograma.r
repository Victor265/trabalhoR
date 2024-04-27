# Pacotes necessários
install.packages(c("quantmod", "ggplot2","TTR"))
library(quantmod)
library(ggplot2)
library(TTR)

# Definir o símbolo do ativo financeiro e baixar os dados
symbol <- "MGLU3.SA" 
getSymbols(symbol)

# Calcular os retornos diários
retornos <- dailyReturn(Cl(get(symbol)))

# Plotar o histograma dos retornos
ggplot(data = as.data.frame(retornos), aes(x = retornos)) +
  geom_histogram(binwidth = 0.02, fill = "skyblue", color = "black", alpha = 0.7) +
  labs(title = "Histograma dos Retornos Diários",
       x = "Retornos Diários", y = "Frequência") +
  theme_minimal()


# criando o gráfico de candlestick
grafico <- chartSeries(MGLU3.SA, theme = "white", subset = "last 1 year")

# retorno do histograma 
grafico <- addMACD()

grafico