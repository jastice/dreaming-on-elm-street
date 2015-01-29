module Presenter(positioning,main) where

import Text (..)
import List (..)
import Signal (Signal, (<~), (~), constant, foldp)
import Graphics.Element (..)
import Keyboard
import Debug
import Signal.Extra (applyMany)
import Slides (slides)
import Window (dimensions)

type Control = Top | Bottom | Previous | Next | None

updateSlide: Control -> Int -> Int
updateSlide control current = 
  let lastSlide = length slides - 1
      nextSlide = case control of
        Top -> 0
        Previous -> current - 1
        Next -> current + 1
        Bottom -> lastSlide
        None -> current
  in clamp 0 lastSlide nextSlide 

chooseSlide: Int -> (List a -> a)
chooseSlide page = drop page >> head

controlAction {x,y} = case (x,y) of
  (-1, _) -> Previous
  (1, _) -> Next
  (_, 1) -> Top
  (_, -1) -> Bottom
  _ -> None


positioning (w,h) slide = container w h middle slide 

-- signals

displaySlide: Int -> Signal Element
displaySlide page = drop page slides |> head

controls = controlAction <~ Keyboard.arrows
currentSlide = foldp updateSlide 0 controls

theActualSlideSignal = applyMany (chooseSlide <~ currentSlide) slides
positionedSlide = positioning <~ dimensions ~ theActualSlideSignal

main = positionedSlide
