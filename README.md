# Game of life

My solution to the famous kata Game of Life, devised by John Horton Conway.  
Follow [this link](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) for a 
description of the game.


## Rules

Four rules dictate how the grid should be updated on each tick:

1 - Any live cell with fewer than two live neighbours dies, as if caused by under-population.
2 - Any live cell with two or three live neighbours lives on to the next generation.
3 - Any live cell with more than three live neighbours dies, as if by over-population.
4 - Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
