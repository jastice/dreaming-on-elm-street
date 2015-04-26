module Slides (slides) where

import President exposing (voidSlide)
import Array
import Text
import List
import Signal exposing (Signal, (<~), (~), constant, foldp)
import Graphics.Element exposing (..)
import Graphics.Collage exposing (Form, collage, toForm, rotate, scale)
import Keyboard
import Debug
import Signal.Extra exposing (applyMany)
import Time

import JavaScript
import UlmenstrasseSchild
import Ulmenstrasse
import Ulmenstrasse2
import JavaScript
import Markdown
import HuepfburgSchild
import Tools exposing (scaledElemIntoCollage)

slides = List.concat [slidesIntro, slidesPart1, slidesPart2, slidesPart3, slidesPart4]

slidesIntro = [
  -- part 1
  constant logo,
  JavaScript.slide
  ]

slidesPart1 = List.map constant [
  magicalRhino,
  magicalUnicornNightmare,
  UlmenstrasseSchild.slide,
  voidSlide
  ]

slidesPart2 = List.map constant <| [
  slideMain,
  slideMain2,
  slideElement,
  slideForm,
  slideCollage,
  voidSlide,
  UlmenstrasseSchild.slide
  ]

slidesPart3 = List.map constant <| [
  --whatJustHappened,
  slideSignalTower,
  slideMainSignal,
  slideSignals1,
  slideSignals2,
  voidSlide,
  UlmenstrasseSchild.slide
  ]

slidesPart4 = List.map constant <| [
  voidSlide,
  timeTravel,
  HuepfburgSchild.slide
  ]

-- part 1

logo = link "JavaScript.elm" <| fittedImage 800 800 "../img/logo.svg"

-- O'Reilly JavaScript definitive guide cover
magicalRhino = fittedImage 800 800 "../img/javascript.jpg"

-- _Nightmare_ from MLP
magicalUnicornNightmare = fittedImage 800 800 "../img/luna.png"

-- part 2

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

-- part 3

whatJustHappened = scaledElemIntoCollage <| Markdown.toElement """
# What just happened?
"""

slideSignalTower = fittedImage 800 800 "../img/signal-tower.svg"

slideMainSignal = scaledElemIntoCollage <| Markdown.toElement """
# main again

    main: Signal Element
    main = scene <~ Mouse.position

"""

slideSignals1 = scaledElemIntoCollage <| Markdown.toElement """
# Signals

* the only way to get outside input in elm
* the type reflects this
"""

slideSignals2 = scaledElemIntoCollage <| Markdown.toElement """
# Leaving the realm of purity

* mapping a function onto a signal transforms your signal
* but never ever do you get a non-signal value from a signal
"""


-- part 4
foldingThePast = scaledElemIntoCollage <| Markdown.toElement """
# Folding the Past

    foldp : (a -> state -> state) -> state -> Signal a -> Signal state

The fundamental way of keeping state.

"""

timeTravel = fittedImage 800 500 "../img/delorean.jpg"
