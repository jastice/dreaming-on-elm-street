module Part2 where


import Presenter
import Array
import Text
import List
import Signal (Signal, (<~), (~), constant, foldp)
import Graphics.Element (..)
import Graphics.Collage (Form, collage, toForm, rotate, scale)
import Keyboard
import Debug
import Signal.Extra (applyMany)
import Time

import UlmenstrasseSchild
import Ulmenstrasse
import Ulmenstrasse2
--import JavaScript
import Markdown
import Presenter(scaledElemIntoCollage,voidSlide)


slides = Array.map constant <| Array.fromList [
  slideMain,
  slideMain2,
  slideElement,
  slideForm,
  slideCollage,
  voidSlide,
  UlmenstrasseSchild.slide
  ]



slideMain = scaledElemIntoCollage <| Markdown.toElement """
# main

    main: Element
    main = Text.asText "Wake up!"

All output must flow through `main`.*
"""

slideMain2 = Markdown.toElement """

 (*only half-true)

"""

slideElement = scaledElemIntoCollage <| Markdown.toElement """
# Element
    
> And the whole [is] greater than the part.

> *Euclid (ca. 300 BC) Elements, Book I, Common Notions 5*

The unit of layouting.  
Can be arranged in relative positions.  
Images are Elements.
"""

slideForm = scaledElemIntoCollage <| Markdown.toElement """
# Form

> I think that modern physics has definitely decided in   
> favor of Plato. In fact the smallest units of matter  
> are not physical objects in the ordinary sense;  
> they are forms, ideas which can be expressed  
> unambiguously only in mathematical language.

> *Werner Heisenberg*

`Shape`, `Path` and `Element` may be turned into `Form`,  
the smallest unit of graphics in Elm.

"""


slideCollage = scaledElemIntoCollage <| Markdown.toElement """
# Collage

    collage : Int -> Int -> List Form -> Element

"""



main = Presenter.present slides