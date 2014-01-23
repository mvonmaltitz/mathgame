require "spec_helper"
describe Multiply  do
  include_context "constant numbers"
  subject{multiply}
  context "when using plain numbers" do
    let(:multiply){Multiply.new(two,three)}
    it_behaves_like "correct string output", "2 * 3"
    it_behaves_like "a correct calculator", 6
  end
  context "when using another add object as left side" do
    let(:multiply){Multiply.new(Multiply.new(four,five),three)}
    it_behaves_like "correct string output", "4 * 5 * 3"
    it_behaves_like "a correct calculator", 60
  end
  context "when using add objects as left and right side" do
    let(:multiply){Multiply.new(Add.new(four,five),Multiply.new(one,two))}
    it_behaves_like "correct string output", "(4 + 5) * 1 * 2"
    it_behaves_like "a correct calculator", 18
  end
  context "when using subtract objects on the left and add on the right side" do
    let(:multiply){Multiply.new(Subtract.new(four,five),Add.new(one,two))}
    it_behaves_like "correct string output", "(4 - 5) * (1 + 2)"
    it_behaves_like "a correct calculator", -3
  end
  context "when using subtract objects on the left and on the right side" do
    let(:multiply){Multiply.new(Subtract.new(four,five),Subtract.new(one,two))}
    it_behaves_like "correct string output", "(4 - 5) * (1 - 2)"
    it_behaves_like "a correct calculator", 1
  end
end
