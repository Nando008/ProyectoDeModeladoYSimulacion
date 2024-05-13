globals [bandera banderaDos contadorDos tempo taim t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 tiempoCont]

to setup

  ;Inicio del fuergo y el material

  ask patches with [ (pxcor >= 0 and pxcor <= 1 and pycor <= 31 and pycor >= 19) ][set pcolor gray]

  let a 2;
  let b 30;

  repeat 12 [

    if b <= 30 and b >= 29 or b <= 21 and b >= 20[
      ask patch a b [set pcolor red]
    ]
    if b <= 28 and b >= 22[
      ask patch a b [set pcolor orange]
    ]
    if b <= 26 and b >= 24 [
      ask patch a b [set pcolor yellow]
    ]
    set b b - 1;
  ]

   set a 3;
   set b 29;

  repeat 9[

    if b <= 29 and b >= 28 or b <= 22 and b >= 21[
      ask patch a b [set pcolor red]
    ]
    if b <= 27 and b >= 23 [
      ask patch a b [set pcolor orange]
    ]
    if b = 25 [
      ask patch a b [set pcolor yellow]
    ]
    set b b - 1;

  ]

  set a 4;
  set b 28;

  repeat 7 [
    if b <= 28 and b >= 27 or b <= 23 and b >= 22[
      ask patch a b [set pcolor red]
    ]

    if b <= 26 and b >= 24 [
      ask patch a b [set pcolor orange]
    ]
    set b b - 1;
  ]

  set a 5;
  set b 27;

  repeat 5 [
    if b <= 27 and b >= 23[
      ask patch a b [set pcolor red]
    ]
    set b b - 1;
  ]

  set a 6;
  set b 26;

  repeat 3 [
    if b <= 26 and b >= 24[
      ask patch a b [set pcolor red]
    ]
    set b b - 1;
  ]

  ask patch 7 25 [set pcolor red]

  ask patches with [
  (pxcor >= 12 and pxcor <= 60 and pycor <= 30 and pycor >= 20  )

  ][set pcolor gray]

  ;Final del fuego y material (Codigo de utilizable para los otros materiales)

  set bandera 1

end

to go

  if bandera = 1 [

  reset-ticks

  ; agente turtle inicio
    let lista [ [2 30] [3 29] [4 28] [5 27] [6 26] [7 25] [6 24] [5 23] [4 22] [3 21] [2 20] ]
    let po 0

    create-turtles length lista[
       set color red
       left 0
       let pos item po lista
       setxy (first pos) (last pos)

       set po po + 1

    ]
  ; agente turtle fin


  ;hallar valores
    set volumen (Largo_del_material * Ancho_del_material * Alto_del_material) / 1000000

    set masa precision (volumen * densidad) 12

    set transferencia_de_calor (temperatura_final - temperatura_inicial) * masa * capacidad_calorica

    set tiempo (transferencia_de_calor / potencia)

    set tiempoCont precision(tiempo)7

    set t1 (tiempoCont + 1 ) / 16
    set t2 t1 + t1
    set t3 t2 + t1
    set t4 t3 + t1
    set t5 t4 + t1
    set t6 t5 + t1
    set t7 t6 + t1
    set t8 t7 + t1
    set t9 t8 + t1
    set t10 t9 + t1
    set t11 t10 + t1
    set t12 t11 + t1
    set t13 t12 + t1
    set t14 t13 + t1
    set t15 t14 + t1
    set t16 round tiempo - 2

  ;end

  set contadorDos 0
  let contador round tiempo

  repeat contador [

      if banderaDos = 0 [

    ask turtle 0 [set color red setxy 3 30 set heading 90 pen-down fd 8]
    ask turtle 10 [set color red setxy 3 20 set heading 90 pen-down fd 8]
    ask turtle 9 [set color red setxy 4 21 set heading 90 pen-down fd 7 ]
    ask turtle 1 [set color red setxy 4 29 set heading 90 pen-down fd 7 ]
    ask turtle 8 [set color red setxy 5 22 set heading 90 pen-down fd 6]
    ask turtle 2 [set color red setxy 5 28 set heading 90 pen-down fd 6]
    ask turtle 7 [set color red setxy 6 23 set heading 90 pen-down fd 5]
    ask turtle 3 [set color red setxy 6 27 set heading 90 pen-down fd 5]
    ask turtle 4 [set color red setxy 7 26 set heading 90 pen-down fd 4]
    ask turtle 6 [set color red setxy 7 24 set heading 90 pen-down fd 4]
    ask turtle 5 [set color red setxy 8 25 set heading 90 pen-down fd 3]


      set banderaDos 1
    ]

    if banderaDos = 1 [

    ask turtle 0 [set color black set heading 90 pen-down bk 8]
    ask turtle 10 [set color black set heading 90 pen-down bk 8]
    ask turtle 9 [set color black set heading 90 pen-down bk 7]
    ask turtle 1 [set color black set heading 90 pen-down bk 7]
    ask turtle 8 [set color black set heading 90 pen-down bk 6]
    ask turtle 2 [set color black set heading 90 pen-down bk 6]
    ask turtle 7 [set color black set heading 90 pen-down bk 5]
    ask turtle 3 [set color black set heading 90 pen-down bk 5]
    ask turtle 4 [set color black set heading 90 pen-down bk 4]
    ask turtle 6 [set color black set heading 90 pen-down bk 4]
    ask turtle 5 [set color black set heading 90 pen-down bk 3]

      Set banderaDos 0
    ]

      set taim ((contadorDos * potencia) / (masa * capacidad_calorica)) + temperatura_inicial

      ;set tempo (masa * capacidad_calorica * (contadorDos - temperatura_inicial )) / potencia; Funcional

      ;set taim tiempoCont - tempo; prueba


    if contadorDos >= t1[
      ask patches with [
      (pxcor >= 12 and pxcor <= 15 and pycor <= 30 and pycor >= 20  )
      ][set pcolor red]

    ]

    if contadorDos >= t2[
      ask patches with [
      (pxcor >= 15 and pxcor <= 18 and pycor <= 30 and pycor >= 20  )
      ][set pcolor red]
    ]

    if contadorDos >= t3[
      ask patches with [
      (pxcor >= 18 and pxcor <= 21 and pycor <= 30 and pycor >= 20  )
      ][set pcolor red]
    ]

    if contadorDos >= t4[
      ask patches with [
      (pxcor >= 21 and pxcor <= 24 and pycor <= 30 and pycor >= 20  )
      ][set pcolor red]
    ]

    if contadorDos >= t5[
      ask patches with [
      (pxcor >= 24 and pxcor <= 27 and pycor <= 30 and pycor >= 20  )
      ][set pcolor red]
    ]

    if contadorDos >= t6[
      ask patches with [
      (pxcor >= 27 and pxcor <= 30 and pycor <= 30 and pycor >= 20  )
      ][set pcolor red]
    ]

    if contadorDos >= t7[
      ask patches with [
      (pxcor >= 30 and pxcor <= 33 and pycor <= 30 and pycor >= 20  )
      ][set pcolor red]
    ]

    if contadorDos >= t8[
      ask patches with [
      (pxcor >= 33 and pxcor <= 36 and pycor <= 30 and pycor >= 20  )
      ][set pcolor red]
    ]

    if contadorDos >= t9[
      ask patches with [
      (pxcor >= 36 and pxcor <= 39 and pycor <= 30 and pycor >= 20  )
      ][set pcolor red]
    ]

    if contadorDos >= t10[
      ask patches with [
      (pxcor >= 39 and pxcor <= 41 and pycor <= 30 and pycor >= 20  )
      ][set pcolor red]
    ]

    if contadorDos >= t11[
      ask patches with [
      (pxcor >= 41 and pxcor <= 44 and pycor <= 30 and pycor >= 20  )
      ][set pcolor red]
    ]

    if contadorDos >= t12[
      ask patches with [
      (pxcor >= 44 and pxcor <= 47 and pycor <= 30 and pycor >= 20  )
      ][set pcolor red]
    ]

    if contadorDos >= t13[
      ask patches with [
      (pxcor >= 47 and pxcor <= 50 and pycor <= 30 and pycor >= 20  )
      ][set pcolor red]
    ]

    if contadorDos >= t14[
      ask patches with [
      (pxcor >= 50 and pxcor <= 53 and pycor <= 30 and pycor >= 20  )
      ][set pcolor red]
    ]

    if contadorDos >= t15[
      ask patches with [
      (pxcor >= 53 and pxcor <= 56 and pycor <= 30 and pycor >= 20  )
      ][set pcolor red]
    ]

    if contadorDos = t16[
      ask patches with [
      (pxcor >= 56 and pxcor <= 60 and pycor <= 30 and pycor >= 20  )
      ][set pcolor red]
    ]

    set contadorDos contadorDos + 1
       print taim
    tick

  ]

    set bandera 0
  ]


end

to processes
  ; Variables [temperatura_inicial, largo, ancho, alto ]
  ; Variables por hallar [transferencia_de_calor, volumen, masa, tiempo]
  ; constantes [densidad (7850), potencia (500), capacidad_calorica(450), temperatura_final(1535)]

  ;let volumen largo * ancho * alto
  ;let masa volumen * densidad
  ;let transferencia_de_calor masa * capacidad_calorica * (temperatura_final - temperatura_inicial )
  ;let tiempo transferencia_de_calor / potencia
  ;let temperatura_final

end

to reset

  clear-all

  ;hierro
  set temperatura_inicial 40
  set largo_del_material 10
  set ancho_del_material 3
  set alto_del_material 3
  set transferencia_de_calor 0
  set volumen 0
  set masa 0
  set tiempo 0
  set densidad 7850
  set potencia 500
  set capacidad_calorica 450
  set temperatura_final 1536.5
  ;
  set bandera 0

end






@#$#@#$#@
GRAPHICS-WINDOW
136
47
751
438
-1
-1
7.5
1
10
1
1
1
0
1
1
1
0
80
0
50
0
0
1
ticks
30.0

BUTTON
411
10
474
43
NIL
setup\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
338
10
401
43
NIL
reset\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
483
10
546
43
NIL
go\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

INPUTBOX
0
138
132
198
temperatura_inicial
40.0
1
0
Number

INPUTBOX
0
201
132
261
Largo_del_material
10.0
1
0
Number

INPUTBOX
0
264
132
324
Ancho_del_material
3.0
1
0
Number

INPUTBOX
0
326
132
386
Alto_del_material
3.0
1
0
Number

INPUTBOX
5
444
86
504
densidad
7850.0
1
0
Number

INPUTBOX
96
444
160
504
potencia
500.0
1
0
Number

INPUTBOX
167
444
281
504
capacidad_calorica
450.0
1
0
Number

INPUTBOX
287
444
389
504
temperatura_final
1536.5
1
0
Number

INPUTBOX
907
10
1035
70
volumen
0.0
1
0
Number

INPUTBOX
1044
10
1173
70
masa
0.0
1
0
Number

INPUTBOX
772
10
900
70
transferencia_de_calor
0.0
1
0
Number

INPUTBOX
1178
10
1307
70
tiempo
0.0
1
0
Number

PLOT
772
73
1308
442
tranferencia de calor
Tiempo
 temperatura
0.0
10.0
0.0
10.0
true
true
"" ""
PENS
"Temperatura actual de la barra" 1.0 1 -8053223 true "" "plot taim"
"Temperatura final de la barra" 1.0 0 -7500403 true "" "plot temperatura_final"

CHOOSER
0
89
132
134
Materiales
Materiales
"hierro"
0

TEXTBOX
396
440
993
531
Densidad = La densidad tipica del hierro es de aproximadamente 7850 kg/m^3.\n\nPotencia = Se refiere a la potencia del soplete utilizado para calentar el hierro(500W).\n\nCapacidad calorica = Indica cuánto calor se necesita para cambiar la temperatura de un material(450 j/kg).\n\nTemperatura final = la temperatura final representa el punto al que deseas que el hierro alcance antes de que cambie su estado fisico.\n
10
0.0
1

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.4.0
@#$#@#$#@
@#$#@#$#@
1.0
    org.nlogo.sdm.gui.AggregateDrawing 1
        org.nlogo.sdm.gui.ReservoirFigure "attributes" "attributes" 1 "FillColor" "Color" 192 192 192 185 169 30 30
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
