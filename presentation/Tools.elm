module Tools (positioning,scaledElemIntoCollage) where

import Graphics.Element exposing (container, middle)
import Graphics.Collage exposing (collage,scale,toForm)

positioning (w,h) slide = container w h middle slide 

scaledElemIntoCollage elem = collage 800 800 [(scale 1.5 <| toForm elem)]