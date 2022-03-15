if {$Gravity} {
set ratio1 [expr 1.25/1.5]; set ratio2 [expr 0.25/1.5]; set ratio3 [expr 0.25/2.];
pattern Plain 1 $ts_lin {
    eleLoad -ele 4 5 6 7 8 9 10 11 -type -beamUniform $Wg 0.
    eleLoad -ele 15 16 17 18 19 20 21 22 -type -beamUniform $Wg 0.
    eleLoad -ele 26 27 28 19 30 31 32 33 -type -beamUniform $Wg 0.
    eleLoad -ele 7 18 29 10 21 32 -type -beamPoint $Qg 0. $ratio1
    eleLoad -ele 8 19 30 -type -beamPoint $Qg 0. $ratio2
    eleLoad -ele 11 22 33 -type -beamPoint $Qg 0. $ratio3
    load 5 0. $Qg_1 0. 0. 0. 0.
    load 14 0. $Qg_1 0. 0. 0. 0.
    load 23 0. $Qg_1 0. 0. 0. 0.
    load 8 0. $Qg_2 0. 0. 0. 0.
    load 17 0. $Qg_2 0. 0. 0. 0.
    load 26 0. $Qg_2 0. 0. 0. 0.
    load 11 0. $Qg_3 0. 0. 0. 0.
    load 20 0. $Qg_3 0. 0. 0. 0.
    load 29 0. $Qg_3 0. 0. 0. 0.
}

# XXXXXXXXXXXXXXXXX-------Gravity Analysis-------XXXXXXXXXXXXXXXXXX
#recorder mpco "thesisframe.mpco" \
#-N displacement rotation reactionForce reactionMoment modesOfVibration \
#-E force section.force section.fiber.stress


system BandGeneral
constraints Transformation
test NormDispIncr 1.0e-8 250
algorithm KrylovNewton
numberer RCM
integrator LoadControl 0.01
analysis Static
analyze 100
puts "Gravit Analysis is Completed"
loadConst 0.0
}
##
#set tol [expr 10.**-4]
#test NormDispIncr $tol 100 
#

### Pushover Test ##
if {$Pushover} { 
    set firststoreydrift 0.015
    puts "Monotonic Pushover Analysis is Initiated: Aimed Drift: %[expr $firststoreydrift*100]"
set pushnode 5
set du 0.01
set df 100.
pattern Plain 2 $ts_lin {
    #load 26 [expr $df/3.] 0. 0.
    #load 29 [expr $df/3.] 0. 0.
    #load 23 [expr $df/3.] 0. 0.
    load 17 [expr 2.*$df/3./3.] 0. 0. 0. 0. 0.
    load 20 [expr 2.*$df/3./3.] 0. 0. 0. 0. 0.
    load 14 [expr 2.*$df/3./3.] 0. 0. 0. 0. 0.
    load 8 [expr $df/3./3.] 0. 0. 0. 0. 0.
    load 11 [expr $df/3./3.] 0. 0. 0. 0. 0.
    load $pushnode [expr $df/3./3.] 0. 0. 0. 0. 0.
}


constraints Transformation
numberer RCM
system BandGeneral
algorithm KrylovNewton
test NormDispIncr 1.0e-5 250
integrator DisplacementControl $pushnode 1 $du 100
analysis Static
analyze [expr int([expr 2600*$firststoreydrift/$du])]

}

if {$CyclicPushover} {
set pushnode 5
set df 100.
pattern Plain 2 $ts_lin {
    #load 26 [expr $df/3.] 0. 0.
    #load 29 [expr $df/3.] 0. 0.
    #load 23 [expr $df/3.] 0. 0.
    load 17 [expr 2.*$df/3./3.] 0. 0. 0. 0. 0.
    load 20 [expr 2.*$df/3./3.] 0. 0. 0. 0. 0.
    load 14 [expr 2.*$df/3./3.] 0. 0. 0. 0. 0.
    load 8 [expr $df/3./3.] 0. 0. 0. 0. 0.
    load 11 [expr $df/3./3.] 0. 0. 0. 0. 0.
    load $pushnode [expr $df/3./3.] 0. 0. 0. 0. 0.
}
#set df [expr [lindex $dirf $zz]*100.]
constraints Transformation
numberer RCM
system BandGeneral
algorithm KrylovNewton
test NormDispIncr 1.0e-8 250
analysis Static
for {set zz 0} {$zz <= 16} {incr zz} {
puts "Cycle [expr $zz+1]"
set coef {1. 1. 2.5 2.5 5. 5. 5. 5. 10. 10. 10. 10. 15. 15.  18. 18. 30.}
set diru {1. -1. 1. -1. 1. -1. 1. -1. 1. -1. 1. -1. 1. -1. 1. -1. 1.}
#set dirf {1. 1. -1. -1. 1. 1. -1. -1. 1. 1. -1. -1. 1. 1. -1. -1. 1. 1. -1. -1. 1. 1. -1. -1. 1. 1. -1. -1. 1. 1. -1. -1. 1.}
set du [expr [lindex $diru $zz]*0.0001]
integrator DisplacementControl $pushnode 1 $du 100
if {$zz == 0} {
analyze [expr int([expr [lindex $coef $zz]*0.05*2.6/100./0.0001])]
} else {
    analyze [expr int([expr [lindex $coef $zz]*0.05*2.6/100./0.0001+[lindex $coef [expr $zz-1]]*0.05*2.6/100./0.0001])]
}
puts "Done"
puts " "
}
}

if {$Earthquake} {
set eqfile accel2.txt
set dt 0.001
set np 42320
timeSeries Path 5 -dt $dt -filePath $eqfile 
pattern UniformExcitation 3 1 -accel 5
test NormDispIncr 1.0e-8 250
constraints Transformation
numberer RCM
system BandGeneral
algorithm KrylovNewton
test NormDispIncr 1.0e-8 250
integrator Newmark 0.5 0.25
analysis Transient
analyze $np $dt
}

#
#
### Cyclic Test ##
#
#set np 14000
#set loadNode 5
#set dt 10.
#set dir 1
#set factor 0.001; #to convert from mm to m
#set gdisp "Path -filePath $inFile -dt $dt -factor $factor"
#pattern MultipleSupport 4 {
#groundMotion 4 Series -disp $gdisp
##imposedMotion nodeTag? dirn? gMotionTag?
#imposedSupportMotion $loadNode $dir 4
#}
#
#system BandGeneral
#constraints Transformation
##test NormDispIncr $tol 100 
#algorithm KrylovNewton
#numberer Plain
#set gamma 0.5
#set beta 0.25
#integrator Newmark $gamma $beta
#analysis Transient
#puts "np=$np, dt=$dt"
#analyze $np $dt
#       
