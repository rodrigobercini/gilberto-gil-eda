# Análise de GilbeRto Gil 

## Introdução

Gilberto Passos Gil Moreira, conhecido como Gilberto Gil (Salvador, 26 de junho de 1942), é um cantor, compositor, instrumentista, produtor musical e político brasileiro, conhecido por sua contribuição na música brasileira e por ser vencedor de prêmios Grammys Americano, Grammy Latino e galardeado pelo governo francês com a Ordem Nacional do Mérito (1997). [...] Em mais de cinquenta álbuns lançados, ele incorpora a gama eclética de suas influências, incluindo rock, gêneros tipicamente brasileiros, música africana, funk, música disco e reggae.

Este repositório extrai dados das músicas de Gilberto Gil pelo API do Spotify através do pacote spotifyr e faz uma rápida análise de suas músicas e álbums lançados. O código pode ser rapidamente adaptado para outros artistas.

## Conceitos

```The popularity is calculated by algorithm and is based, in the most part, on the total number of plays the track has had and how recent those plays are.```

```	A measure from 0.0 to 1.0 describing the musical positiveness conveyed by a track.```

```	Danceability describes how suitable a track is for dancing based on a combination of musical elements including tempo, rhythm stability, beat strength, and overall regularity.```

## Dados dos Álbuns

Abaixo estão os principais álbuns segundo média de popularidade das músicas.

![Most popular albums](/Images/Album_Popularity_Head.png)
![Least popular albums](/Images/Album_Popularity_Tail.png)

Quantidade de álbuns e músicas lançadas por ano

![Albums/Songs released by year](/Images/Albums_and_Songs_released_by_Year.png)

A razão de modo mostra quantos % das músicas do álbum estão em tom maior.

![Album mode ratio (head)](/Images/Mode_Ratio_Head.png)
![Album mode ratio (tail)](/Images/Mode_Ratio_Tail.png)

## Dados das Músicas

-Popularity (head) + graph

![Most popular songs](/Images/Popularity_Head.png)
![Most popular songs by key](/Images/Popularity_Plot.png)

-Valence (head/tail) + graph

![Most positive songs](/Images/Valence_Head.png)
![Least positive songs](/Images/Valence_Tail.png)
![Positivity by Key](/Images/Valence_Plot.png)

-Mode (head)

![Main mode](/Images/Songs_by_Mode.png)

-Key/Mode (head)

![Main Key/Mode](/Images/Songs_by_Key_Mode.png)

## Evolução das músicas ao longo do tempo

-Key by Year

![Key by Year Timeline](https://raw.githubusercontent.com/rodrigobercini/gilberto-gil-eda/master/Images/Songs_by_Key_Timeline.gif)

-Popularity by Year

![Popularity by Year](/Images/Popularity_by_Year.png)

-Valence by Year

![Valence by Year](/Images/Valence_by_Year.png)

-Danceability by Year

![Danceability by Year](/Images/Danceability_by_Year.png)
