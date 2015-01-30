module DreamingOnElmStreet (main) where

import Array (append)
import Presenter(present)

import Part1
import Part2
import Part3
import Part4

slides = 
  Part1.slides `append` Part2.slides `append` 
  Part3.slides `append` Part4.slides


main = present slides