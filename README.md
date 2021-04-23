# Developer Programming Problem

## The Problem
The surface of Mars can be modelled by a rectangular grid around which robots are able to move according to instructions provided from Earth. You are to write a program that determines each sequence of robot positions and reports the final position of the robot.

## The Solution
- I chose to use a Test Driven Development approach to ensure that the code is working as intended
- I went for a bottom up approach, in this approach I worked on the smaller & independent units of code like the Rover and Planet, leaving the larger Input and Output modules for later on
- In in order to improve the flexibility certain elements follow the SOLID design principles

## Running 
 1.  Clone the repository
 2. Open using an up-to date version of Xcode (preferably versions 12+)
 3. Currently no UI or command line support, only unit tests exists which can be run using CMD + U
     
## Next Steps
 1. Complete the Input Parser
 2. Create an Output Parser, which will receive a list of *Movable* objects and return a string representing their location, heading and status
 3. Create the app user interface
     Scene 1. A input textfield with a button to proceed to the next scene. 
     Scene 2: An output label indicating the final positions and heading of the given robots
4. Create the app logic
    a. Following either MVC or MVVM, either is simple enough in this case
    b. Mostly involves passing the input from the View through to various parts of the Core 
