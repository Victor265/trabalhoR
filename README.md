Trabalho da Disciplina de Programação em R da Pós Graduação de Ciência de Dados da Unicarioca
Professor : Sérgio Monteiro, DSc
Aluno : Victor Lopes da Motta da Silva
Matrícula: 2021100216
Gráficos de Candlestick com Indicadores de Médias moveis
#instalar os pacotes necessários para o trabalho
install.packages(c("quantmod", "TTR"))

# Carregar pacotes
library(quantmod)
library(TTR)

# Definir símbolo da ação, empresa escolhida foi a maganize luiza
ticker <- "MGLU3.SA"

# Coletando os dados da magalu
getSymbols(ticker, src = "yahoo")

# criando o gráfico de candlestick
grafico <- chartSeries(MGLU3.SA, theme = "white", subset = "last 1 year")

#adicionando o indicador Bandas de Bollinger que traz a linha de média movel simples e as bandas superior e inferior
grafico <- addBBands()

#adicionando mais médias móveis no periodo de 20 a 30
addSMA(n = c(20, 30), on = 1)

#mostrando o grafico
grafico

Análise do gráfico de candlestick com os Indicadores de Médias Moveis
No período do dia 02 de Janeiro de 2024 até dia 26 de Fevereiro de 2024 foi o período de crescimento e de entrada no mercado da empresa Magazine Luiza, aonde o seu valor apresentou mais subidas do que quedas e a linha média móvel não teve uma caída drástica, até chegando a subir durante o mês de Fevereiro.

Já depois do dia 26 de Fevereiro de 2024 a marca teve uma queda bem considerada e voltou a subir novamente no dia 18 de março porém bem pouco e depois foi uma queda maior ainda, uma queda de 2.0 para 1.4, mostrando sendo um período de saída do mercado, aonde claramente teve as suas ações desvalorizadas.

Histograma
# Pacotes necessários
install.packages(c("quantmod", "ggplot2","TTR"))
library(quantmod)
library(ggplot2)
library(TTR)

# Definir o símbolo do ativo financeiro e baixar os dados
symbol <- "MGLU3.SA" 
getSymbols(symbol)

# Calcular os retornos diários
retornos <- dailyReturn(Cl(get(symbol)))

# Plotar o histograma dos retornos
ggplot(data = as.data.frame(retornos), aes(x = retornos)) +
  geom_histogram(binwidth = 0.02, fill = "skyblue", color = "black", alpha = 0.7) +
  labs(title = "Histograma dos Retornos Diários",
       x = "Retornos Diários", y = "Frequência") +
  theme_minimal()


# criando o gráfico de candlestick
grafico <- chartSeries(MGLU3.SA, theme = "white", subset = "last 1 year")

# retorno do histograma 
grafico <- addMACD()

grafico

Ánalise do Histograma
Ao analisar verificamos que a marca normalmente fica com uma frequência alta próximo de 0.0 , -0.1 e 0.1, sendo um valor bem baixo, os períodos de maior volatilidade foi de 11 de março de 2024 até dia 22 de abril de 2024, tendo uma mudança considerada no padrão dos valores, sendo um risco investir na ação neste período e pela análise da linha de sinal e da MACD a tendência é que a marca suba o seu valor, após as diversas quedas que obteve, pois o preço de compra está bem lá embaixo.

Estudo de Tendência
# Instalando e carregando as bibliotecas necessárias
install.packages("quantmod")
library(quantmod)

# Definindo o ticker
ticker <- "MGLU3.SA"  

# Definindo o período desejado
start_date <- "2024-01-01"
end_date <- Sys.Date()  # Data atual

# Baixando os dados da Bovespa
getSymbols(ticker, src = "yahoo", from = start_date, to = end_date)

# Verificando a estrutura dos dados baixados
str(MGLU3.SA)

# Extraindo os preços ajustados
precos_ajustados <- Cl(MGLU3.SA)

# Calculando médias móveis de curto e longo prazo
MGLU3.SA$SMA20 <- SMA(precos_ajustados, n = 20)
MGLU3.SA$SMA50 <- SMA(precos_ajustados, n = 50)

# Calculando os envelopes de Bollinger
n <- 20  # Período para os envelopes de Bollinger
MGLU3.SA$SDB <- BBands(precos_ajustados, n = n, maType = "SMA", sd = 2)$dn
MGLU3.SA$SDT <- BBands(precos_ajustados, n = n, maType = "SMA", sd = 2)$up

# Plotando os preços ajustados com médias móveis e envelopes de Bollinger
plot(precos_ajustados, type = "l", col = "blue", main = "Preços Ajustados e Indicadores Técnicos",
     ylab = "Preço Ajustado")
lines(MGLU3.SA$SMA20, col = "red")
lines(MGLU3.SA$SMA50, col = "green")
lines(MGLU3.SA$SDB, col = "orange")
lines(MGLU3.SA$SDT, col = "orange")

Análise do estudo de Tendência
Após a análise dos calculos de média móvel e do estudo dos envelopes de Bollinger, a tendência foi identica que foi observada nos gráficos de candlestick com os indicadores técnicos, tendo a entrada no mercado em janeiro e a saida em março, e tendo a caida brustica no seu valor indo de 2.0 para 1.4

Notícias Financeias
Neste link no site infomoney: https://www.infomoney.com.br/mercados/magazine-luiza-mglu3-cai-quase-8-e-puxa-quedas-do-setor-de-varejo-na-bolsa/

informa o que os estudos do gráfico demostrou, a queda recente nas ações da empresa, o que também puxou a queda do setor de varejo.

Neste outro link no site moneyinvest: https://moneyinvest.com.br/as-acoes-da-magazine-luiza-mglu3-ja-cairam-mais-de-30-em-abril/

informa também a queda nas ações de 11 dias atrás de mais de 30% na empresa da Maganize Luiza.
