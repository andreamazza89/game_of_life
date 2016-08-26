# Game of life
My solution to the famous kata Game of Life, devised by John Horton Conway.
Follow [this link](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) for a
description of the game.

### Rules
The game consists of an infinite orthogonal grid, full of square cells. These 
can either be dead or alive. At each step in time, called a *tick*, the state of 
the grid is calculated based on the following rules: 

1. Any live cell with fewer than two live neighbours dies, as if caused by under-population.
2. Any live cell with two or three live neighbours lives on to the next generation.
3. Any live cell with more than three live neighbours dies, as if by over-population.
4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

### Domain model
Please see my domain model, including my rationale, [here](https://github.com/andreamazza89/game_of_life/blob/master/docs/domain_model.md).

### Installation
- Install the appropriate version of ruby (recommended: [rvm](https://rvm.io/rvm/install)) and [bundler](http://bundler.io/).
- Run ```bundle install```
- Check that all tests are passing ```rspec```

### Usage
- The Grid class is to be instantiated with an initial state. This is an array of 
Cell instances, like so: ```Grid.new([Cell.new(0,0), Cell.new(1,2)])```
- The Grid can be updated to the next state by calling ```Grid#tick([RuleTwo, RuleFour])```
- A very basic example usage is included, with instructions below.

### Example usage - drawillle

An example use of the system can be found in the *visualisation* folder.

This uses the gem [drawille](https://github.com/asciimoo/drawille) to display an 
evolving grid on the console.

To use it with the default settings, simply move to the visualisation directory 
and run ```ruby visualisation/visualiser.rb ./initial_state.rb```

You can also change settings as follows:  
```ruby visualisation/visualiser.rb``` | ```relative_path_from_visualiser_to_initial_state``` | ```total_number_of_frames``` | ```frames_per_second``` | ```window_size``` 

You can change the initial state by editing *visualisation/initial_state.rb*.

Finally, please be aware that drawille computes the whole animation before 
displaying it, so that the more frames and cells, the more time before the animation starts.
