## Introduction

The text adventure game based on a similar game from "Land of Lisp" by Conrad Barski, with a few personal modifications over time. To see the how the game is different from the one in the book, please read the Modifications section.

### How to Run the Game
1. If you haven't already, install CLISP.
2. From your command-line interface (Terminal for Mac OSX), run 'clisp game.lsp'


## Modifications
Many modifications were made based on my learning and changing preferences over time. Three definite sources that primarily influenced these changes were:
* The Systematic Program Design (MOOC on edX) by Prof. Gregor Kiczales at UBC
* The Introduction to Game Design (MOOC on edX) by Prof. Philip Tan and Prof. Sarah Verilli at MIT
* Structure and Interpration of Computer Programs (book) by Gerald Sussman and Hal Abelson

### Code
1. Restructured with increased modularity with future refactoring of each module in mind. For e.g., separating the scene rendering code permits one to render via web, native 3D graphics etc. without changing the other sections.
=======

### Game Mechanics
Added new actions in the form of
