shared_context "constant numbers" do
  let(:one){ Constant.new(1) }
  let(:two){ Constant.new(2) }
  let(:three){ Constant.new(3) }
  let(:four){ Constant.new(4) }
  let(:five){ Constant.new(5) }
end
shared_examples_for "a correct calculator" do |result|
  it "returns the correct result" do
    expect(subject.result).to eq result
  end
end
