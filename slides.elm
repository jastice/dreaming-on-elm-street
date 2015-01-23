module Slides (slides) where


import Text
import List
import Signal (Signal, (<~), constant, foldp)
import Graphics.Element (..)
import Graphics.Collage (Form, collage, toForm, rotate)
import Keyboard
import Debug
import Signal.Extra (applyMany)
import Time

import Ulmenstrasse
import Ulmenstrasse2



slides: List (Signal Element)
slides = [
  constant logo,
  javaScriptAnimation <~ tick,
  constant magicalRhino,
  constant magicalUnicornNightmare,
  -- empty ulmenstrasse
  Ulmenstrasse.slide,
  -- concepts introduced
  -- empty ulmenstrasse 2
  Ulmenstrasse2.slide
  -- what just happened?
  -- signals overview
  -- empty example for foldp
  -- "Folding the Past" concept introduction
  ]

logo = image 800 800 "img/logo.svg"


-- O'Reilly JavaScript definitive guide cover
magicalRhino = image 500 656 "img/javascript.jpg"

-- _Nightmare_ from MLP
magicalUnicornNightmare = fittedImage 400 400 "img/luna.png"


-- `JavaScript` animation

javaScript: Float -> Form
javaScript t = Text.fromString "JavaScript" 
  |> Text.typeface ["Comic Sans MS"] 
  |> Text.height 120 |> Text.centered
  |> toForm
  |> (rotate <| (sin t) * 0.3)

tick = Time.every (60*Time.millisecond)

javaScriptAnimation: Float -> Element
javaScriptAnimation t = collage 800 800 [javaScript (t/200)]
