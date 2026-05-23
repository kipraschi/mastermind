# Mastermind

Command-line Mastermind built in Ruby. Part of The Odin Project Ruby curriculum.

## How to run

    ruby main.rb

## Gameplay

Choose to be the Codemaker or Codebreaker at the start. The code is 4 unique digits, each between 1 and 6. The codebreaker has 12 turns to guess the code. After each guess, feedback is given as white pegs (right number, wrong position) and black pegs (right number, right position).

## Structure

- `main.rb` - entry point
- `lib/game.rb` - game loop, role selection, win/loss detection
- `lib/board.rb` - board state and rendering
- `lib/codemaker.rb` - base class for codemaker role
- `lib/computer_codemaker.rb` - generates a random secret code
- `lib/human_codemaker.rb` - human enters a secret code
- `lib/computer_codebreaker.rb` -  computer solver that filters remaining candidates after each guess
- `lib/human_codebreaker.rb` - human guess input
- `lib/feedback.rb` - shared feedback logic as a module
- `lib/input_validation.rb` - shared input validation as a module