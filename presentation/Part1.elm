module Part1 where

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
import JavaScript

import UlmenstrasseSchild
import Ulmenstrasse
import Ulmenstrasse2
--import JavaScript
import Markdown



slides = Array.fromList [
  constant logo,
  JavaScript.slide,
  constant magicalRhino,
  constant magicalUnicornNightmare,
  constant UlmenstrasseSchild.slide,
  constant Presenter.voidSlide
  ]

logo = link "JavaScript.elm" <| fittedImage 800 800 "../img/logo.svg"

-- O'Reilly JavaScript definitive guide cover
magicalRhino = fittedImage 800 800 "../img/javascript.jpg"

-- _Nightmare_ from MLP
magicalUnicornNightmare = fittedImage 800 800 "../img/luna.png"

main = Presenter.present slides