require "spec_helper"
describe Game do
  let(:formulas) { double() }
  let(:output_array){ Array.new }
  let(:output){ double() }
  let(:input){ double() }
  let(:answer){[]}
  let(:ui){ UI.new(input, output) }

  before do
    output.stub(:puts) do |message|
      output_array << message
    end
    input.stub(:gets).and_return(*answer)
    @game = Game.new(ui)
  end
  describe "when starting the game" do
    let(:answer){ ["\n"]}
    before do
      @game.start
    end
    it_behaves_like "showing the banner"
    it_behaves_like "showing a success rate of",  "-"
  end
end
