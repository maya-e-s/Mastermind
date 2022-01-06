# Mastermind

 Using Donald Knuth's algorithm to solve the game of mastermind in 5 guesses or less.
 
 ## Files
 This project includes four MATLAB files: mastermind.m, nextGuess.m, elimination.m, and compareCodes.m<br>
 To play the game, run the **mastermind.m** file
 
 ## Game Rules
 The game Mastermind challenges player one, the codebreaker, to use logic and deduction skills to break player two’s, the codemaker’s, code.<br>
 The computer will be playing the role of teh codebreaker, and the user will be playing the role of the codemaker.<br>
 Typically, the codemaker uses a combination of six colors; pink, orange, yellow, green, purple, and white, to make a code four indices wide, allowing colors to repeat. In this game, I used the numbers 1-6 to represent six colors.<br>
 Every turn, the codebreaker must guess a code in hopes that their guessed comination matches the pattern created by the codemaker. After every guess, the codemaker responds to the guess in a series of red and white pegs, where red represents a correct color in its right place, while a white peg represents a correct color but in the wrong place. 
 For example, if the codemaker’s code was 1234, and the codebreaker guessed 1525, the codemaker would return one red peg and one white peg.

## Algorithm
In 1977, Professor Donald Knuth of Standford University created an algorithm that continuously reduced the number of possible patterns to solve Mastermind in five moves or
fewer, always starting with a guess in the form of AABB and using the minimax technique to find his next guess. This project implements Knuth's algorithms to break the codemaker's code in 5 guess or less. 
