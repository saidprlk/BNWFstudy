recorder Node -file $outpath/nodes.disp -time -node 5 8 11 14 17 20 23 26 29 -dof 1 2 6 disp
recorder Element -file $outpath/fircols.force -time -ele 1 2 3 globalForce
if {$BNWF} {
    recorder Node -file $outpath/node1.disp -time -node $midnode_1 -dof 1 2 6 disp 
    recorder Node -file $outpath/node2.disp -time -node $midnode_2 -dof 1 2 6 disp 
    recorder Node -file $outpath/node3.disp -time -node $midnode_3 -dof 1 2 6 disp 
    recorder Node -file $outpath/base1.reac -time -node [expr $endSprEleR_1+1] [expr $endSprEleR_1+2] -dof 1 reaction
    recorder Node -file $outpath/base2.reac -time -node [expr $endSprEleR_2+1] [expr $endSprEleR_2+2] -dof 1 reaction
    recorder Node -file $outpath/base3.reac -time -node [expr $endSprEleR_3+1] [expr $endSprEleR_3+2] -dof 1 reaction
    recorder Element -file $outpath/endSprEleR_1.force -time -ele $endSprEleR_1 force 
    recorder Element -file $outpath/endSprEleR_2.force -time -ele $endSprEleR_2 force
    recorder Element -file $outpath/endSprEleR_3.force -time -ele $endSprEleR_3 force
    recorder Node -file $outpath/endnode.disp -time -node 1071 2071 3071 -dof 2 disp
    recorder Element -file $outpath/Pspring.force -time -ele 100072 200072 300072 force 
    recorder Element -file $outpath/Tspring.force -time -ele 100073 200073 300073 force 
    } else {
        if {$slip} {
        recorder Node -file $outpath/node1.disp -time -node 1 -dof 2 6 disp
        recorder Node -file $outpath/node2.disp -time -node 2 -dof 2 6 disp 
        recorder Node -file $outpath/node3.disp -time -node 3 -dof 2 6 disp 
        recorder Node -file $outpath/node1.reac -time -node 1 -dof 1 reaction
        recorder Node -file $outpath/node2.reac -time -node 2 -dof 1 reaction 
        recorder Node -file $outpath/node3.reac -time -node 3 -dof 1 reaction
        recorder Node -file $outpath/node100.reac -time -node 1 -dof 2 6 reaction
        recorder Node -file $outpath/node200.reac -time -node 2 -dof 2 6 reaction 
        recorder Node -file $outpath/node300.reac -time -node 3 -dof 2 6 reaction
        } else {
            recorder Node -file $outpath/node1.reac -time -node 1 -dof 1 2 6 reaction
            recorder Node -file $outpath/node2.reac -time -node 2 -dof 1 2 6 reaction 
            recorder Node -file $outpath/node3.reac -time -node 3 -dof 1 2 6 reaction
        }
    }
    
recorder Node -file $outpath/mode.mod -node 5 14 23 -dof 1 eigen 
#recorder Element -file $outpath/firstzerocc1.out -time -ele 100 -section fiber 166. 0. $cortag1 stressStrain
#recorder Element -file $outpath/firstzerocc2.out -time -ele 100 -section fiber -166. 0. $cortag1 stressStrain
#recorder Element -file $outpath/firstzerouc1.out -time -ele 100 -section fiber 200. 0. $covtag1 stressStrain
#recorder Element -file $outpath/firstzerouc2.out -time -ele 100 -section fiber -200. 0. $covtag1 stressStrain
#recorder Element -file $outpath/firstzerost1.out -time -ele 100 -section fiber 155. 0. 22 stressStrain
#recorder Element -file $outpath/firstzerost2.out -time -ele 100 -section fiber -155. 0. 22 stressStrain
#
#recorder Element -file $outpath/secondzerocc1.out -time -ele 200 -section fiber 91. 0. $cortag1 stressStrain
#recorder Element -file $outpath/secondzerocc2.out -time -ele 200 -section fiber -91. 0. $cortag1 stressStrain
#recorder Element -file $outpath/secondzerouc1.out -time -ele 200 -section fiber 125. 0. $covtag1 stressStrain
#recorder Element -file $outpath/secondzerouc2.out -time -ele 200 -section fiber -125. 0. $covtag1 stressStrain
#recorder Element -file $outpath/secondzerost1.out -time -ele 200 -section fiber 80. 0. 22 stressStrain
#recorder Element -file $outpath/secondzerost2.out -time -ele 200 -section fiber -80. 0. 22 stressStrain
#
#recorder Element -file $outpath/thirdzerocc1.out -time -ele 300 -section fiber 166. 0. $cortag1 stressStrain
#recorder Element -file $outpath/thirdzerocc2.out -time -ele 300 -section fiber -166. 0. $cortag1 stressStrain
#recorder Element -file $outpath/thirdzerouc1.out -time -ele 300 -section fiber 200. 0. $covtag1 stressStrain
#recorder Element -file $outpath/thirdzerouc2.out -time -ele 300 -section fiber -200. 0. $covtag1 stressStrain
#recorder Element -file $outpath/thirdzerost1.out -time -ele 300 -section fiber 155. 0. 22 stressStrain
#recorder Element -file $outpath/thirdzerost2.out -time -ele 300 -section fiber -155. 0. 22 stressStrain
if {$stressstrain} {    
# XXXXXXXXXXXXXXX_ ELEMENT STRESS STRAIN RECORDERS
for {set ii 4} {$ii <= 11} {incr ii} {
recorder Element -file $outpath/firstbeams_end_up_cc_$ii.out -time -ele $ii -section 5 fiber 218. 0. $cortag1 stressStrain
recorder Element -file $outpath/firstbeams_end_bot_cc_$ii.out -time -ele $ii -section 5 fiber -218. 0. $cortag1 stressStrain
recorder Element -file $outpath/firstbeams_mid_up_cc_$ii.out -time -ele $ii -section 3 fiber 218. 0. $cortag1 stressStrain
recorder Element -file $outpath/firstbeams_mid_bot_cc_$ii.out -time -ele $ii -section 3 fiber -218. 0. $cortag1 stressStrain
recorder Element -file $outpath/firstbeams_st_up_cc_$ii.out -time -ele $ii -section 1 fiber 218. 0. $cortag1 stressStrain
recorder Element -file $outpath/firstbeams_st_bot_cc_$ii.out -time -ele $ii -section 1 fiber -218. 0. $cortag1 stressStrain
recorder Element -file $outpath/firstbeams_end_up_uc_$ii.out -time -ele $ii -section 5 fiber 250. 0. $covtag1 stressStrain
recorder Element -file $outpath/firstbeams_end_bot_uc_$ii.out -time -ele $ii -section 5 fiber -250. 0. $covtag1 stressStrain
recorder Element -file $outpath/firstbeams_mid_up_uc_$ii.out -time -ele $ii -section 3 fiber 250. 0. $covtag1 stressStrain
recorder Element -file $outpath/firstbeams_mid_bot_uc_$ii.out -time -ele $ii -section 3 fiber -250. 0. $covtag1 stressStrain
recorder Element -file $outpath/firstbeams_st_up_uc_$ii.out -time -ele $ii -section 1 fiber 250. 0. $covtag1 stressStrain
recorder Element -file $outpath/firstbeams_st_bot_uc_$ii.out -time -ele $ii -section 1 fiber -250. 0. $covtag1 stressStrain
recorder Element -file $outpath/firstbeams_end_up_st18_$ii.out -time -ele $ii -section 5 fiber 205. 0. $st_18_mm stressStrain
recorder Element -file $outpath/firstbeams_end_bot_st18_$ii.out -time -ele $ii -section 5 fiber -205. 0. $st_18_mm stressStrain
recorder Element -file $outpath/firstbeams_mid_up_st18_$ii.out -time -ele $ii -section 3 fiber 205. 0. $st_18_mm stressStrain
recorder Element -file $outpath/firstbeams_mid_bot_st18_$ii.out -time -ele $ii -section 3 fiber -205. 0. $st_18_mm stressStrain
recorder Element -file $outpath/firstbeams_st_up_st18_$ii.out -time -ele $ii -section 1 fiber 205. 0. $st_18_mm stressStrain
recorder Element -file $outpath/firstbeams_st_bot_st18_$ii.out -time -ele $ii -section 1 fiber -205. 0. $st_18_mm stressStrain
#recorder Element -file $outpath/firstbeams_force_st_$ii.out -time -ele $elerange1 localForce
#recorder Element -file $outpath/firstbeams_force_mid_$ii.out -time -ele $elerange1 -section 3 force
#recorder Element -file $outpath/firstbeams_force_end_$ii.out -time -ele $elerange1 -section 5 force
}
recorder Element -file $outpath/firstoutcol_end_up_cc.out -time -ele 1 3 -section 5 fiber 166. 0. $cortag1 stressStrain
recorder Element -file $outpath/firstoutcol_end_bot_cc.out -time -ele 1 3 -section 5 fiber -166. 0. $cortag1 stressStrain
recorder Element -file $outpath/firstoutcol_mid_up_cc.out -time -ele 1 3 -section 3 fiber 166. 0. $cortag1 stressStrain
recorder Element -file $outpath/firstoutcol_mid_bot_cc.out -time -ele 1 3 -section 3 fiber -166. 0. $cortag1 stressStrain
recorder Element -file $outpath/firstoutcol_st_up_cc.out -time -ele 1 3 -section 1 fiber 166. 0. $cortag1 stressStrain
recorder Element -file $outpath/firstoutcol_st_bot_cc.out -time -ele 1 3 -section 1 fiber -166. 0. $cortag1 stressStrain
recorder Element -file $outpath/firstoutcol_end_up_uc.out -time -ele 1 3 -section 5 fiber 200. 0. $covtag1 stressStrain
recorder Element -file $outpath/firstoutcol_end_bot_uc.out -time -ele 1 3 -section 5 fiber -200. 0. $covtag1 stressStrain
recorder Element -file $outpath/firstoutcol_mid_up_uc.out -time -ele 1 3 -section 3 fiber 200. 0. $covtag1 stressStrain
recorder Element -file $outpath/firstoutcol_mid_bot_uc.out -time -ele 1 3 -section 3 fiber -200. 0. $covtag1 stressStrain
recorder Element -file $outpath/firstoutcol_st_up_uc.out -time -ele 1 3 -section 1 fiber 200. 0. $covtag1 stressStrain
recorder Element -file $outpath/firstoutcol_st_bot_uc.out -time -ele 1 3 -section 1 fiber -200. 0. $covtag1 stressStrain
recorder Element -file $outpath/firstoutcol_end_up_st18.out -time -ele 1 3 -section 5 fiber 155. 0. $st_14_mm stressStrain
recorder Element -file $outpath/firstoutcol_end_bot_st18.out -time -ele 1 3 -section 5 fiber -155. 0. $st_14_mm stressStrain
recorder Element -file $outpath/firstoutcol_mid_up_st18.out -time -ele 1 3 -section 3 fiber 155. 0. $st_14_mm stressStrain
recorder Element -file $outpath/firstoutcol_mid_bot_st18.out -time -ele 1 3 -section 3 fiber -155. 0. $st_14_mm stressStrain
recorder Element -file $outpath/firstoutcol_st_up_st18.out -time -ele 1 3 -section 1 fiber 155. 0. $st_14_mm stressStrain
recorder Element -file $outpath/firstoutcol_st_bot_st18.out -time -ele 1 3 -section 1 fiber -155. 0. $st_14_mm stressStrain

recorder Element -file $outpath/firstmidcol_end_up_cc.out -time -ele 2 -section 5 fiber 91. 0. $cortag1 stressStrain
recorder Element -file $outpath/firstmidcol_end_bot_cc.out -time -ele 2 -section 5 fiber -91. 0. $cortag1 stressStrain
recorder Element -file $outpath/firstmidcol_mid_up_cc.out -time -ele 2 -section 3 fiber 91. 0. $cortag1 stressStrain
recorder Element -file $outpath/firstmidcol_mid_bot_cc.out -time -ele 2 -section 3 fiber -91. 0. $cortag1 stressStrain
recorder Element -file $outpath/firstmidcol_st_up_cc.out -time -ele 2 -section 1 fiber 91. 0. $cortag1 stressStrain
recorder Element -file $outpath/firstmidcol_st_bot_cc.out -time -ele 2 -section 1 fiber -91. 0. $cortag1 stressStrain
recorder Element -file $outpath/firstmidcol_end_up_uc.out -time -ele 2 -section 5 fiber 125. 0. $covtag1 stressStrain
recorder Element -file $outpath/firstmidcol_end_bot_uc.out -time -ele 2 -section 5 fiber -125. 0. $covtag1 stressStrain
recorder Element -file $outpath/firstmidcol_mid_up_uc.out -time -ele 2 -section 3 fiber 125. 0. $covtag1 stressStrain
recorder Element -file $outpath/firstmidcol_mid_bot_uc.out -time -ele 2 -section 3 fiber -125. 0. $covtag1 stressStrain
recorder Element -file $outpath/firstmidcol_st_up_uc.out -time -ele 2 -section 1 fiber 125. 0. $covtag1 stressStrain
recorder Element -file $outpath/firstmidcol_st_bot_uc.out -time -ele 2 -section 1 fiber -125. 0. $covtag1 stressStrain
recorder Element -file $outpath/firstmidcol_end_up_st18.out -time -ele 2 -section 5 fiber 80. 0. $st_14_mm stressStrain
recorder Element -file $outpath/firstmidcol_end_bot_st18.out -time -ele 2 -section 5 fiber -80. 0. $st_14_mm stressStrain
recorder Element -file $outpath/firstmidcol_mid_up_st18.out -time -ele 2 -section 3 fiber 80. 0. $st_14_mm stressStrain
recorder Element -file $outpath/firstmidcol_mid_bot_st18.out -time -ele 2 -section 3 fiber -80. 0. $st_14_mm stressStrain
recorder Element -file $outpath/firstmidcol_st_up_st18.out -time -ele 2 -section 1 fiber 80. 0. $st_14_mm stressStrain
recorder Element -file $outpath/firstmidcol_st_bot_st18.out -time -ele 2 -section 1 fiber -80. 0. $st_14_mm stressStrain


for {set ii 15} {$ii <= 22} {incr ii} {
recorder Element -file $outpath/secondbeams_end_up_cc_$ii.out -time -ele $ii -section 5 fiber 218. 0. $cortag2 stressStrain
recorder Element -file $outpath/secondbeams_end_bot_cc_$ii.out -time -ele $ii -section 5 fiber -218. 0. $cortag2 stressStrain
recorder Element -file $outpath/secondbeams_mid_up_cc_$ii.out -time -ele $ii -section 3 fiber 218. 0. $cortag2 stressStrain
recorder Element -file $outpath/secondbeams_mid_bot_cc_$ii.out -time -ele $ii -section 3 fiber -218. 0. $cortag2 stressStrain
recorder Element -file $outpath/secondbeams_st_up_cc_$ii.out -time -ele $ii -section 1 fiber 218. 0. $cortag2 stressStrain
recorder Element -file $outpath/secondbeams_st_bot_cc_$ii.out -time -ele $ii -section 1 fiber -218. 0. $cortag2 stressStrain
recorder Element -file $outpath/secondbeams_end_up_uc_$ii.out -time -ele $ii -section 5 fiber 250. 0. $covtag2 stressStrain
recorder Element -file $outpath/secondbeams_end_bot_uc_$ii.out -time -ele $ii -section 5 fiber -250. 0. $covtag2 stressStrain
recorder Element -file $outpath/secondbeams_mid_up_uc_$ii.out -time -ele $ii -section 3 fiber 250. 0. $covtag2 stressStrain
recorder Element -file $outpath/secondbeams_mid_bot_uc_$ii.out -time -ele $ii -section 3 fiber -250. 0. $covtag2 stressStrain
recorder Element -file $outpath/secondbeams_st_up_uc_$ii.out -time -ele $ii -section 1 fiber 250. 0. $covtag2 stressStrain
recorder Element -file $outpath/secondbeams_st_bot_uc_$ii.out -time -ele $ii -section 1 fiber -250. 0. $covtag2 stressStrain
recorder Element -file $outpath/secondbeams_end_up_st18_$ii.out -time -ele $ii -section 5 fiber 205. 0. $st_18_mm stressStrain
recorder Element -file $outpath/secondbeams_end_bot_st18_$ii.out -time -ele $ii -section 5 fiber -205. 0. $st_18_mm stressStrain
recorder Element -file $outpath/secondbeams_mid_up_st18_$ii.out -time -ele $ii -section 3 fiber 205. 0. $st_18_mm stressStrain
recorder Element -file $outpath/secondbeams_mid_bot_st18_$ii.out -time -ele $ii -section 3 fiber -205. 0. $st_18_mm stressStrain
recorder Element -file $outpath/secondbeams_st_up_st18_$ii.out -time -ele $ii -section 1 fiber 205. 0. $st_18_mm stressStrain
recorder Element -file $outpath/secondbeams_st_bot_st18_$ii.out -time -ele $ii -section 1 fiber -205. 0. $st_18_mm stressStrain
}
recorder Element -file $outpath/secondoutcol_end_up_cc.out -time -ele 12 14 -section 5 fiber 166. 0. $cortag2 stressStrain
recorder Element -file $outpath/secondoutcol_end_bot_cc.out -time -ele 12 14 -section 5 fiber -166. 0. $cortag2 stressStrain
recorder Element -file $outpath/secondoutcol_mid_up_cc.out -time -ele 12 14 -section 3 fiber 166. 0. $cortag2 stressStrain
recorder Element -file $outpath/secondoutcol_mid_bot_cc.out -time -ele 12 14 -section 3 fiber -166. 0. $cortag2 stressStrain
recorder Element -file $outpath/secondoutcol_st_up_cc.out -time -ele 12 14 -section 1 fiber 166. 0. $cortag2 stressStrain
recorder Element -file $outpath/secondoutcol_st_bot_cc.out -time -ele 12 14 -section 1 fiber -166. 0. $cortag2 stressStrain
recorder Element -file $outpath/secondoutcol_end_up_uc.out -time -ele 12 14 -section 5 fiber 200. 0. $covtag2 stressStrain
recorder Element -file $outpath/secondoutcol_end_bot_uc.out -time -ele 12 14 -section 5 fiber -200. 0. $covtag2 stressStrain
recorder Element -file $outpath/secondoutcol_mid_up_uc.out -time -ele 12 14 -section 3 fiber 200. 0. $covtag2 stressStrain
recorder Element -file $outpath/secondoutcol_mid_bot_uc.out -time -ele 12 14 -section 3 fiber -200. 0. $covtag2 stressStrain
recorder Element -file $outpath/secondoutcol_st_up_uc.out -time -ele 12 14 -section 1 fiber 200. 0. $covtag2 stressStrain
recorder Element -file $outpath/secondoutcol_st_bot_uc.out -time -ele 12 14 -section 1 fiber -200. 0. $covtag2 stressStrain
recorder Element -file $outpath/secondoutcol_end_up_st18.out -time -ele 12 14 -section 5 fiber 155. 0. $st_14_mm stressStrain
recorder Element -file $outpath/secondoutcol_end_bot_st18.out -time -ele 12 14 -section 5 fiber -155. 0. $st_14_mm stressStrain
recorder Element -file $outpath/secondoutcol_mid_up_st18.out -time -ele 12 14 -section 3 fiber 155. 0. $st_14_mm stressStrain
recorder Element -file $outpath/secondoutcol_mid_bot_st18.out -time -ele 12 14 -section 3 fiber -155. 0. $st_14_mm stressStrain
recorder Element -file $outpath/secondoutcol_st_up_st18.out -time -ele 12 14 -section 1 fiber 155. 0. $st_14_mm stressStrain
recorder Element -file $outpath/secondoutcol_st_bot_st18.out -time -ele 12 14 -section 1 fiber -155. 0. $st_14_mm stressStrain

recorder Element -file $outpath/secondmidcol_end_up_cc.out -time -ele 13 -section 5 fiber 91. 0. $cortag2 stressStrain
recorder Element -file $outpath/secondmidcol_end_bot_cc.out -time -ele 13 -section 5 fiber -91. 0. $cortag2 stressStrain
recorder Element -file $outpath/secondmidcol_mid_up_cc.out -time -ele 13 -section 3 fiber 91. 0. $cortag2 stressStrain
recorder Element -file $outpath/secondmidcol_mid_bot_cc.out -time -ele 13 -section 3 fiber -91. 0. $cortag2 stressStrain
recorder Element -file $outpath/secondmidcol_st_up_cc.out -time -ele 13 -section 1 fiber 91. 0. $cortag2 stressStrain
recorder Element -file $outpath/secondmidcol_st_bot_cc.out -time -ele 13 -section 1 fiber -91. 0. $cortag2 stressStrain
recorder Element -file $outpath/secondmidcol_end_up_uc.out -time -ele 13 -section 5 fiber 125. 0. $covtag2 stressStrain
recorder Element -file $outpath/secondmidcol_end_bot_uc.out -time -ele 13 -section 5 fiber -125. 0. $covtag2 stressStrain
recorder Element -file $outpath/secondmidcol_mid_up_uc.out -time -ele 13 -section 3 fiber 125. 0. $covtag2 stressStrain
recorder Element -file $outpath/secondmidcol_mid_bot_uc.out -time -ele 13 -section 3 fiber -125. 0. $covtag2 stressStrain
recorder Element -file $outpath/secondmidcol_st_up_uc.out -time -ele 13 -section 1 fiber 125. 0. $covtag2 stressStrain
recorder Element -file $outpath/secondmidcol_st_bot_uc.out -time -ele 13 -section 1 fiber -125. 0. $covtag2 stressStrain
recorder Element -file $outpath/secondmidcol_end_up_st18.out -time -ele 13 -section 5 fiber 80. 0. $st_14_mm stressStrain
recorder Element -file $outpath/secondmidcol_end_bot_st18.out -time -ele 13 -section 5 fiber -80. 0. $st_14_mm stressStrain
recorder Element -file $outpath/secondmidcol_mid_up_st18.out -time -ele 13 -section 3 fiber 80. 0. $st_14_mm stressStrain
recorder Element -file $outpath/secondmidcol_mid_bot_st18.out -time -ele 13 -section 3 fiber -80. 0. $st_14_mm stressStrain
recorder Element -file $outpath/secondmidcol_st_up_st18.out -time -ele 13 -section 1 fiber 80. 0. $st_14_mm stressStrain
recorder Element -file $outpath/secondmidcol_st_bot_st18.out -time -ele 13 -section 1 fiber -80. 0. $st_14_mm stressStrain


for {set ii 26} {$ii <= 33} {incr ii} {
recorder Element -file $outpath/thirdbeams_end_up_cc_$ii.out -time -ele $ii -section 5 fiber 218. 0. $cortag3 stressStrain
recorder Element -file $outpath/thirdbeams_end_bot_cc_$ii.out -time -ele $ii -section 5 fiber -218. 0. $cortag3 stressStrain
recorder Element -file $outpath/thirdbeams_mid_up_cc_$ii.out -time -ele $ii -section 3 fiber 218. 0. $cortag3 stressStrain
recorder Element -file $outpath/thirdbeams_mid_bot_cc_$ii.out -time -ele $ii -section 3 fiber -218. 0. $cortag3 stressStrain
recorder Element -file $outpath/thirdbeams_st_up_cc_$ii.out -time -ele $ii -section 1 fiber 218. 0. $cortag3 stressStrain
recorder Element -file $outpath/thirdbeams_st_bot_cc_$ii.out -time -ele $ii -section 1 fiber -218. 0. $cortag3 stressStrain
recorder Element -file $outpath/thirdbeams_end_up_uc_$ii.out -time -ele $ii -section 5 fiber 250. 0. $covtag3 stressStrain
recorder Element -file $outpath/thirdbeams_end_bot_uc_$ii.out -time -ele $ii -section 5 fiber -250. 0. $covtag3 stressStrain
recorder Element -file $outpath/thirdbeams_mid_up_uc_$ii.out -time -ele $ii -section 3 fiber 250. 0. $covtag3 stressStrain
recorder Element -file $outpath/thirdbeams_mid_bot_uc_$ii.out -time -ele $ii -section 3 fiber -250. 0. $covtag3 stressStrain
recorder Element -file $outpath/thirdbeams_st_up_uc_$ii.out -time -ele $ii -section 1 fiber 250. 0. $covtag3 stressStrain
recorder Element -file $outpath/thirdbeams_st_bot_uc_$ii.out -time -ele $ii -section 1 fiber -250. 0. $covtag3 stressStrain
recorder Element -file $outpath/thirdbeams_end_up_st18_$ii.out -time -ele $ii -section 5 fiber 205. 0. $st_18_mm stressStrain
recorder Element -file $outpath/thirdbeams_end_bot_st18_$ii.out -time -ele $ii -section 5 fiber -205. 0. $st_18_mm stressStrain
recorder Element -file $outpath/thirdbeams_mid_up_st18_$ii.out -time -ele $ii -section 3 fiber 205. 0. $st_18_mm stressStrain
recorder Element -file $outpath/thirdbeams_mid_bot_st18_$ii.out -time -ele $ii -section 3 fiber -205. 0. $st_18_mm stressStrain
recorder Element -file $outpath/thirdbeams_st_up_st18_$ii.out -time -ele $ii -section 1 fiber 205. 0. $st_18_mm stressStrain
recorder Element -file $outpath/thirdbeams_st_bot_st18_$ii.out -time -ele $ii -section 1 fiber -205. 0. $st_18_mm stressStrain
}
recorder Element -file $outpath/thirdoutcol_end_up_cc.out -time -ele 23 25 -section 5 fiber 166. 0. $cortag3 stressStrain
recorder Element -file $outpath/thirdoutcol_end_bot_cc.out -time -ele 23 25 -section 5 fiber -166. 0. $cortag3 stressStrain
recorder Element -file $outpath/thirdoutcol_mid_up_cc.out -time -ele 23 25 -section 3 fiber 166. 0. $cortag3 stressStrain
recorder Element -file $outpath/thirdoutcol_mid_bot_cc.out -time -ele 23 25 -section 3 fiber -166. 0. $cortag3 stressStrain
recorder Element -file $outpath/thirdoutcol_st_up_cc.out -time -ele 23 25 -section 1 fiber 166. 0. $cortag3 stressStrain
recorder Element -file $outpath/thirdoutcol_st_bot_cc.out -time -ele 23 25 -section 1 fiber -166. 0. $cortag3 stressStrain
recorder Element -file $outpath/thirdoutcol_end_up_uc.out -time -ele 23 25 -section 5 fiber 200. 0. $covtag3 stressStrain
recorder Element -file $outpath/thirdoutcol_end_bot_uc.out -time -ele 23 25 -section 5 fiber -200. 0. $covtag3 stressStrain
recorder Element -file $outpath/thirdoutcol_mid_up_uc.out -time -ele 23 25 -section 3 fiber 200. 0. $covtag3 stressStrain
recorder Element -file $outpath/thirdoutcol_mid_bot_uc.out -time -ele 23 25 -section 3 fiber -200. 0. $covtag3 stressStrain
recorder Element -file $outpath/thirdoutcol_st_up_uc.out -time -ele 23 25 -section 1 fiber 200. 0. $covtag3 stressStrain
recorder Element -file $outpath/thirdoutcol_st_bot_uc.out -time -ele 23 25 -section 1 fiber -200. 0. $covtag3 stressStrain
recorder Element -file $outpath/thirdoutcol_end_up_st18.out -time -ele 23 25 -section 5 fiber 155. 0. $st_14_mm stressStrain
recorder Element -file $outpath/thirdoutcol_end_bot_st18.out -time -ele 23 25 -section 5 fiber -155. 0. $st_14_mm stressStrain
recorder Element -file $outpath/thirdoutcol_mid_up_st18.out -time -ele 23 25 -section 3 fiber 155. 0. $st_14_mm stressStrain
recorder Element -file $outpath/thirdoutcol_mid_bot_st18.out -time -ele 23 25 -section 3 fiber -155. 0. $st_14_mm stressStrain
recorder Element -file $outpath/thirdoutcol_st_up_st18.out -time -ele 23 25 -section 1 fiber 155. 0. $st_14_mm stressStrain
recorder Element -file $outpath/thirdoutcol_st_bot_st18.out -time -ele 23 25 -section 1 fiber -155. 0. $st_14_mm stressStrain

recorder Element -file $outpath/thirdmidcol_end_up_cc.out -time -ele 24 -section 5 fiber 91. 0. $cortag3 stressStrain
recorder Element -file $outpath/thirdmidcol_end_bot_cc.out -time -ele 24 -section 5 fiber -91. 0. $cortag3 stressStrain
recorder Element -file $outpath/thirdmidcol_mid_up_cc.out -time -ele 24 -section 3 fiber 91. 0. $cortag3 stressStrain
recorder Element -file $outpath/thirdmidcol_mid_bot_cc.out -time -ele 24 -section 3 fiber -91. 0. $cortag3 stressStrain
recorder Element -file $outpath/thirdmidcol_st_up_cc.out -time -ele 24 -section 1 fiber 91. 0. $cortag3 stressStrain
recorder Element -file $outpath/thirdmidcol_st_bot_cc.out -time -ele 24 -section 1 fiber -91. 0. $cortag3 stressStrain
recorder Element -file $outpath/thirdmidcol_end_up_uc.out -time -ele 24 -section 5 fiber 125. 0. $covtag3 stressStrain
recorder Element -file $outpath/thirdmidcol_end_bot_uc.out -time -ele 24 -section 5 fiber -125. 0. $covtag3 stressStrain
recorder Element -file $outpath/thirdmidcol_mid_up_uc.out -time -ele 24 -section 3 fiber 125. 0. $covtag3 stressStrain
recorder Element -file $outpath/thirdmidcol_mid_bot_uc.out -time -ele 24 -section 3 fiber -125. 0. $covtag3 stressStrain
recorder Element -file $outpath/thirdmidcol_st_up_uc.out -time -ele 24 -section 1 fiber 125. 0. $covtag3 stressStrain
recorder Element -file $outpath/thirdmidcol_st_bot_uc.out -time -ele 24 -section 1 fiber -125. 0. $covtag3 stressStrain
recorder Element -file $outpath/thirdmidcol_end_up_st18.out -time -ele 24 -section 5 fiber 80. 0. $st_14_mm stressStrain
recorder Element -file $outpath/thirdmidcol_end_bot_st18.out -time -ele 24 -section 5 fiber -80. 0. $st_14_mm stressStrain
recorder Element -file $outpath/thirdmidcol_mid_up_st18.out -time -ele 24 -section 3 fiber 80. 0. $st_14_mm stressStrain
recorder Element -file $outpath/thirdmidcol_mid_bot_st18.out -time -ele 24 -section 3 fiber -80. 0. $st_14_mm stressStrain
recorder Element -file $outpath/thirdmidcol_st_up_st18.out -time -ele 24 -section 1 fiber 80. 0. $st_14_mm stressStrain
recorder Element -file $outpath/thirdmidcol_st_bot_st18.out -time -ele 24 -section 1 fiber -80. 0. $st_14_mm stressStrain
}

# XXXXXXXXXXXXXXXXXXX_XXXXXXXXXXXXXX   NODE RECORDERS XXXXXXXXXXXXXXXXXXXXXXXXXXXX


