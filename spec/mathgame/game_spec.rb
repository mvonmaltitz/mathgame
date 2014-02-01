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
    performance_measure = SlidingWindowAverage.new(10)
    tree = double()
    tree.stub(:to_s).and_return("1 + 1")
    tree.stub(:result).and_return(2)
    formulas.stub(:tree).and_return(tree)
    @game = Game.new(ui, formulas, performance_measure)
  end
  it "needs one value for instantiation" do
    expect{Game.new(ui)}.not_to raise_exception
  end
  it "be instantiated with defaults" do
    pending "define stdin and stdout" do
      expect{Game.new}.not_to raise_exception
    end
  end
  describe "when starting the game" do
    let(:answer){ ["\n"]}
    before do
      @game.start
    end
    it_behaves_like "showing the banner"
    it_behaves_like "showing a success rate of",  "-"
    it "shows a formula to solve" do
      expect(output_array).to have_output /# 1 \+ 1 =/
    end
  end
  describe "when giving an input" do
    context "which is correct" do
      let(:answer){["2\n", "\n"]}
      before do
        formulas.should_receive(:increase_value_complexity).twice
        @game.start
      end
      it_behaves_like "showing the banner"
      it_behaves_like "showing a success rate of",  "100.0%", "100.0%"
      it_behaves_like "showing a positive feedback to the last answer"
      it_behaves_like "deleting the previous output"
    end
    context "which is incorrect" do
      let(:answer){["3\n", "\n"]}
      before do
        formulas.should_receive(:decrease_value_complexity).twice
        @game.start
      end
      it_behaves_like "showing the banner"
      it_behaves_like "showing a success rate of",  "0.0%", "0.0%"
      it_behaves_like "showing a negative feedback to the last answer", 3, 2
      it_behaves_like "deleting the previous output"
    end
    context "playing some more steps" do
      let(:answer){["2\n","3\n","2\n", "3\n", "3\n","2\n","3\n","2\n", "3\n", "3\n","3\n","2\n", "3\n", "3\n", "\n"]}
      before do
        formulas.should_receive(:increase_value_complexity).twice
        formulas.should_receive(:decrease_value_complexity).exactly(3)
        @game.start
      end
      it_behaves_like "showing the banner"
      it_behaves_like "showing a success rate of",  "30.0%", "35.714285714285715%"
      it_behaves_like "showing a negative feedback to the last answer", 3, 2
      it_behaves_like "deleting the previous output"
    end
  end
end
