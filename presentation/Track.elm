module Track where

import Presenter(positioning)
import Window (dimensions)
import Text
import Markdown


main = Markdown.toElement """

# Dreaming on Elm Street
  
* [Full Presentation](DreamingOnElmStreet.elm)
* [Part 1: Elm Street](Part1.elm)
* [Part 2: Concepts](Part2.elm)
* [Part 3: Signals](Part3.elm)
* [Part 3: Folding the Past](Part4.elm)
* [Bouncing Castle](BouncingPonies.elm?debug)

      
  """