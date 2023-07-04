reset
#set term epslatex default
#set term postscript eps enhanced color 'Serif'
set term pdf enhanced color font "Serif,"

set encoding utf8

set samples 250

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
set dummy r
η(r)   = sqrt(1-r**2)
ξ(r)   = sqrt(r**2-1)
acot(r) = pi/2-atan(ξ(r))



#Función Métrica 

#Dentro del disco
Ui(r)  = -(3*pi*M/8)*(η(r)**2+1)
dUi(r) = (3*pi*M*r)/(4*d)

#Fuera del disco
Uo(r)  = -(3*M/4)*((1-ξ(r)**2)*acot(r)+ξ(r))
dUo(r) = (3*M*r)/(2*d*(ξ(r)**2+1))*((ξ(r)**2+1)*acot(r)-ξ(r))



#Potencial efectivo

Veff(r) = r**2<1 ? (1-Ui(r))**(-2/k)*(ε**2+L**2/(d**2*r**2)*(1-Ui(r))**(-2/k)) :\
                   (1-Uo(r))**(-2/k)*(ε**2+L**2/(d**2*r**2)*(1-Uo(r))**(-2/k))

#Momento angular

L2(r) = r**2<1 ?  (d**3*r**3*((1-Ui(r))**(2/k)*dUi(r)))/(k*(1-Ui(r))-2*d*r*dUi(r)) :\
                  (d**3*r**3*((1-Uo(r))**(2/k)*dUo(r)))/(k*(1-Uo(r))-2*d*r*dUo(r))

#-------------------------------------
M=3.
d=1.
k=4.
#-------------------------------------


ε=-1 #>>>>>Para particulas masivas<<<<<

set output "U1plot_Veff_temp_k20M30.pdf"
set key right bottom box
set xlabel "r̃"
set ylabel "V_{eff}"
set xrange[0:4]
set yrange[0.65:0.85]

plot Veff(r) notitle,\
      L=0.06, Veff(r) ls 2 lw 2 title "ℓ=0.06",\
      L=0.14, Veff(r) ls 3 lw 2 title "ℓ=0.14",\
      L=0.22, Veff(r) ls 4 lw 2 title "ℓ=0.22",\
      L=0.30, Veff(r) ls 5 lw 2 title "ℓ=0.30",\
      L=0.38, Veff(r) ls 6 lw 2 title "ℓ=0.38",\
      L=0.46, Veff(r) ls 7 lw 2 title "ℓ=0.46"




ε=0 #>>>>>Para particulas de masa nula<<<<<

set output "U1plot_Veff_null_k20M30.pdf"
set key right top box
set xlabel "r̃"
set ylabel "V_{eff}"
set xrange[0:4]
#set yrange[0:0.3]
set yrange[0:0.03]

plot Veff(r) notitle,\
      L=0.06, Veff(r) ls 2 lw 2 title "ℓ=0.06",\
      L=0.14, Veff(r) ls 3 lw 2 title "ℓ=0.14",\
      L=0.22, Veff(r) ls 4 lw 2 title "ℓ=0.22",\
      L=0.30, Veff(r) ls 5 lw 2 title "ℓ=0.30",\
      L=0.38, Veff(r) ls 6 lw 2 title "ℓ=0.38",\
      L=0.46, Veff(r) ls 7 lw 2 title "ℓ=0.46"





ε=-1 #>>>>>Momento angular<<<<<
set output "U1plot_Lc.pdf"
set key left top box
set xlabel "r̃"
set ylabel "ℓ_c"
set xrange[0:2]
set yrange[0:0.5]

plot sqrt(L2(r)) notitle,\
      k=20., M=30.  sqrt(L2(r)) ls 1 lw 2 title "(20,30)" ,\
      k=20., M=240. sqrt(L2(r)) ls 2 lw 2 title "(20,240)",\
      k=40., M=30.  sqrt(L2(r)) ls 3 lw 2 title "(40,30)" ,\
      k=40., M=240. sqrt(L2(r)) ls 4 lw 2 title "(40,240)",\
      k=60., M=30.  sqrt(L2(r)) ls 5 lw 2 title "(60,30)" ,\
      k=60., M=240. sqrt(L2(r)) ls 6 lw 2 title "(60,240)"



set output 


