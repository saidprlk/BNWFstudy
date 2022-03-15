
set Pa 1.0e-6
set MPa [expr $Pa*10**6]
set GPa [expr $Pa*10**9]
set mm 1.0e+3
#Steel 18mm Properties
set fy1 [expr 472.*$MPa]
set E [expr 200.*$GPa]
set A1 [expr 3.1416*(18.)**2/4.]

#Steel 14mm Properties
set fy2 [expr 452.*$MPa]
set fu2 [expr 645.*$MPa]
set A2 [expr 3.1416*(14.)**2/4.]
set Sy 0.484;#4.841e-4
set Su [expr $Sy*35]
set bbond 0.4
set Rbond 0.6

#Steel 8mm Properties
set fy3 [expr 447.*$MPa]
set A3 [expr 3.1416*(8.)**2/4.]

set R0 20.
set R1 0.925
set R2 0.15
set b 0.085;#[expr 1./1000.]

#Concrete properties 
set fc1  [expr -18.1*$MPa]
set fc2  [expr -20.2*$MPa]
set fc3  [expr -19.7*$MPa]
set fc100 [expr -18.1*$MPa]
set ec  -0.002
set ecu -0.006
set ecuc -0.009
set fp1  [expr 0.8*$fc1]
set fp2  [expr 0.8$fc2]
set fp3  [expr 0.8*$fc3]
set Ec  [expr 27.8*$GPa]
set Ec100 [expr 27.8*$GPa]
set fct [expr -$fc1/10000000.]
set et  [expr -$ec/10000000.]
set beta 0.1

set H 2600.
set L1 2.
set L2 5.

set m1 [expr (15768.35+662.6)/1000.]; #kg mass
set m2 [expr (27147.05+662.6)/1000.]
set m3 [expr (25554.28+662.6)/1000.]

##-------------------------------
## Soil Properties
##-------------------------------
##soil properties are according to SSG02 report
#set g 9.81; #--m/s^2
#set soilType 2; #---soiltype clay 1, sand 2
#set crad 0.05; #---radiation damping
#set cd 0.; #---ratio of maximum drag to ultimate resistance
#set tp 0.1; #---uplift capacity
#set phi 36.; #---friction abgle
#set gamma 16200.; #---unit wt (N/m^3)
#set beta 0.; #---angle of load applied
#set c 0.; #---cohesion
#set Esoil [expr 40.*pow(10,6)]; #---Modulus of soil assumed as 40 MPa for dense sand (Dr=80%)
#set neu 0.35;
#set kunlFact 1.0
#set Vs 343. ; #Shear wave velocity m/s
##-------------------------------
## Assign Footing Dimensions
##-------------------------------
#set footL 2.; #----length, width and height of the strip footing in m
#set footB 2.
#set footH 0.5
#set Df 0.; #---depth of embedment
##set Lwall 2.5; #----length, width and height of shear wall in m
##set Bwall 0.38
##set Hwall 10.1
##set AspRatio 1.7; #--aspect ratio (M/H/L)
##set pod [expr $AspRatio*$footL] ; #----point of lateral load application
##-------------------------------
## Assign Mass and FSv
##-------------------------------
#set Wg_1 425890.
#set Wg_2 728128.
#set Wg_3 719295.
##set Mg 28880.0; #---mass of structure in prototype scale (kg), provided by Gajan
##set FSv 5.2; #---vertical factor of safety, provided by Gajan
##set Ealum [expr 68.9*pow(10,9)]; #[N/m^2];
##set Wg [expr $Mg*$g]
##set Qult [expr $Wg*$FSv]
##-------------------------------
## Mesh Properties
##-------------------------------
#set ratioK 2.5; #----based on Harden, 2003 (or FEMA-356, chapter-10)
#set ratioe 12. ;#----end length ratio (Le/L)
#set ndivm 20 ;#----no of divisions at mid region; should always be even
#set ratioDIV 4.0 ;#----ratio of mid element length to end element length
#