# AULA 7
# MELHORANDO OS GRÁFICOS


# GRAFICO_DADOS_EM_PAINEL
#PASSAGEIROS_TRANSPORTADOS

#install.packages("ggplot2")
#install.packages("WDI")
#install.packages("dplyr")

#CARREGAR BIBLOTECAS
library(WDI)
library(ggplot2)
library(dplyr)

options(scipen = 999)

# Carregar pacotes
library(WDI)
library(ggplot2)
library(dplyr)

# Baixar dados
PASSENGERS_CARRIED <- WDI(country = 'all', indicator = 'IS.AIR.PSGR')

# Adiciona uma coluna com rótulo dos países destacados
PASSENGERS_CARRIED <- PASSENGERS_CARRIED %>%
  mutate(grupo = case_when(
    iso2c == "BR" ~ "Brasil",
    iso2c == "US" ~ "Estados Unidos",
    TRUE ~ "Outros"
  ))

# Paleta de cores personalizada
cores <- c("Brasil" = "#006400", "Estados Unidos" = "blue", "Outros" = "grey80")

# Gráfico
grafpainel <- ggplot(PASSENGERS_CARRIED, aes(x = year, y = IS.AIR.PSGR, group = iso2c)) +
  
  # Linhas para outros países (cinza claro e finas)
  geom_line(data = subset(PASSENGERS_CARRIED, grupo == "Outros"),
            color = "grey80", alpha = 0.4, size = 0.5) +
  
  # Linhas destacadas (Brasil e EUA)
  geom_line(data = subset(PASSENGERS_CARRIED, grupo != "Outros"),
            aes(color = grupo),
            size = 1.5) +
  
  # Pontos destacados
  geom_point(data = subset(PASSENGERS_CARRIED, grupo != "Outros"),
             aes(color = grupo),
             size = 3) +
  
  # Títulos e legenda
  labs(
    title = "Passageiros Transportados por Via Aérea",
    x = "Ano",
    y = "Passageiros Transportados (milhões)",
    color = "País"
  ) +
  
  scale_color_manual(values = cores) +
  
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 16, hjust = 0.5),
    legend.position = "bottom"
  )

# Exibir o gráfico
print(grafpainel)





#GRAFICO_CORTE_TRANSVERSAL
#FORÇAS_ARMADAS_EUA

install.packages("gganimate")
# Carregar bibliotecas
library(WDI)
library(ggplot2)
library(dplyr)
library(gganimate)

# Carregar pacotes
library(WDI)
library(ggplot2)
library(dplyr)

# Baixar dados
PASSENGERS_CARRIED <- WDI(country = 'all', indicator = 'IS.AIR.PSGR')

# Filtrar só os países desejados + adicionar rótulo
dados_destacados <- PASSENGERS_CARRIED %>%
  filter(iso2c %in% c("BR", "FR", "ES")) %>%
  mutate(País = case_when(
    iso2c == "BR" ~ "Brasil",
    iso2c == "FR" ~ "França",
    iso2c == "ES" ~ "Espanha"
  ))

# Paleta de cores
cores <- c("Brasil" = "#006400", "França" = "blue", "Espanha" = "red")

# Gráfico com facetas separadas
grafpainel <- ggplot(dados_destacados, aes(x = year, y = IS.AIR.PSGR)) +
  geom_line(aes(color = País), size = 1.5) +
  geom_point(aes(color = País), size = 2) +
  facet_wrap(~País, scales = "free_y") +  # Cria um gráfico para cada país
  scale_color_manual(values = cores) +
  labs(
    title = "Passageiros Transportados por Via Aérea (por país)",
    x = "Ano",
    y = "Passageiros Transportados (milhões)",
    color = "País"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 16, hjust = 0.5),
    legend.position = "none"
  )

# Mostrar gráfico
print(grafpainel)



#GRAFICO_SERIE_TEMPORAL
#PRODUÇÃO-DE-CEREAL_CHINA


# Carregar bibliotecas
library(WDI)
library(ggplot2)
library(gganimate)
library(dplyr)

# Baixar dados da produção de cereal da China
producao_cereal <- WDI(country = 'CHN',
                       indicator = 'AG.PRD.CREL.MT')

# Limpar os dados (remover NAs)
producao_cereal <- producao_cereal %>%
  filter(!is.na(AG.PRD.CREL.MT))

# Gráfico mais colorido e moderno
grafserie <- ggplot(producao_cereal, aes(x = year, y = AG.PRD.CREL.MT)) +
  
  # Linha da China em vermelho vibrante
  geom_line(color = "#FF4500", size = 2) +
  
  # Pontos em gradiente para destacar valores
  geom_point(aes(color = AG.PRD.CREL.MT), size = 3) +
  
  # Escala de cor vibrante (azul para vermelho intenso)
  scale_color_gradient(low = "#00FFFF", high = "#FF4500") +
  
  # Títulos e eixos personalizados
  labs(
    title = "🚀 Produção de Cereal na China (Série Temporal)",
    subtitle = "Evolução ao longo dos anos com destaque moderno",
    x = "Ano",
    y = "Produção de Cereal (Toneladas)",
    color = "Produção"
  ) +
  
  # Tema moderno com fundo escuro
  theme_minimal(base_size = 14) +
  theme(
    plot.background = element_rect(fill = "#121212", color = NA),
    panel.background = element_rect(fill = "#121212", color = NA),
    panel.grid.major = element_line(color = "#444444"),
    panel.grid.minor = element_line(color = "#444444"),
    plot.title = element_text(face = "bold", size = 18, hjust = 0.5, color = "white"),
    plot.subtitle = element_text(size = 12, hjust = 0.5, color = "white"),
    axis.title = element_text(color = "white"),
    axis.text = element_text(color = "white"),
    legend.title = element_text(color = "white"),
    legend.text = element_text(color = "white")
  ) +
  
  # Animação fluida revelando a linha
  transition_reveal(year)

# Rodar a animação
animate(grafserie, width = 800, height = 500, fps = 20, duration = 5, renderer = gifski_renderer())

# Salvar se quiser
anim_save("producao_cereal_china_moderno.gif")






