



set cortag1 $concmattag
set cortag2 [expr $concmattag+1]
set cortag3 [expr $concmattag+2]

set covtag1 ${concmattag}1
set covtag2 [expr $concmattag+1]1
set covtag3 [expr $concmattag+2]1

# XXXXXXXXXXXXXXXXXX SLIP FIBER XXXXXXXXXXXXXXXXXXXXXXX
#Outer Column
section Fiber 100 -GJ 1. {
    patch quad $cortag100 50 1 166. 91. -166. 91. -166. -91. 166. -91.
    patch quad $covtag100 50 1 166. -91. -166. -91. -166. -125. 166. -125.
    patch quad $covtag100 50 1 166. 125. -166. 125. -166. 91. 166. 91.
    patch quad $covtag100 5 1 200. 125. 166. 125. -166. -125. 200. -125.
    patch quad $covtag100 5 1 -166. 125. -200. 125. -200. -125. -166. -125.
    layer straight $st_bond 3 $A2 155. 80. 155. -80.
    layer straight $st_bond 2 $A2 0. 80. 0. -80.
    layer straight $st_bond 3 $A2 -155. 80. -155. -80.
}

#Inner Column
section Fiber 200 -GJ 1. {
    patch quad $cortag100 50 1 91. 166. -91. 166. -91. -166. 91. -166.
    patch quad $covtag100 50 1 91. -166. -91. -166. -91. -200. 91. -200.
    patch quad $covtag100 50 1 91. 200. -91. 200. -91. 166. 91. 166.
    patch quad $covtag100 5 1 125. 200. 91. 200. 91. -200. 125. -200.
    patch quad $covtag100 5 1 -91. 200. -125. 200. -125. -200. -91. -200.
    layer straight $st_bond 3 $A2 80. 155. 80. -155. 
    layer straight $st_bond 2 $A2 0. 155. 0. -155.
    layer straight $st_bond 3 $A2 -80. 155. -80. -155.
}


# XXXXXXXXXXXXXXXXX 1ST STOREY XXXXXXXXXXXXXXXXXXXXXXXXXX
set gj 100.
#Outer Column
section Fiber 1 -GJ $gj {
    patch quad $cortag1 50 1 166. 91. -166. 91. -166. -91. 166. -91.
    patch quad $covtag1 50 1 166. -91. -166. -91. -166. -125. 166. -125.
    patch quad $covtag1 50 1 166. 125. -166. 125. -166. 91. 166. 91.
    patch quad $covtag1 5 1 200. 125. 166. 125. -166. -125. 200. -125.
    patch quad $covtag1 5 1 -166. 125. -200. 125. -200. -125. -166. -125.
    layer straight $st_14_mm 3 $A2 155. 80. 155. -80.
    layer straight $st_14_mm 2 $A2 0. 80. 0. -80.
    layer straight $st_14_mm 3 $A2 -155. 80. -155. -80.
}

#Inner Column
section Fiber 2 -GJ $gj {
    patch quad $cortag1 50 1 91. 166. -91. 166. -91. -166. 91. -166.
    patch quad $covtag1 50 1 91. -166. -91. -166. -91. -200. 91. -200.
    patch quad $covtag1 50 1 91. 200. -91. 200. -91. 166. 91. 166.
    patch quad $covtag1 5 1 125. 200. 91. 200. 91. -200. 125. -200.
    patch quad $covtag1 5 1 -91. 200. -125. 200. -125. -200. -91. -200.
    layer straight $st_14_mm 3 $A2 80. 155. 80. -155. 
    layer straight $st_14_mm 2 $A2 0. 155. 0. -155.
    layer straight $st_14_mm 3 $A2 -80. 155. -80. -155.
}

#Support Beam 
section Fiber 3 -GJ $gj {
    patch quad $cortag1 50 1 218. 91. -218. 91. -218. -91. 218. -91.
    patch quad $covtag1 50 1 218. -91. -218. -91. -218. -125. 218. -125.
    patch quad $covtag1 50 1 218. 125. -218. 125. -218. 91. 218. 91.
    patch quad $covtag1 5 1 250. 425. 218. 425. -218. -425. 250. -425.
    patch quad $covtag1 5 1 -218. 125. -250. 125. -250. -125. -218. -125.
    patch quad $covtag1 25 1 218. -125. 0. -125. 0. -425. 218. -425.
    patch quad $covtag1 25 1 218. 425. 0. 425. 0. 125. 218. 125.
    layer straight $st_18_mm 4 $A1 205. 80. 205. -80.
    layer straight $st_18_mm 4 $A1 185. 80. 185. -80.
    layer straight $st_18_mm 4 $A1 -205. 80. -205. -80.
}

#Mid Beam 
section Fiber 4 -GJ $gj {
    patch quad $cortag1 50 1 218. 91. -218. 91. -218. -91. 218. -91.
    patch quad $covtag1 50 1 218. -91. -218. -91. -218. -125. 218. -125.
    patch quad $covtag1 50 1 218. 125. -218. 125. -218. 91. 218. 91.
    patch quad $covtag1 5 1 250. 425. 218. 425. -218. -425. 250. -425.
    patch quad $covtag1 5 1 -218. 125. -250. 125. -250. -125. -218. -125.
    patch quad $covtag1 25 1 218. -125. 0. -125. 0. -425. 218. -425.
    patch quad $covtag1 25 1 218. 425. 0. 425. 0. 125. 218. 125.
    layer straight $st_18_mm 3 $A1 205. 80. 205. -80.
    layer straight $st_18_mm 2 $A1 -205. 80. -205. -80.
}

# XXXXXXXXXXXXXXXXX 2ND STOREY XXXXXXXXXXXXXXXXXXXXXXXXXX

#Outer Column
section Fiber 5 -GJ $gj {
    patch quad $cortag2 50 1 166. 91. -166. 91. -166. -91. 166. -91.
    patch quad $covtag2 50 1 166. -91. -166. -91. -166. -125. 166. -125.
    patch quad $covtag2 50 1 166. 125. -166. 125. -166. 91. 166. 91.
    patch quad $covtag2 5 1 200. 125. 166. 125. -166. -125. 200. -125.
    patch quad $covtag2 5 1 -166. 125. -200. 125. -200. -125. -166. -125.
    layer straight $st_14_mm 3 $A2 155. 80. 155. -80.
    layer straight $st_14_mm 2 $A2 0. 80. 0. -80.
    layer straight $st_14_mm 3 $A2 -155. 80. -155. -80.
}

#Inner Column
section Fiber 6 -GJ $gj {
    patch quad $cortag2 50 1 91. 166. -91. 166. -91. -166. 91. -166.
    patch quad $covtag2 50 1 91. -166. -91. -166. -91. -200. 91. -200.
    patch quad $covtag2 50 1 91. 200. -91. 200. -91. 166. 91. 166.
    patch quad $covtag2 5 1 125. 200. 91. 200. 91. -200. 125. -200.
    patch quad $covtag2 5 1 -91. 200. -125. 200. -125. -200. -91. -200.
    layer straight $st_14_mm 3 $A2 80. 155. 80. -155. 
    layer straight $st_14_mm 2 $A2 0. 155. 0. -155.
    layer straight $st_14_mm 3 $A2 -80. 155. -80. -155.
}

#Support Beam 
section Fiber 7 -GJ $gj {
    patch quad $cortag2 50 1 218. 91. -218. 91. -218. -91. 218. -91.
    patch quad $covtag2 50 1 218. -91. -218. -91. -218. -125. 218. -125.
    patch quad $covtag2 50 1 218. 125. -218. 125. -218. 91. 218. 91.
    patch quad $covtag2 5 1 250. 125. 218. 125. -218. -125. 250. -125.
    patch quad $covtag2 5 1 -218. 125. -250. 125. -250. -125. -218. -125.
    patch quad $covtag2 25 1 218. -125. 0. -125. 0. -425. 218. -425.
    patch quad $covtag2 25 1 218. 425. 0. 425. 0. 125. 218. 125.
    layer straight $st_18_mm 4 $A1 205. 80. 205. -80.
    layer straight $st_18_mm 4 $A1 185. 80. 185. -80.
    layer straight $st_18_mm 4 $A1 -205. 80. -205. -80.
}

#Mid Beam 
section Fiber 8 -GJ $gj {
    patch quad $cortag2 50 1 218. 91. -218. 91. -218. -91. 218. -91.
    patch quad $covtag2 50 1 218. -91. -218. -91. -218. -125. 218. -125.
    patch quad $covtag2 50 1 218. 125. -218. 125. -218. 91. 218. 91.
    patch quad $covtag2 5 1 250. 125. 218. 125. -218. -125. 250. -125.
    patch quad $covtag2 5 1 -218. 125. -250. 125. -250. -125. -218. -125.
    patch quad $covtag2 25 1 218. -125. 0. -125. 0. -425. 218. -425.
    patch quad $covtag2 25 1 218. 425. 0. 425. 0. 125. 218. 125.
    layer straight $st_18_mm 3 $A1 205. 80. 205. -80.
    layer straight $st_18_mm 2 $A1 -205. 80. -205. -80.
}

# XXXXXXXXXXXXXXXXX 3RD STOREY XXXXXXXXXXXXXXXXXXXXXXXXXX

#Outer Column
section Fiber 9 -GJ $gj {
    patch quad $cortag3 50 1 166. 91. -166. 91. -166. -91. 166. -91.
    patch quad $covtag3 50 1 166. -91. -166. -91. -166. -125. 166. -125.
    patch quad $covtag3 50 1 166. 125. -166. 125. -166. 91. 166. 91.
    patch quad $covtag3 5 1 200. 125. 166. 125. -166. -125. 200. -125.
    patch quad $covtag3 5 1 -166. 125. -200. 125. -200. -125. -166. -125.
    layer straight $st_14_mm 3 $A2 155. 80. 155. -80.
    layer straight $st_14_mm 2 $A2 0. 80. 0. -80.
    layer straight $st_14_mm 3 $A2 -155. 80. -155. -80.
}

#Inner Column
section Fiber 10 -GJ $gj {
    patch quad $cortag3 50 1 91. 166. -91. 166. -91. -166. 91. -166.
    patch quad $covtag3 50 1 91. -166. -91. -166. -91. -200. 91. -200.
    patch quad $covtag3 50 1 91. 200. -91. 200. -91. 166. 91. 166.
    patch quad $covtag3 5 1 125. 200. 91. 200. 91. -200. 125. -200.
    patch quad $covtag3 5 1 -91. 200. -125. 200. -125. -200. -91. -200.
    layer straight $st_14_mm 3 $A2 80. 155. 80. -155. 
    layer straight $st_14_mm 2 $A2 0. 155. 0. -155.
    layer straight $st_14_mm 3 $A2 -80. 155. -80. -155.
}

#Support Beam 
section Fiber 11 -GJ $gj {
    patch quad $cortag3 50 1 218. 91. -218. 91. -218. -91. 218. -91.
    patch quad $covtag3 50 1 218. -91. -218. -91. -218. -125. 218. -125.
    patch quad $covtag3 50 1 218. 125. -218. 125. -218. 91. 218. 91.
    patch quad $covtag3 5 1 250. 125. 218. 125. -218. -125. 250. -125.
    patch quad $covtag3 5 1 -218. 125. -250. 125. -250. -125. -218. -125.
    patch quad $covtag3 25 1 218. -125. 0. -125. 0. -425. 218. -425.
    patch quad $covtag3 25 1 218. 425. 0. 425. 0. 125. 218. 125.
    layer straight $st_18_mm 4 $A1 205. 80. 205. -80.
    layer straight $st_18_mm 4 $A1 185. 80. 185. -80.
    layer straight $st_18_mm 4 $A1 -205. 80. -205. -80.
}

#Mid Beam 
section Fiber 12 -GJ $gj {
    patch quad $cortag3 50 1 218. 91. -218. 91. -218. -91. 218. -91.
    patch quad $covtag3 50 1 218. -91. -218. -91. -218. -125. 218. -125.
    patch quad $covtag3 50 1 218. 125. -218. 125. -218. 91. 218. 91.
    patch quad $covtag3 5 1 250. 125. 218. 125. -218. -125. 250. -125.
    patch quad $covtag3 5 1 -218. 125. -250. 125. -250. -125. -218. -125.
    patch quad $covtag3 25 1 218. -125. 0. -125. 0. -425. 218. -425.
    patch quad $covtag3 25 1 218. 425. 0. 425. 0. 125. 218. 125.
    layer straight $st_18_mm 3 $A1 205. 80. 205. -80.
    layer straight $st_18_mm 2 $A1 -205. 80. -205. -80.
}

