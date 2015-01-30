module JavaScript (slide,main) where

import Text (..)
import Graphics.Collage (..)
import Time
import Signal ((<~),(~))
import Presenter (positioning)
import Window

-- `JavaScript` animation slide

javaScript t = fromString "JavaScript" 
  |> typeface ["Comic Sans MS"] 
  |> height 120 |> centered
  |> toForm
  |> rotate (sin (t/250) * 0.2)

javaScriptAnimation t = collage 800 800 [javaScript t]

tick = Time.every (60*Time.millisecond)
slide = javaScriptAnimation <~ tick
main = positioning <~ Window.dimensions ~ slide