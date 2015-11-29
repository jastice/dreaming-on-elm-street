module Ulmenstrasse (slide,main) where

import Text
import Text exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Color exposing (..)
import Signal

-- Path and Form
-- origin is at center
centerStyle = { defaultLine | width = 10, color = yellow, dashing = [40,10] }
borderStyle = { defaultLine | width = 6 }
center = path [(-400,0),(400,0)] |> traced centerStyle
border = path [(-400,0),(400,0)] |> traced borderStyle

--center = path [(-400,0),(400,0)] |> traced (dashed yellow)
--border = path [(-400,0),(400,0)] |> traced (solid black)

-- Forms can be moved
top = move (0,300) border
bottom = move (0,-300) border

-- showing Text
sign = fromString "Ulmenstrasse" |> Text.height 30 |> centered |> toForm |> move (0,350)

-- images are elements, too
nightmare = fittedImage 100 100 "../img/luna.png" |> toForm

-- collage: combine Forms to an Element
scene = collage 810 810 [top, bottom, center, nightmare, sign]

slide = Signal.constant scene

main = scene
