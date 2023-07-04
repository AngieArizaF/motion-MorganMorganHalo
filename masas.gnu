reset
#set term epslatex default
#set term postscript eps enhanced color 'Serif'
set term pdf enhanced color font "Serif,"

set encoding utf8

set samples 1000

set grid
set autoscale
set margins 10,6,3,1 # <left>, <right>, <bottom>, <top>


# Axes
set style line 11 lc rgb '#808080' lt 1
set border 3 back ls 11
set tics nomirror out scale 0.75
set tics font ",14"
#set xtics  ('5x10**{10}' 5e10, '10x10**{10}' 10e10, '15x10**{10}' 15e10, '20x10**{10}' 20e10)
set xlabel offset 0,0.5
set xlabel "x-axis" font ",16"
set ylabel offset 0.5,0
set ylabel "y-axis" font ",16"


# color definitions
# load line style definitions
load 'parula.pal'


set key right top box
set key font ",14"




#------------------------------------
#Definición de las transformaciones

acot(x) = pi/2-atan(x)



D(x) =(64./x)*(1-sqrt(1+8./(3*pi*M))*acot(sqrt(3*pi*M/(3*pi*M+8))))
H(x) = (8*pi*M/x) - D(x)
T(x) = H(x) + D(x)


set output "masas.pdf"
set key right top box
set xlabel "k"
set ylabel "Masa relativista"
set xrange[0:20]
set yrange[-5:15]
#set autoscale


plot D(x) notitle,\
      M=2., D(x) ls 2 lw 2 title "DM2",\
      M=3., D(x) ls 3 lw 2 title "DM3",\
      M=4., D(x) ls 4 lw 2 title "DM4",\
     H(x) notitle,\
      M=2., H(x) ls 5 lw 2 title "HM2",\
      M=3., H(x) ls 6 lw 2 title "HM3",\
      M=4., H(x) ls 7 lw 2 title "HM4"


set key right top box
set xlabel "k"
set ylabel "Masa relativista"
set xrange[0:1000]
set yrange[0:1000]
#set autoscale
set log y
set log x

plot D(x) notitle,\
      M=20., D(x) ls 2 lw 2 title "DM20",\
      M=3., D(x) ls 3 lw 2 title "DM3",\
      M=4., D(x) ls 4 lw 2 title "DM4",\
     H(x) notitle,\
      M=20., H(x) ls 5 lw 2 title "HM20",\
      M=3., H(x) ls 6 lw 2 title "HM3",\
      M=4., H(x) ls 7 lw 2 title "HM4"

set nolog

D(x) =(64./k)*(1-sqrt(1+8./(3*pi*x))*acot(sqrt(3*pi*x/(3*pi*x+8))))
H(x) =8*pi*x/k - D(x)
T(x) = H(x) + D(x)

set xlabel "M disco Newtoniano"
set key right top box
set xrange[0:10]
set yrange[0:25]

plot D(x) notitle,\
      k=2., D(x) ls 2 lw 2 title "Dk2",\
      k=4., D(x) ls 3 lw 2 title "Dk4",\
      k=6., D(x) ls 4 lw 2 title "Dk6",\
     H(x) notitle,\
      k=2., H(x) ls 5 lw 2 title "Hk2",\
      k=4., H(x) ls 6 lw 2 title "Hk4",\
      k=6., H(x) ls 7 lw 2 title "Hk6"


set xlabel "M disco Newtoniano"
set key right top box
set xrange[0:1000]
set yrange[0:1000]
set log x
set log y
plot D(x) notitle,\
      k=2., D(x) ls 2 lw 2 title "Dk2",\
      k=4., D(x) ls 3 lw 2 title "Dk4",\
      k=20., D(x) ls 4 lw 2 title "Dk20",\
     H(x) notitle,\
      k=2., H(x) ls 5 lw 2 title "Hk2",\
      k=4., H(x) ls 6 lw 2 title "Hk4",\
      k=20., H(x) ls 7 lw 2 title "Hk20"

set nolog

#plot D(x) title "Disco", H(x) title "Halo"

set output 


