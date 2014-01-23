require "spec_helper"
describe Constant do
  subject{constant}
  context "when using plain numbers" do
    let(:constant){Constant.new(2)}
    describe "#to_s" do
      it "shows the number as string" do
        expect(constant.to_s).to eq "2"
      end
    end
    it_behaves_like "a correct calculator", 2
  end
  context "when using another plain numbers" do
    let(:constant){Constant.new(6)}
    describe "#to_s" do
      it "shows the number as string" do
        expect(constant.to_s).to eq "6"
      end
    end
    it_behaves_like "a correct calculator", 6
  end
end

