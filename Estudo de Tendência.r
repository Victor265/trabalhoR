# Instalando e carregando as bibliotecas necessárias
install.packages("quantmod")
library(quantmod)

# Definindo o ticker
ticker <- "MGLU3.SA"  

# Definindo o período desejado
start_date <- "2024-01-01"
end_date <- Sys.Date()  # Data atual

# Baixando os dados da Bovespa
getSymbols(ticker, src = "yahoo", from = start_date, to = end_date)

# Verificando a estrutura dos dados baixados
str(MGLU3.SA)

# Extraindo os preços ajustados
precos_ajustados <- Cl(MGLU3.SA)

# Calculando médias móveis de curto e longo prazo
MGLU3.SA$SMA20 <- SMA(precos_ajustados, n = 20)
MGLU3.SA$SMA50 <- SMA(precos_ajustados, n = 50)

# Calculando os envelopes de Bollinger
n <- 20  # Período para os envelopes de Bollinger
MGLU3.SA$SDB <- BBands(precos_ajustados, n = n, maType = "SMA", sd = 2)$dn
MGLU3.SA$SDT <- BBands(precos_ajustados, n = n, maType = "SMA", sd = 2)$up

# Plotando os preços ajustados com médias móveis e envelopes de Bollinger
plot(precos_ajustados, type = "l", col = "blue", main = "Preços Ajustados e Indicadores Técnicos",
     ylab = "Preço Ajustado")
lines(MGLU3.SA$SMA20, col = "red")
lines(MGLU3.SA$SMA50, col = "green")
lines(MGLU3.SA$SDB, col = "orange")
lines(MGLU3.SA$SDT, col = "orange")