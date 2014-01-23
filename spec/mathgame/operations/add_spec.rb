require "spec_helper"
describe Add  do
  include_context "constant numbers"
  subject{add}
  context "when using plain numbers" do
    let(:add){Add.new(two,three)}
    describe "#to_s" do
      it "shows a correct string representation of x + y" do
        expect(subject.to_s).to eq "2 + 3"
      end
    end
    it_behaves_like "a correct calculator", 5
  end
  context "when using another add object as left side" do
    let(:add){Add.new(Add.new(four,five),three)}
    describe "#to_s" do
      it "shows a correct string representation of x + y + z" do
        expect(subject.to_s).to eq "4 + 5 + 3"
      end
    end
    it_behaves_like "a correct calculator", 12
  end
  context "when using add objects as left and right side" do
    let(:add){Add.new(Add.new(four,five),Add.new(one,two))}
    describe "#to_s" do
      it "shows a correct string representation of w + x + y + z" do
        expect(subject.to_s).to eq "4 + 5 + 1 + 2"
      end
    end
    it_behaves_like "a correct calculator", 12
  end
  context "when using subtract objects on the left and add on the right side" do
    let(:add){Add.new(Subtract.new(four,five),Add.new(one,two))}
    describe "#to_s" do
      it "shows a correct string representation of w - x + y + z" do
        expect(subject.to_s).to eq "4 - 5 + 1 + 2"
      end
    end
    it_behaves_like "a correct calculator", 2
  end
  context "when using subtract objects on the left and on the right side" do
    let(:add){Add.new(Subtract.new(four,five),Subtract.new(one,two))}
    describe "#to_s" do
      it "shows a correct string representation of w - x + y - z" do
        expect(subject.to_s).to eq "4 - 5 + 1 - 2"
      end
    end
    it_behaves_like "a correct calculator", -2
  end
end
