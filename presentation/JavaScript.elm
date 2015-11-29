module JavaScript (slide,main) where

import Text exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (centered)
import Time
import Signal.Extra exposing ((<~),(~))
import Window
import Tools exposing (positioning)

-- `JavaScript` animation slide

javaScript t = fromString "JavaScript" 
  |> typeface ["Comic Sans MS"] 
  |> height 120 |> centered
  |> toForm
  |> rotate (sin (t/250) * 0.2)

javaScriptAnimation t = collage 800 800 [javaScript t]

slide = javaScriptAnimation <~ Time.every (60*Time.millisecond)
main = positioning <~ Window.dimensions ~ slide