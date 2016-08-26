# Domain model

General note: this is a popular kata, and as such I imagine a number of solutions
must be available online.
I am going to avoid looking into any existing solutions for my first attempt,
followed by seeking feedback, then do some research on previous solutions and
improve my own.

![diagram](https://github.com/andreamazza89/game_of_life/blob/master/docs/Drawing.jpeg)

Two points to notice about the classes used:
- Initially the cell was not a class: a cell was simply an array with two 
elements like so: ```[x,y]```. However, since both rules rely on ```#neighbours``` 
and ```has_n_neighbours?```, these seem to belong to a Cell class, which 
understands its location on the board in relation to other cells.
- The grid class treats all rules equally, the only 'contract' between the two 
being the following: a Rule needs to implement a method 
```:evaluate_next_generation(grid)```, which returns the new generation of cells 
based on the current rule and excluding any cells that might already exist in 
```Grid@next_generation```. This means that if a new rule is required, the 
application can be extended by simply writing a new Rule class and include it 
when calling ```Grid#tick```,  without the need to modify the Grid class.

### Terminology

(Notice that the description of grid and cell below is based around a visual
representation of the data involved)

- Grid       | This is an infinite two-dimensional orthogonal grid of square cells.
- Cell       | Each cell in the grid is square and can either be dead or alive.
- Neighbour  | A cell has eight neighbours, which are the surrounding cells.
- Generation | This is an array of alive cells at one given point in time. 

### Public interface

As an absolute first step I am going to consider the public interface of the
system.
This consists of two public methods: #initialize and and #tick.

The latter updates the state of the grid based on the rules and returns it.
The former allows a user of the system to create an initial state, i.e. set a
number of cells to 'alive'. In fact, I believe it is better to assume there is
no such thing as an alive or dead cell, rather the presence or absence of a cell,
which leads me to the infinite grid.

### The grid

The grid is described as infinite, which makes for a very interesting problem:
how does one represent infinity in a computer, which has limited memory?
The first step is to abandon the idea of storing the state of the grid as a
multidimensional array where each element is a cell. Not only is this impossible,
but also wasteful of memory: since the state of a cell is binary, there is no
need to store both the location of alive and dead cells. Storing the location of
each alive or dead cell implicitly includes data about the other type of cell.
Knowing where each alive cell is means we also know where the dead ones are,
that is anywhere else. I am going to choose to store the coordinates of alive
cells for the following reason:

- The grid is initialised with a finite list of cells that are alive. It follows
that at the beginning the list of alive cells if finite, whereas the list of dead
ones is infinite.

A few challenges posed by the infinite grid:

- As the grid evolves tick after tick, it is not possible to determine how large
the list of alive cells will become. If larger than the architecture of the
language used allows to keep track of, an arbitrary limit to the number of alive
cells might be introduced.
- If the computation time on each tick is critical and has to be under a certain
figure, we will need to establish a worst case scenario to test against.

### Coordinate system

The grid has an origin cell, with coordinates x:0, y:0. The rest of the cells
will be referred to in terms of offset in both axes from the origin. Both axes
are positively and infinitely infinite.

### Algorithm

A new state for the grid, based on the current state, is calculated as follows:
- The first assumption is that a new generation has no surviving cells. An empty 
array is assigned to ```Grid@next_generation```
- The ```Grid#tick``` method is invoked and given a list of rules. The grid asks 
each rule for a list of new cells.
- Notice that since rules 1-3 only deal with cells that die and we start from the 
assumption that no cells survive, these two rules are irrelevant.
- Once the grid has gone through all rules, the new generation of cells 
(```Grid@next_generation```) becomes the current generation (```Grid@current_generation```)

### The rules

As mentioned, Rules one and three become insignificant as we are starting from 
the assumption that no cells survive the next generation and these rules describe which cells do not survive.

###### Rule 2: Any live cell with two or three live neighbours lives on to the 
next generation.

This rule simply looks at all live cells and selects any that have 2 or 3 
neighbours. In addition, before filtering, the rule removes any cells that are 
already included in ```Grid@next_generation``` to avoid marking the same cell as 
alive by more than one rule.

###### Rule 4: Any dead cell with exactly three live neighbours becomes a live 
cell, as if by reproduction.

This rule is based on the following assumption: any dead cell that might come 
alive in the next generation must be a neighbour of a cell that is alive in 
the current generation.
With this in mind, this rule first puts all neighbours of the 
```Grid@current_generation``` in an array named ```potential_new_cells```, then 
removes and duplicates and cells already existing in ```Grid@next_generation``` 
as per rule two, finally it selects any cells that have exactly three neighbours.
