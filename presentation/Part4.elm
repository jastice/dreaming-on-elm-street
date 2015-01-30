module Part4 where

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
import Markdown

import HuepfburgSchild
import Presenter(scaledElemIntoCollage)


slides = Array.map constant <| Array.fromList [
  Presenter.voidSlide,
  timeTravel,
  HuepfburgSchild.slide
  ]

foldingThePast = scaledElemIntoCollage <| Markdown.toElement """
# Folding the Past

    foldp : (a -> state -> state) -> state -> Signal a -> Signal state

The fundamental way of keeping state.

"""

timeTravel = fittedImage 800 500 "../img/delorean.jpg"