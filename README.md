What's my score?
================

This my first real firay into ruby, so what better way to explore the language than via a Kata.  

*View the [problem](http://code.joejag.com/coding-dojo-bowling-scores/).*

The aim of this Kata is to calculate bowling scores - it's a lot more complicated than you think.


I had two aims:
---------------
1) Uses Test driven development
2) See what the language gives me in terms of "not having to write code" - It does pretty well on that front.
  

Here is an outline of my approach:
----------------------------------

First of all I need to understand the problem - my reasoning if I can understand how the scoring works then I can code my mental process.  The trickiest to understand is the perfect game, so I started with that.  

              [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0] [10,10,10]
    frame     10       10      10      10      10      10      10      10      10     30          = 120  
    spare              10      10      10      10      10      10      10      10     10 10       = 100 
    strike                     10      10      10      10      10      10      10           10    = 80    
                                                                                                  = 300

               [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [0,0] 
    frame       10      10      10      10      10      10      10      10      10      0         = 90
    spare               10      10      10      10      10      10      10      10                = 80
    strike                      10      10      10      10      10      10      10                = 70
                                                                                                  = 240


                [4,6], [4,6], [4,6], [4,6], [4,6], [4,6], [4,6], [4,6], [4,6], [4,6,4]
    frame        10     10     10     10     10     10     10     10     10     10                = 100
    spare               4      4      4      4      4      4      4      4      4   4             = 40
                                                                                                  = 140

This give me a clue to how work out the score of any game:
1) Calculate frame score
2) Calculate spare score
3) Calcuate strike score

Add them together and you have the score.  For the code itself, the key is to keep on refactoring, re-organise, combine and remove inefficienes. 


Running the thing
-----------------

To run the gherkins clone the repo, and run
    gem install rspec
    gem install cucumber
    cucumber

    Feature: Calculate my bowling score
      In order to win big at ten pin bowling
      As a player
      I want to be told my score

      Scenario Outline: Calculate my score          # features\bowling_score.feature:6
        Given I have entered my game card as <card> # features/step_definitions/stepdef.rb:6
        When I ask for my score                     # features/step_definitions/stepdef.rb:12
        Then the result should be <score>           # features/step_definitions/stepdef.rb:16
    
        Examples:
          | card                                                                               | score |
          | [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]               | 0     |
          | [3,3], [3,3], [3,3], [3,3], [3,3], [3,3], [3,3], [3,3], [3,3], [3,3]               | 60    |
          | [4,6], [4,6], [4,6], [4,6], [4,6], [4,6], [4,6], [4,6], [4,6], [4,6,4]             | 140   |
          | [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [0,0]      | 240   |
          | [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,10,10] | 300   |

    5 scenarios (5 passed)
    15 steps (15 passed)


Some Notes:
-----------

The following sum up the contents of the array, although the reduce(:+) trick is far more elegent:

    class Array
      def sum
		    self.inject(0) { |a,b| a+=b; a }
	    end
    end

    [1,2,3].sum
    => 6

    [1,2,3].reduce(:+)
    => 6
