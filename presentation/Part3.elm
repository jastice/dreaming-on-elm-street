module Part3 where

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
import Presenter(scaledElemIntoCollage)

slides = Array.map constant <| Array.fromList [
  --whatJustHappened,
  slideSignalTower,
  slideMainSignal,
  slideSignals1,
  slideSignals2,
  Presenter.voidSlide,
  UlmenstrasseSchild.slide
  ]

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


main = Presenter.present slides