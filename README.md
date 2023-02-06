# [[2023-02-06]]

#### Interactivity Practice
1. create directory and class for `Stopwatch` object
	![[Pasted image 20230206163020.png]]
2. create the `Stopwatch` widget object as a stateless object
	- there will be an error, since we have not yet created the `state` object yet
	- notice how `Stopwatch` *inherits* `StatefulWidget`
	![[Pasted image 20230206164638.png]]
3. create the `state` object for the `Stopwatch` class
	- this is to be created as a PRIVATE class
	- `state` is a generic class, since any widget can have state, therefore `Stopwatch` will be its object type
	![[Pasted image 20230206163637.png]]
4. import the `Stopwatch` widget into the main class and create the `Stopwatch` class
	- note that the `build()` method is giving the go-ahead to build the widget onto the home page (directory)
	![[Pasted image 20230206181518.png]]
5. add in code to define HOW the time will *change* in the `state` class -> define WHAT will change and how
	![[Pasted image 20230206182136.png]]
	![[Pasted image 20230206182154.png]]
6. update the `build` method to reference the changing time
	![[Pasted image 20230206182444.png]]
	![[Pasted image 20230206182455.png]]
7. update the `Text` widget in build method to use the updating `seconds` property
	![[Pasted image 20230206182702.png]]
8. Lastly, ensure that the timer stops ticking after closing the screen by using the `dispose()` method at the bottom of the state class
	![[Pasted image 20230206182827.png]]