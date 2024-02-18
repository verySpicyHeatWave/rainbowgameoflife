# Rainbow Game of Life

## About the Game
This game is based on Conway's Game of Life. The game starts with random cells being populated.  
The cells will either die, stay alive, or revive depending on the state of the cells around them.  
The rules that the game uses to determine what the state of any given cell will be, per the [Wikipedia page](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life), are:
- Any live cell with fewer than two live neighbors dies, as if by underpopulation.
- Any live cell with two or three live neighbors lives on to the next generation.
- Any live cell with more than three live neighbors dies, as if by overpopulation.
- Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.


## How to Play
A left click in the grid allows the user to place their own cell. On its own, that cell will die, given the rules above.  
However, a strategically placed cell near some other clusters can create some cool effects, or simply clear a block.  
If the user holds down the mouse button, then that cell will stay alive despite the rules. You are God!  
Pressing the 'R' key will reset the game. You can hold it down for a crazy TV-static type of effect, or just tap it to reinvigorate the board.  

If the user can completely clear the board, then the user wins. Congratulations, you eradicated all life! You monster!


## What You Need
All you need in order to play the game is to download the [Love2D](https://love2d.org/) game engine. That link will get you there.  
If you want to read the code, any text editor that can do syntax highlighting for the language Lua should do it.