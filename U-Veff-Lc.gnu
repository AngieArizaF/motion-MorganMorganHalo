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
set dummy r
η(r)   = sqrt(1-r**2)
ξ(r)   = sqrt(r**2-1)
acot(r) = pi/2-atan(ξ(r))


#------------------------------------
#Para U1
#------------------------------------

#Función Métrica 

#Dentro del disco
U1i(r)  = -(3*pi*M/8)*(η(r)**2+1)
dU1i(r) = (3*pi*M*r)/(4*d)

#Fuera del disco
U1o(r)  = -(3*M/4)*((1-ξ(r)**2)*acot(r)+ξ(r))
dU1o(r) = (3*M*r)/(2*d*(ξ(r)**2+1))*((ξ(r)**2+1)*acot(r)-ξ(r))



#Potencial efectivo

V1eff(r) = r**2<1 ? (1-U1i(r))**(-2/k)*(ε**2+L**2/(d**2*r**2)*(1-U1i(r))**(-2/k)) :\
                   (1-U1o(r))**(-2/k)*(ε**2+L**2/(d**2*r**2)*(1-U1o(r))**(-2/k))

#Momento angular

L12(r) = r**2<1 ?  (d**3*r**3*((1-U1i(r))**(2/k)*dU1i(r)))/(k*(1-U1i(r))-2*d*r*dU1i(r)) :\
                  (d**3*r**3*((1-U1o(r))**(2/k)*dU1o(r)))/(k*(1-U1o(r))-2*d*r*dU1o(r))




#------------------------------------
#Para U2
#------------------------------------

#Función Métrica 

#Dentro del disco
U2i(r)  = -(15*pi*M)/(128)*(3*η(r)**4+2*η(r)**2+3)
dU2i(r) = (15*pi*M*r)/(32*d)*(3*η(r)**2+1)

#Fuera del disco
U2o(r)  = -(15*M)/(64)*((3*ξ(r)**4-2*ξ(r)**2+3)*acot(r)-3*ξ(r)**3+3*ξ(r))
dU2o(r) = (15*M)/(16*d*r)*((1-2*ξ(r)**2-3*ξ(r)**4)*acot(r)+3*ξ(r)**3+ξ(r))


#Potencial efectivo

V2eff(r) = r**2<1 ? (1-U2i(r))**(-2/k)*(ε**2+L**2/(d**2*r**2)*(1-U2i(r))**(-2/k)) :\
                   (1-U2o(r))**(-2/k)*(ε**2+L**2/(d**2*r**2)*(1-U2o(r))**(-2/k))

#Momento angular

L22(r) = r**2<1 ?  (d**3*r**3*((1-U2i(r))**(2/k)*dU2i(r)))/(k*(1-U2i(r))-2*d*r*dU2i(r)) :\
                  (d**3*r**3*((1-U2o(r))**(2/k)*dU2o(r)))/(k*(1-U2o(r))-2*d*r*dU2o(r))




#------------------------------------
#Para U3
#------------------------------------

#Función Métrica 

#Dentro del disco
U3i(r)  = -(35*pi*M)/(512)*(5*η(r)**6+3*η(r)**4+3*η(r)**2+5);
dU3i(r) = (35*pi*M*r)/(256*d)*(15*η(r)**4+6*η(r)**2+3);

#Fuera del disco
U3o(r)  = -(35*M)/(256)*((-5*ξ(r)**6+3*ξ(r)**4-3*ξ(r)**2+5)*acot(r)+5*ξ(r)**5-14./3*ξ(r)**3+5*ξ(r));
dU3o(r) = (35*M)/(128*d*r)*((3-3*ξ(r)**2+9*ξ(r)**4+15*ξ(r)**6)*acot(r)+ξ(r)*(3-4*ξ(r)**2-15*ξ(r)**4));



#Potencial efectivo

V3eff(r) = r**2<1 ? (1-U3i(r))**(-2/k)*(ε**2+L**2/(d**2*r**2)*(1-U3i(r))**(-2/k)) :\
                   (1-U3o(r))**(-2/k)*(ε**2+L**2/(d**2*r**2)*(1-U3o(r))**(-2/k))

#Momento angular

L32(r) = r**2<1 ?  (d**3*r**3*((1-U3i(r))**(2/k)*dU3i(r)))/(k*(1-U3i(r))-2*d*r*dU3i(r)) :\
                  (d**3*r**3*((1-U3o(r))**(2/k)*dU3o(r)))/(k*(1-U3o(r))-2*d*r*dU3o(r))




#-------------------------------------
M=30.
d=1.
k=20.
L=0.2
#-------------------------------------


ε=-1 #>>>>>Para particulas masivas<<<<<

set output "Uplot_Veff_temp_k20M30.pdf"
set key right bottom box
set xlabel "r̃"
set ylabel "V_{eff}"
set xrange[0.4:1.6]
set yrange[0.70:0.75]

plot  V1eff(r) ls 2 lw 2 title "m = 1",\
      V2eff(r) ls 5 lw 2 title "m = 2",\
      V3eff(r) ls 4 lw 2 title "m = 3"




ε=0 #>>>>>Para particulas de masa nula<<<<<

set output "Uplot_Veff_null_k20M30.pdf"
set key right top box
set xlabel "r̃"
set ylabel "V_{eff}"
set xrange[0:1]
set yrange[0:0.5]

plot  V1eff(r) ls 2 lw 1 title "m = 1",\
      V2eff(r) ls 5 lw 1 title "m = 2",\
      V3eff(r) ls 4 lw 1 title "m = 3"




ε=-1 #>>>>>Momento angular<<<<<
set output "Uplot_Lc.pdf"
set key left top box
set xlabel "r̃"
set ylabel "ℓ_c"
set xrange[0.01:2]
set yrange[0:0.5]

plot  sqrt(L12(r)) ls 2 lw 2 title "m = 1",\
      sqrt(L22(r)) ls 5 lw 2 title "m = 2",\
      sqrt(L32(r)) ls 4 lw 2 title "m = 3"

set output 


