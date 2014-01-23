require "spec_helper"
describe Add  do
  include_context "constant numbers"
  subject{add}
  context "when using plain numbers" do
    let(:add){Add.new(two,three)}
    it_behaves_like "correct string output", "2 + 3"
    it_behaves_like "a correct calculator", 5
  end
  context "when using another add object as left side" do
    let(:add){Add.new(Add.new(four,five),three)}
    it_behaves_like "correct string output", "4 + 5 + 3"
    it_behaves_like "a correct calculator", 12
  end
  context "when using add objects as left and right side" do
    let(:add){Add.new(Add.new(four,five),Add.new(one,two))}
    it_behaves_like "correct string output", "4 + 5 + 1 + 2"
    it_behaves_like "a correct calculator", 12
  end
  context "when using subtract objects on the left and add on the right side" do
    let(:add){Add.new(Subtract.new(four,five),Add.new(one,two))}
    it_behaves_like "correct string output", "4 - 5 + 1 + 2"
    it_behaves_like "a correct calculator", 2
  end
  context "when using subtract objects on the left and on the right side" do
    let(:add){Add.new(Subtract.new(four,five),Subtract.new(one,two))}
    it_behaves_like "correct string output", "4 - 5 + 1 - 2"
    it_behaves_like "a correct calculator", -2
  end
  context "when using subtract objects on the left and on the right side" do
    let(:add){Add.new(Subtract.new(four,five),Subtract.new(one,two))}
    it_behaves_like "correct string output", "4 - 5 + 1 - 2"
    it_behaves_like "a correct calculator", -2
  end
end
