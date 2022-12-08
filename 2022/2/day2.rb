# frozen_string_literal: true

require_relative '../../utils/file_manager'
require_relative '../../utils/printer'

module Year2022
  class Day2
    ROCK = 'rock'
    PAPER = 'paper'
    SCISSORS = 'scissors'

    LOSE = 'lose'
    DRAW = 'draw'
    WIN = 'win'

    SCORE_FOR_MOVE = {
      ROCK => 1,
      PAPER => 2,
      SCISSORS => 3,
    }
    SCORE_FOR_OUTCOME = {
      LOSE => 0,
      DRAW => 3,
      WIN => 6,
    }

    OUTCOMES_BY_MY_MOVE_AND_OPPONENT_MOVE = {
      ROCK => {
        ROCK => DRAW,
        PAPER => LOSE,
        SCISSORS => WIN,
      },
      PAPER => {
        ROCK => WIN,
        PAPER => DRAW,
        SCISSORS => LOSE,
      },
      SCISSORS => {
        ROCK => LOSE,
        PAPER => WIN,
        SCISSORS => DRAW,
      },
    }

    MOVE_MAPPING = {
      'A' => ROCK,
      'B' => PAPER,
      'C' => SCISSORS,
      'X' => ROCK,
      'Y' => PAPER,
      'Z' => SCISSORS,
    }

    OUTCOME_DESIRED = {
      'X' => LOSE,
      'Y' => DRAW,
      'Z' => WIN,
    }

    def part1
      cumulative_score = 0
      input_file.readlines.each do |line|
        opponent_move, my_move = line.split(" ")
        outcome = OUTCOMES_BY_MY_MOVE_AND_OPPONENT_MOVE[MOVE_MAPPING[my_move]][MOVE_MAPPING[opponent_move]]
        cumulative_score += score(MOVE_MAPPING[opponent_move], outcome)
      end
      cumulative_score
    end

    def part2
      cumulative_score = 0
      input_file.readlines.each do |line|
        opponent_move, my_outcome = line.split(" ")
        cumulative_score += score(MOVE_MAPPING[opponent_move], OUTCOME_DESIRED[my_outcome])
      end
      cumulative_score
    end

    def score(opponent_move, outcome)
      case opponent_move
      when ROCK
        case outcome
        when LOSE
          SCORE_FOR_OUTCOME[LOSE] + SCORE_FOR_MOVE[SCISSORS]
        when DRAW
          SCORE_FOR_OUTCOME[DRAW] + SCORE_FOR_MOVE[ROCK]
        when WIN
          SCORE_FOR_OUTCOME[WIN] + SCORE_FOR_MOVE[PAPER]
        end
      when PAPER
        case outcome
        when LOSE
          SCORE_FOR_OUTCOME[LOSE] + SCORE_FOR_MOVE[ROCK]
        when DRAW
          SCORE_FOR_OUTCOME[DRAW] + SCORE_FOR_MOVE[PAPER]
        when WIN
          SCORE_FOR_OUTCOME[WIN] + SCORE_FOR_MOVE[SCISSORS]
        end
      when SCISSORS
        case outcome
        when LOSE
          SCORE_FOR_OUTCOME[LOSE] + SCORE_FOR_MOVE[PAPER]
        when DRAW
          SCORE_FOR_OUTCOME[DRAW] + SCORE_FOR_MOVE[SCISSORS]
        when WIN
          SCORE_FOR_OUTCOME[WIN] + SCORE_FOR_MOVE[ROCK]
        end
      end
    end

    private

    def input_file
      FileManager.input_file(2022, 2)
    end
  end
end

day = Year2022::Day2.new
Printer.frame('Part 1') { day.part1 }
Printer.candycane
Printer.frame('Part 2') { day.part2 }
