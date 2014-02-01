require "mathgame/version"
require "mathgame/operations/constant"
require "mathgame/operations/add"
require "mathgame/operations/subtract"
require "mathgame/operations/multiply"
require "mathgame/operations/divide"
require "mathgame/formula_generator"
require "mathgame/value_generator"
require "mathgame/sliding_window_average"
require "mathgame/ui"
require "mathgame/game"

module Mathgame
  class App
    def start
      game = Game.new
      game.start
    end
  end
end
