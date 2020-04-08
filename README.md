# Análise de GilbeRto Gil 

## Introdução

"Gilberto Passos Gil Moreira, conhecido como Gilberto Gil (Salvador, 26 de junho de 1942), é um cantor, compositor, instrumentista, produtor musical e político brasileiro, conhecido por sua contribuição na música brasileira e por ser vencedor de prêmios Grammys Americano, Grammy Latino e galardeado pelo governo francês com a Ordem Nacional do Mérito (1997). [...] Em mais de cinquenta álbuns lançados, ele incorpora a gama eclética de suas influências, incluindo rock, gêneros tipicamente brasileiros, música africana, funk, música disco e reggae."

Este repositório extrai dados das músicas de Gilberto Gil pelo API do Spotify através do pacote spotifyr e faz uma rápida análise de suas músicas e álbums lançados. O código pode ser rapidamente adaptado para outros artistas.

## Dados dos Álbuns

Abaixo estão os álbuns mais e menos populares de Gilberto Gil. Os álbuns lançados nos anos 70 e pós anos 2000 são os mais populares. É importante notar que alguns dos "menos populares" estão disponíveis para poucos mercados, o que explica a baixa popularidade segundo métrica do Spotify.

![Most popular albums](/Images/Album_Popularity_Head.png)
![Least popular albums](/Images/Album_Popularity_Tail.png)

A quantidade de álbuns e músicas lançadas por ano mostra a prolifica carreira de Gilberto Gil, chegando a ter 5 álbuns lançados em 2002.

![Albums/Songs released by year](/Images/Albums_and_Songs_released_by_Year.png)

A razão de modo mostra quantos % das músicas do álbum estão em tom maior.

![Album mode ratio (head)](/Images/Mode_Ratio_Head.png)
![Album mode ratio (tail)](/Images/Mode_Ratio_Tail.png)

## Dados das Músicas

### Popularidade

```The popularity is calculated by algorithm and is based, in the most part, on the total number of plays the track has had and how recent those plays are.```

Podemos ver grandes clássicos de Gilberto Gil entre suas músicas mais populares.

![Most popular songs](/Images/Popularity_Head.png)

Os dados nos permitem analisar a popularidade das músicas por tom e modo. Não há exatamente uma tendência clara, exceto pela popularidade das músicas em Dó menor (C Minor).

![Most popular songs by key](/Images/Popularity_Plot.png)

### Positividade (Valence)

```	A measure from 0.0 to 1.0 describing the musical positiveness conveyed by a track.```

Abaixo estão as canções mais e menos "positivas" segundo o algoritmo do Spotify.

![Most positive songs](/Images/Valence_Head.png)
![Least positive songs](/Images/Valence_Tail.png)

Também é possível analisar a relação de tom e modo entre a positividade das músicas.

![Positivity by Key](/Images/Valence_Plot.png)

### Tom e Modo

As músicas de Gil geralmente estão em tom Maior.

![Main mode](/Images/Songs_by_Mode.png)

![Main Key/Mode](/Images/Songs_by_Key_Mode.png)

## Evolução das músicas ao longo do tempo

### Tom por ano

![Key by Year Timeline](https://raw.githubusercontent.com/rodrigobercini/gilberto-gil-eda/master/Images/Songs_by_Key_Timeline.gif)

### Popularidade por ano

![Popularity by Year](/Images/Popularity_by_Year.png)

### Positividade por ano

![Valence by Year](/Images/Valence_by_Year.png)

### Dançabilidade por ano

```	Danceability describes how suitable a track is for dancing based on a combination of musical elements including tempo, rhythm stability, beat strength, and overall regularity.```

![Danceability by Year](/Images/Danceability_by_Year.png)
