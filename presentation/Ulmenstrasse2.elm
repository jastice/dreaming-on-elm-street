module Ulmenstrasse2 (slide,main) where

import Mouse
import Text
import Text (..)
import Graphics.Collage (..)
import Graphics.Element (..)
import Color (..)
import Signal (..)

-- Path and Form
-- origin is at center
center = path [(-400,0),(400,0)] |> traced (dashed yellow)
border = path [(-400,0),(400,0)] |> traced (solid black)

-- Forms can be moved
top = move (0,300) border
bottom = move (0,-300) border

-- showing Text
sign = fromString "Ulmenstrasse 2" |> Text.height 30 |> centered |> toForm |> move (0,350)

-- images are elements, too
nightmare x = image 100 100 "../img/luna.png" |> toForm |> move (x,0)

-- mapping functions onto signal
-- function composition
-- lambda
nightmareSignal = nightmare << (\x -> x-400) << toFloat <~ Mouse.x

-- collage: combine Forms to an Element
scene mare = collage 800 800 [top, bottom, center, mare, sign]

slide = scene <~ nightmareSignal

main = slide
