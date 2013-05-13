Feature: Calculate my bowling score
  In order to win big at ten pin bowling
  As a player
  I want to be told my score

Scenario Outline:  Calculate my score
  Given I have entered my game card as <card>
  When I ask for my score
  Then the result should be <score>
 
  Examples:
    | card                                                                               | score |
    | [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]               |    0  |
    | [3,3], [3,3], [3,3], [3,3], [3,3], [3,3], [3,3], [3,3], [3,3], [3,3]               |   60  |
    | [4,6], [4,6], [4,6], [4,6], [4,6], [4,6], [4,6], [4,6], [4,6], [4,6,4]             |  140  |
    | [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [0,0]      |  240  |    
    | [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,10,10] |  300  |    