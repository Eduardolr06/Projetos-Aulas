# API (FORMA DE ACESSO)
# DADOS DO BANCO MUNDIAL (WORLD BANK)
# WORLD DEVELOPMENT INDICATORS (BASE DE DADOS)

# NA AULA PASSADA, ACESSAMOS OS DADOS DO PIB
# PRODUTO INTERNO BRUTO

library(WDI) # CARREGAR A BIBLIOTECA/PACOTE

options(scipen = 999) # AJUSTA A NOT. CIENT.

# DADOS EM PAINEL
dadospib <- WDI(country = 'all',
                indicator = 'NY.GDP.MKTP.CD')
# CORTE TRANSVERSAL
dadospib2023 <- WDI(country = 'all',
                    indicator = 'NY.GDP.MKTP.CD',
                    start = 2020, end = 2020)
# SÉRIE TEMPORAL
dadospibbr <- WDI(country = 'BR',
                  indicator = 'NY.GDP.MKTP.CD')

## FAZER GRÁFICOS

install.packages("tidyverse")
library(tidyverse)

# DADOS EM PAINEL

grafpainel <- ggplot(dadospib,
                  mapping = aes(y = NY.GDP.MKTP.CD,
                                x = year)) +
  geom_point()

print(grafpainel)


# CORTE TRANSVERSAL

grafcorte <- ggplot(dadospib2023,
                     mapping = aes(y = NY.GDP.MKTP.CD,
                                   x = year)) +
  geom_point()

print(grafcorte)

# SERIE TEMPORAL

grafserie <- ggplot(dadospibbr,
                     mapping = aes(y = NY.GDP.MKTP.CD,
                                   x = year)) +
  geom_line()

print(grafserie)


#PRÁTICA
#MINHAS VARIÁVEIS

# TESTE APRENDIZAGEM
# DADOS EM PAINEL
# PASSAGEIROS TRANSPORTADOS
# TRANSPORTE AÉREO

PASSENGERS_CARRIED <- WDI(country = 'all',
                          indicator = 'IS.AIR.PSGR')


# CORTE TRANSVERSAL
# ARMED FORCE PERSONNEL, TOTAL

FORÇAS_ARMADAS <- WDI(country = 'all',
                      indicator = 'MS.MIL.TOTL.P1',
                      start = 2020, end = 2020)


# SERIE TEMPORAL
# CEREAL PRODUCTION (METRIC TONS)

produçao_cereal <- WDI(country = 'CHN',
                       indicator = 'AG.PRD.CREL.MT')



#GRÁFICOS
#MINHAS VARIÁVEIS

#DADOS EM PAINEL

grafpainel <- ggplot(PASSENGERS_CARRIED,
                     mapping = aes(y = IS.AIR.PSGR,
                                   x = year)) +
  geom_point()

print(grafpainel)


#CORTE TRANSVERSAL

grafcorte <- ggplot(FORÇAS_ARMADAS,
                     mapping = aes(y = MS.MIL.TOTL.P1,
                                   x = year)) +
  geom_point()

print(grafcorte)


# SERIE TEMPORAL

grafserie <- ggplot(produçao_cereal,
                    mapping = aes(y = AG.PRD.CREL.MT,
                                  x = year)) +
  geom_line()

print(grafserie)



