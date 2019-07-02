# Autor: Hygor Jardim da Silva - hygorjardim@gmail.com
# Mestrando de Ciência da Computação
# Centro de Informática - CIn
# Universidade Federal de Pernambuco - UFPE

reset
set autoscale
unset log
unset label
#set terminal postscript eps enhanced color dashed defaultplex "Arial" 14

#set grid nopolar
#set grid noxtics nomxtics ytics nomytics noztics nomztics nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set encoding utf8
set style data lines
set xtics nomirror font "Arial,22"
set xlabel "Anos" font "Arial,22"
set xtics textcolor rgb "black" font "Arial,18"
set xtics 1995,1,2015 # passo de amostragem
set xrange [1994.7:2015.3] # corte de amostragem

set ylabel "Emissões de GEE (bilhões de t CO_{2}e)" font "Arial,20"
set yrange [0:4.5]
set ytics textcolor rgb "black" font "Arial,18"
set size 1.8,1.0

set term postscript eps color enhanced
set output "dados-gases-do-efeito-estufa.eps"
set key out horizontal
set key center top
#set key box linetype -1 linewidth 1.000
set key font "Arial,24"
set key spacing 3.5

set style line 1 lc rgb '#F9AA33' pt 7 ps 2 lt 1 lw 5 # --- red
set style line 2 lc rgb '#853A2B' pt 7 ps 2 lt 1 lw 5 # --- green
set style line 3 lc rgb '#1F6135' pt 7 ps 2 lt 1 lw 5 # --- blue
set style line 4 lc rgb '#211D1E' pt 2 ps 2 lt 1 lw  5 # --- orange
set style line 5 lc rgb '#FEECCE'
set style line 6 lc rgb '#E1C9BD'
set style line 7 lc rgb '#C6D5BF'

set style textbox transparent noborder
# levar em consideração que os plots serão soprepostos em camadas, deve ter uma ordem correta
plot "dados-gases-do-efeito-estufa.dat" using 1:4 with filledcurves x1 notitle ls 7, \
"dados-gases-do-efeito-estufa.dat" using 1:3 with filledcurves x1 notitle ls 6, \
"dados-gases-do-efeito-estufa.dat" using 1:2 with filledcurves x1 notitle ls 5, \
"dados-gases-do-efeito-estufa.dat" u 1:2 t 'Pará' w lp ls 1 , \
"dados-gases-do-efeito-estufa.dat" using 1:2:2 with labels boxed center offset 0.,1.6 font "Arial,15" tc ls 4 notitle, \
     '' u 1:3 t 'Amazônia' w lp ls 2, \
"dados-gases-do-efeito-estufa.dat" using 1:3:3 with labels boxed center offset 0.,1.5 font "Arial,15" tc ls 4 notitle, \
     '' u 1:4 t 'Brasil' w lp ls 3, \
"dados-gases-do-efeito-estufa.dat" using 1:4:4 with labels boxed center offset 0.,1.2 font "Arial,15" tc ls 4 notitle
