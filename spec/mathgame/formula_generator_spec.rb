require "spec_helper"

describe FormulaGenerator do
  let(:rand){ double() }
  let(:value_generator){ double() }
  before do
    rand.stub(:rand).and_return(1)
    value_generator.stub(:value).and_return(1)
  end
  it "expects a average formula tree height, an array of operators and an array of terminals  during instantiation" do
    expect{FormulaGenerator.new(4, [Add, Subtract, Multiply, Divide], [Constant], value_generator)}.not_to raise_exception
  end
  it "can be given a Random object" do
    expect{FormulaGenerator.new(4, [Add, Subtract, Multiply, Divide], [Constant], value_generator, Random.new(1))}.not_to raise_exception
  end

  describe "when setting height to zero" do
    let(:generator){ FormulaGenerator.new(0, [MockOperator], [MockOperand],value_generator, Random.new(1)) }
    let(:tree){ generator.tree }

    it "returns an operand" do
      expect(tree.height).to  eq 0
      expect(tree).to be_a MockOperand
      expect(tree.value).to eq 1
    end
  end
  describe "when setting height to one" do
    let(:generator){ FormulaGenerator.new(1, [MockOperator], [MockOperand],value_generator, Random.new(1)) }
    it "generates a formula with one operator" do
      expect(generator.tree.height).to  eq 1
    end
    describe "when decreasing the height under 0" do
      before { 2.times {generator.dec_height} }
      it "generates a formula with zero operators" do
        expect(generator.tree.height).to  eq 0
      end
    end
    describe "when increasing the height" do
      before { generator.inc_height }
      it "generates a formula with three operators" do
        expect(generator.tree.height).to  eq 2
      end
      describe "when decreasing the height again" do
        before { generator.dec_height }
        it "generates a formula with one operator" do
          expect(generator.tree.height).to  eq 1
        end
      end
    end
  end
  describe "when initializing with real operators" do
    let(:generator){ FormulaGenerator.new(2, [Add, Subtract, Multiply, Divide], [Constant],value_generator, Random.new(1)) }
    it "generates a real formula" do
      expect(generator.tree.to_s).to eq "(1 - 1) / (1 / 1)"
    end
  end
end

class MockOperator
  def initialize(left, right)
    @left = left
    @right = right
  end
  def height
    1 +[@left.height, @right.height].max
  end
end

class MockOperand
  def initialize(value)
    @value = value
  end
  def value
    @value
  end
  def height
    0
  end
end
