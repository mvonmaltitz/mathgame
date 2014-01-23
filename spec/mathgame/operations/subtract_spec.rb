require "spec_helper"
describe Subtract  do
  subject{subtract}
  include_context "constant numbers"
  context "when using plain numbers" do
    let(:subtract){Subtract.new(two,three)}
    it_behaves_like "correct string output", "2 - 3"
    it_behaves_like "a correct calculator", -1
  end
  context "when using another subtract object as left side" do
    let(:subtract){Subtract.new(Subtract.new(four,five),three)}
    it_behaves_like "correct string output", "4 - 5 - 3"
    it_behaves_like "a correct calculator", -4
  end
  context "when using another subtract object as right side" do
    let(:subtract){Subtract.new(three, Subtract.new(four,five))}
    it_behaves_like "correct string output", "3 - (4 - 5)"
    it_behaves_like "a correct calculator", 4
  end
  context "when using subtract objects as left and right side" do
    let(:subtract){Subtract.new(Subtract.new(four,five),Subtract.new(one,two))}
    it_behaves_like "correct string output", "4 - 5 - (1 - 2)"
    it_behaves_like "a correct calculator", 0
  end
  context "when using add objects as left and right side" do
    let(:subtract){Subtract.new(Add.new(four,five),Add.new(one,two))}
    it_behaves_like "correct string output", "4 + 5 - (1 + 2)"
    it_behaves_like "a correct calculator", 6
  end
end
