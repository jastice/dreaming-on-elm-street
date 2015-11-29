module UlmenstrasseSchild (slide) where

import Text
import Text exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element
import Graphics.Element exposing (..)
import Color exposing (..)
import Signal

text = fromString "Ulmenstrasse" |> Text.height 120 |> Text.color white |> centered |> toForm
background = rect 800 200 |> filled darkBlue

outlineStyle = { defaultLine | width = 5, color = white, cap = Round }
lineHor = segment (-380,0) (380,0) |> traced outlineStyle
lineVert = segment (0,-80) (0,80) |> traced outlineStyle

sign = collage 800 800 [
  background, text,
  move (0,80) lineHor,
  move (0,-80) lineHor,
  move (380,0) lineVert,
  move (-380,0) lineVert
  ]

linkedSign = Graphics.Element.link "Ulmenstrasse-Baustelle.elm?debug" sign

slide = linkedSign

--main = linkedSign