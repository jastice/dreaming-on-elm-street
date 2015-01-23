module Slides (slides) where


import Text
import List
import Signal (Signal, (<~), constant, foldp)
import Graphics.Element (..)
import Keyboard
import Debug
import Signal.Extra (applyMany)

import Ulmenstrasse
import Ulmenstrasse2



slides: List (Signal Element)
slides = [
  constant intro,
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


-- big type `JavaScript`, white on black
intro = Text.fromString "JavaScript" |> Text.height 160 |> Text.centered

-- O'Reilly JavaScript definitive guide cover
magicalRhino = fittedImage 500 656 "img/javascript.jpg"

-- _Nightmare_ from MLP
magicalUnicornNightmare = image 400 400 "img/luna.png"