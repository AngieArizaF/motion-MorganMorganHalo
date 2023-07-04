reset
#set term epslatex default
#set term postscript eps enhanced color 'Serif'
set term pdf enhanced color font "Serif," size 5in,5in

set encoding utf8

set polar

set grid polar 30 lw 1
set autoscale
set margins 2,2,2,2 # <left>, <right>, <bottom>, <top>
set size square


# Axes
set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror out scale 0.75
set tics font ",14"
#set xtics  ('5x10**{10}' 5e10, '10x10**{10}' 10e10, '15x10**{10}' 15e10, '20x10**{10}' 20e10)
#set xlabel offset 0,0.5
#set xlabel "x-axis" font ",16"
#set ylabel offset 0.5,0
#set ylabel "y-axis" font ",16"


# color definitions
# load line style definitions
load 'parula.pal'


set key right top box
set key font ",14"




#>>>>>Orbitas<<<<<

set output "U1orbitPlot_E07L01.pdf"
plot 0.975 ls 6 lw 2 title "r̃≈0.0.975",\
      "U1orbit_E07L01.txt" using 1:2 with lines ls 3 lw 1 notitle,\
      0.311 ls 4 lw 2 title "r̃≈0.311"

set output "U1orbitPlot_E0712L01.pdf"
plot 1.098 ls 6 lw 2 title "r̃≈1.098",\
      "U1orbit_E0712L01.txt" using 1:2 with lines ls 3 lw 1 notitle,\
      0.274 ls 4 lw 2 title "r̃≈0.274"

set output "U1orbitPlot_E076L02.pdf"
plot 1.949 ls 6 lw 2 title "r̃≈1.949",\
      "U1orbit_E076L02.txt" using 1:2 with lines ls 3 lw 1 notitle,\
      0.412 ls 4 lw 2 title "r̃≈0.412"

set output "U1orbitPlot_E076L03.pdf"
plot 1.668 ls 6 lw 2 title "r̃≈1.668",\
      "U1orbit_E076L03.txt" using 1:2 with lines ls 3 lw 1 notitle,\
      0.662 ls 4 lw 2 title "r̃≈0.662"

set output "U1orbitPlot_E079L04.pdf"
plot 2.617 ls 6 lw 2 title "r̃≈2.617",\
      "U1orbit_E079L04.txt" using 1:2 with lines ls 3 lw 1 notitle,\
      0.813 ls 4 lw 2 title "r̃≈0.813"

set output "U1orbitPlot_E08L05.pdf"
plot 2.774 ls 6 lw 2 title "r̃≈2.774",\
      "U1orbit_E08L05.txt" using 1:2 with lines ls 3 lw 1 notitle,\
      1.292 ls 4 lw 2 title "r̃≈1.292"





set output "U2orbitPlot_E069L01.pdf"
plot 0.815 ls 6 lw 2 title "r̃≈0.815",\
      "U2orbit_E069L01.txt" using 1:2 with lines ls 3 lw 1 notitle,\
      0.299 ls 4 lw 2 title "r̃≈0.299"

set output "U2orbitPlot_E07L01.pdf"
plot 0.918 ls 6 lw 2 title "r̃≈0.918",\
      "U2orbit_E07L01.txt" using 1:2 with lines ls 3 lw 1 notitle,\
      0.269 ls 4 lw 2 title "r̃≈0.269"

set output "U2orbitPlot_E074L02.pdf"
plot 1.384 ls 6 lw 2 title "r̃≈1.384",\
      "U2orbit_E074L02.txt" using 1:2 with lines ls 3 lw 1 notitle,\
      0.434 ls 4 lw 2 title "r̃≈0.434"

set output "U2orbitPlot_E075L03.pdf"
plot 1.200 ls 6 lw 2 title "r̃≈1.200",\
      "U2orbit_E075L03.txt" using 1:2 with lines ls 3 lw 1 notitle,\
      0.739 ls 4 lw 2 title "r̃≈0.739"

set output "U2orbitPlot_E077L03.pdf"
plot 2.024 ls 6 lw 2 title "r̃≈2.024",\
      "U2orbit_E077L03.txt" using 1:2 with lines ls 3 lw 1 notitle,\
      0.606 ls 4 lw 2 title "r̃≈0.606"

set output "U2orbitPlot_E078L04.pdf"
plot 2.036 ls 6 lw 2 title "r̃≈2.036",\
      "U2orbit_E078L04.txt" using 1:2 with lines ls 3 lw 1 notitle,\
      1.034 ls 4 lw 2 title "r̃≈1.034"






set output "U3orbitPlot_E068L01.pdf"
plot 0.674 ls 6 lw 2 title "r̃≈0.674",\
      "U3orbit_E068L01.txt" using 1:2 with lines ls 3 lw 1 notitle,\
      0.309 ls 4 lw 2 title "r̃≈0.309"

set output "U3orbitPlot_E069L01.pdf"
plot 0.779 ls 6 lw 2 title "r̃≈0.779",\
      "U3orbit_E069L01.txt" using 1:2 with lines ls 3 lw 1 notitle,\
      0.272 ls 4 lw 2 title "r̃≈0.272"

set output "U3orbitPlot_E072L02.pdf"
plot 0.913 ls 6 lw 2 title "r̃≈0.913",\
      "U3orbit_E072L02.txt" using 1:2 with lines ls 3 lw 1 notitle,\
      0.499 ls 4 lw 2 title "r̃≈0.499"

set output "U3orbitPlot_E075L02.pdf"
plot 1.628 ls 6 lw 2 title "r̃≈1.628",\
      "U3orbit_E075L02.txt" using 1:2 with lines ls 3 lw 1 notitle,\
      0.393 ls 4 lw 2 title "r̃≈0.393"

set output "U3orbitPlot_E076L03.pdf"
plot 1.612 ls 6 lw 2 title "r̃≈1.612",\
      "U3orbit_E076L03.txt" using 1:2 with lines ls 3 lw 1 notitle,\
      0.667 ls 4 lw 2 title "r̃≈0.667"

set output "U3orbitPlot_E078L04.pdf"
plot 2.016 ls 6 lw 2 title "r̃≈2.016",\
      "U3orbit_E078L04.txt" using 1:2 with lines ls 3 lw 1 notitle,\
      1.078 ls 4 lw 2 title "r̃≈1.078"




unset polar
set output 


