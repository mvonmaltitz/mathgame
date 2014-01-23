require "spec_helper"
describe Subtract  do
  subject{subtract}
  include_context "constant numbers"
  context "when using plain numbers" do
    let(:subtract){Subtract.new(two,three)}
    describe "#to_s" do
      it "shows a correct string representation of x - y" do
        expect(subject.to_s).to eq "2 - 3"
      end
    end
    it_behaves_like "a correct calculator", -1
  end
  context "when using another subtract object as left side" do
    let(:subtract){Subtract.new(Subtract.new(four,five),three)}
    describe "#to_s" do
      it "shows a correct string representation of x - y - z" do
        expect(subject.to_s).to eq "4 - 5 - 3"
      end
    end
    it_behaves_like "a correct calculator", -4
  end
  context "when using another subtract object as right side" do
    let(:subtract){Subtract.new(three, Subtract.new(four,five))}
    describe "#to_s" do
      it "shows a correct string representation of x - (y - z)" do
        expect(subject.to_s).to eq "3 - (4 - 5)"
      end
    end
    it_behaves_like "a correct calculator", 4
  end
  context "when using subtract objects as left and right side" do
    let(:subtract){Subtract.new(Subtract.new(four,five),Subtract.new(one,two))}
    describe "#to_s" do
      it "shows a correct string representation of w - x - (y - z)" do
        expect(subject.to_s).to eq "4 - 5 - (1 - 2)"
      end
    end
    it_behaves_like "a correct calculator", 0
  end
  context "when using add objects as left and right side" do
    let(:subtract){Subtract.new(Add.new(four,five),Add.new(one,two))}
    describe "#to_s" do
      it "shows a correct string representation of w + x - (y + z)" do
        expect(subject.to_s).to eq "4 + 5 - (1 + 2)"
      end
    end
    it_behaves_like "a correct calculator", 6
  end
end
