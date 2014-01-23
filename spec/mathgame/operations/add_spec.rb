require "spec_helper"
shared_examples_for "a correct calculator" do |result|
  it "returns the correct result" do
    expect(subject.result).to eq result
  end
end
describe Add  do
  subject{add}
  context "when using plain numbers" do
    let(:add){Add.new(2,3)}
    describe "#to_s" do
      it "shows a correct string representation of x + y" do
        expect(add.to_s).to eq "2 + 3"
      end
    end
    it_behaves_like "a correct calculator", 5
  end
  context "when using another add object as left side" do
    let(:add){Add.new(Add.new(4,5),3)}
    describe "#to_s" do
      it "shows a correct string representation of x + y + z" do
        expect(add.to_s).to eq "4 + 5 + 3"
      end
    end
    it_behaves_like "a correct calculator", 12
  end
  context "when using add objects as left and right side" do
    let(:add){Add.new(Add.new(4,5),Add.new(1,2))}
    describe "#to_s" do
      it "shows a correct string representation of w + x + y + z" do
        expect(add.to_s).to eq "4 + 5 + 1 + 2"
      end
    end
    it_behaves_like "a correct calculator", 12
  end
end
