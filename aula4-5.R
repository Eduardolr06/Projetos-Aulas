# WDI - WORLD DEVELOPMENT INDICATORS
# BASE DE DADOS DO BANCO MUNDIAL

#install.packages("WDI")
library(WDI)
# SEMPRE PROCUREM AS VIGNETTES
# PÁGINAS COM ORIENTAÇÕES DOS PACOTES

# BAIXAR OS DADOS DO PIB (PRODUTO INTERNO BRUTO)
# TUDO QUE É PRODUZIDO EM UM PAÍS/ESTADO/MUN.
# EM UM DETERMINADO PERÍODO

# GDP (current US$)(NY.GDP.MKTP.CD)
#GROSS DOMESTIC PRODUCT (GPD) EM DÓLARES NORTE-AMERICANOS 
# CÓDIGO NY.GDP.MKTP.CD

COD_GDP <- WDIsearch('gdp')
# É IMPORTANTE PROCURAR PELO PRÓPRIO
# SITE DO BANCO MUNDIAL, É MAIS
# EFICIENTE 

#COM O CÓDIGO, VAMOS BAIXAR OS DADOS

options(scipen = 999) # AJUSTAR NÚMEROS (NOT. CIENT
basepib <- WDI(country = 'all',
               indicator = 'NY.GDP.MKTP.CD')

basepib2023 <- WDI(country = 'all',
                  indicator = 'NY.GDP.MKTP.CD',
                  start = 2023, end = 2023)


#AULA 5

# API (FORMA DE ACESSO)
# DADOS DO BANCO MUNDIAL (WORLD BANK)
# WORLD DEVELOPMENT INDICATORS (BASE DE DADOS)

# NA AULA PASSADA, ACESSAMOS OS DADOS DO PIB
# PRODUTO INTERNO BRUTO
library(WDI) # CARREGAR A BIBLOTECA/PACOTE

options(scipen = 999) # AJUSTAR NÚMEROS (NOT. CIENT
basepib <- WDI(country = 'all',
               indicator = 'NY.GDP.MKTP.CD')

basepib2023 <- WDI(country = 'all',
                   indicator = 'NY.GDP.MKTP.CD',
                   start = 2023, end = 2023)
                    
install.packages("WDI")

basepibbr <- WDI(country = 'BR',
               indicator = 'NY.GDP.MKTP.CD')

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
                       start = 2023, end = 2023)


# SERIE TEMPORAL
# CEREAL PRODUCTION (METRIC TONS)

produçao_cereal <- WDI(country = 'CHN',
                 indicator = 'AG.PRD.CREL.MT')
