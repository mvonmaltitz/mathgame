require "spec_helper"
describe Divide  do
  subject{divide}
  include_context "constant numbers"
  context "when using plain numbers" do
    let(:divide){Divide.new(two,three)}
    it_behaves_like "correct string output", "2 / 3"
    it_behaves_like "a correct calculator", 0.666
  end
  context "when using another subtract object as left side" do
    let(:divide){Divide.new(Divide.new(four,five),three)}
    it_behaves_like "correct string output", "4 / 5 / 3"
    it_behaves_like "a correct calculator", 0.266
  end
  context "when using another subtract object as right side" do
    let(:divide){Divide.new(three, Divide.new(four,five))}
    it_behaves_like "correct string output", "3 / (4 / 5)"
    it_behaves_like "a correct calculator", 3.75
  end
  context "when using subtract objects as left and right side" do
    let(:divide){Divide.new(Divide.new(four,five),Divide.new(one,two))}
    it_behaves_like "correct string output", "4 / 5 / (1 / 2)"
    it_behaves_like "a correct calculator", 1.6
  end
  context "when using add objects as left and right side" do
    let(:divide){Divide.new(Add.new(four,five),Add.new(one,two))}
    it_behaves_like "correct string output", "(4 + 5) / (1 + 2)"
    it_behaves_like "a correct calculator", 3
  end
  context "when using a add operator in the middle" do
    let(:divide){Divide.new(Divide.new(three, Add.new(four,five)), four)}
    it_behaves_like "correct string output", "3 / (4 + 5) / 4"
    it_behaves_like "a correct calculator", 0.083
  end
end
