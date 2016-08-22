# Domain model

General note: this is a popular kata, and as such I imagine a number of solutions
must be available online.
I am going to avoid looking into any existing solutions for my first attempt,
followed by seeking feedback, then do some research on previous solutions and
improve my own.

### Public interface

As an absolute first step I am going to consider the public interface of the
system.  
This consists of two public methods: #initialize and and #tick.  

The latter updates the state of the grid based on the rules and returns it.  
The former allows a user of the system to create an initial state, i.e. set a
number of cells to 'alive'. In fact, I believe it is better to assume there is
no such thing as an alive or dead cell, rather its presence or not, which leads
me to the infinite grid.

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

### Terminology

(Notice that the description of grid and cell below is based around a visual
representation of the data involved)

- Grid | This is an infinite two-dimensional orthogonal grid of square cells.
- Cell | Each cell in the grid is square and can either be dead or alive.
