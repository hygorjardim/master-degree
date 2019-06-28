set terminal png size 800,800 enhanced font "Helvetica,20"
set output 'output3.png'

set yrange [0:80]
set style line 2 lc rgb 'black' lt 1 lw 1
set style data histogram
set style histogram cluster gap 1
set style fill pattern border -1
set boxwidth 0.9
set xtics format ""
set grid ytics

set title "Tempo de Resposta"
plot "bar2.dat" using 2:xtic(1) title "1 Mil" ls 2, \
            '' using 3 title "3 Mil" ls 2, \
            '' using 4 title "5 Mil" ls 2, \
            '' using 5 title "7 Mil" ls 2