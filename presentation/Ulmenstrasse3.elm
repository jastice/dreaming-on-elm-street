module Ulmenstrasse3 (slide,main) where

import Mouse
import Text
import Text exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Color exposing (..)
import Signal exposing (..)
import Signal.Extra exposing ((<~),(~))
import Time exposing (fps)

-- Path and Form
-- origin is at center
centerStyle = { defaultLine | width = 10, color = yellow, dashing = [40,10] }
borderStyle = { defaultLine | width = 6 }
center = path [(-400,0),(400,0)] |> traced centerStyle
border = path [(-400,0),(400,0)] |> traced borderStyle

-- Forms can be moved
top = move (0,300) border
bottom = move (0,-300) border

-- showing Text
sign = fromString "Ulmenstrasse 3" |> Text.height 30 |> centered |> toForm |> move (0,350)

-- images are elements, too
nightmare x y = image 100 100 "../img/luna.png" |> toForm |> move (x,y)

tick = foldp (+) 0 (fps 60)

-- mapping functions onto signal
-- function composition
-- lambda
--nightmareSignal = nightmare << (\x -> x-400) << toFloat <~ Mouse.x

nightmareSignal = (\t -> nightmare ((cos t)*200) ((sin t)*200)) << (\t -> t/1000) <~ tick

-- collage: combine Forms to an Element
scene mare = collage 800 800 [top, bottom, center, mare, sign]

slide = scene <~ nightmareSignal

main = slide
