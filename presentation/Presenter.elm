module Presenter(present,positioning,voidSlide,scaledElemIntoCollage) where

import Array
import Array(Array)
import Text
import Text (..)
import List (..)
import Signal (Signal, (<~), (~), constant, foldp)
import Graphics.Element (..)
import Graphics.Collage (..)
import Keyboard
import Debug
import Signal.Extra (applyMany)
import Window (dimensions)

type Control = Top | Bottom | Previous | Next | None

updateSlide: Int -> Control -> Int -> Int
updateSlide lastSlide control current = 
  let nextSlide = case control of
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

voidSlide = fromString "∅" |> Text.height 180 |> centered

scaledElemIntoCollage elem = collage 800 800 [(scale 1.5 <| toForm elem)]

-- signals

--displaySlide: Int -> Signal Element
displaySlide slides page = case (Array.get page slides) of
  Just s -> s
  Nothing -> voidSlide

present: Array (Signal Element) -> Signal Element
present slides = 
  let lastSlide = Array.length slides - 1
      controls = controlAction <~ Keyboard.arrows
      currentSlide = foldp (updateSlide lastSlide) 0 controls
      --theActualSlideSignal = (displaySlide slides) <~ currentSlide
      slideList = Array.toList slides -- oh the hackness
      theActualSlideSignal = applyMany (chooseSlide <~ currentSlide) slideList
  in positioning <~ dimensions ~ theActualSlideSignal


--theActualSlideSignal = applyMany (chooseSlide <~ currentSlide) slides
