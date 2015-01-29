module Slides (slides,logo,magicalRhino,magicalUnicornNightmare) where


import Text
import List
import Signal (Signal, (<~), constant, foldp)
import Graphics.Element (..)
import Graphics.Collage (Form, collage, toForm, rotate, scale)
import Keyboard
import Debug
import Signal.Extra (applyMany)
import Time

import UlmenstrasseSchild
import Ulmenstrasse
import Ulmenstrasse2
import JavaScript
import Markdown


slides: List (Signal Element)
slides = [
  constant logo,
  JavaScript.slide,
  constant magicalRhino,
  constant magicalUnicornNightmare,
  UlmenstrasseSchild.slide,
  constant slideMain,
  constant slideMain2,
  constant slideElement,
  constant slideForm,
  constant slideCollage,
  constant slideImages,
  constant slideMainSignal
  --Ulmenstrasse.slide
  -- concepts introduced
  -- empty ulmenstrasse 2
  --Ulmenstrasse2.slide,
  -- what just happened?
  -- signals overview
  -- empty example for foldp
  -- "Folding the Past" concept introduction
  -- do something cool with luna
  -- boxes-and-bubbles example, use with debugger "braid for free!"
  --BouncingPonies.slide
  ]

logo = fittedImage 800 800 "../img/logo.svg"


-- O'Reilly JavaScript definitive guide cover
magicalRhino = fittedImage 800 800 "../img/javascript.jpg"

-- _Nightmare_ from MLP
magicalUnicornNightmare = fittedImage 800 800 "../img/luna.png"


scaledElemIntoCollage elem = collage 800 800 [(scale 2 <| toForm elem)]

slideMain = scaledElemIntoCollage <| Markdown.toElement """
# main

    main: Element
    main = Text.asText "Wake up!"

All output must flow through `main`.*

"""

slideMain2 = Markdown.toElement """

 (*well, mostly)

"""

slideElement = Markdown.toElement """
# Element
    

"""

slideForm = Markdown.toElement """
"""

slideImages = Markdown.toElement """
"""

slideCollage = Markdown.toElement """
"""

slideMainSignal = Markdown.toElement """

# main again

    main: Signal Element
    main = scene <~ Mouse.position

"""


