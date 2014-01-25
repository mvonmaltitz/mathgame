require "spec_helper"
describe ValueGenerator do

  shared_examples_for "having the correct range" do |lower, upper|
    let(:numbers){ 100.times.map{generator.value} }
    it "includes the lower limit itself" do
      expect(numbers).to include(lower)
    end
    it "includes the upper limit itself" do
      expect(numbers).to include(upper)
    end
    it "generates only values between both limits" do
      numbers.each do |num|
        expect(num).to  be_between(lower,upper)
      end
    end
  end
  it "needs two values for instantiation" do
    expect{ValueGenerator.new(1,2)}.not_to raise_exception
  end
  it "can be given a Random object" do
    expect{ValueGenerator.new(1,2, Random.new(1))}.not_to raise_exception
  end
  it "raises an exception when the limits are invalid" do
    expect{ValueGenerator.new(4,2)}.to raise_exception
  end
  describe "having a number generator between 1 and 2" do
    let(:low){ 1 }
    let(:high){ 4 }
    let(:generator){ ValueGenerator.new(low,high, Random.new(1))} #examples depend on seed
    it "does not always generate the same numbers" do
      numbers = 10.times.map{generator.value}
      expect(numbers.uniq).not_to be_one
    end
    it_behaves_like "having the correct range", 1,4
    it "has a method to increase the upper and the lower limit" do
      expect{generator.inc_upper}.not_to raise_error
      expect{generator.inc_lower}.not_to raise_error
    end
    it "has a method to decrease the upper and the lower limit" do
      expect{generator.dec_upper}.not_to raise_error
      expect{generator.dec_lower}.not_to raise_error
    end
    describe "changing the limits" do
      context "moving everything up" do
        before do
          3.times { generator.inc_upper }
          3.times { generator.inc_lower }
        end
        it_behaves_like "having the correct range", 4,7
      end
      context "moving everything up" do
        before do
          3.times { generator.dec_upper }
          3.times { generator.dec_lower }
        end
        it_behaves_like "having the correct range", -2,1
      end
    end
    describe "error cases" do
      describe "trying to move the upper border under the lower border" do
        before { 4.times{generator.dec_upper} }
        it_behaves_like "having the correct range", 1,1
      end
      describe "trying to move the lower border over the upper border" do
        before { 4.times{generator.inc_lower} }
        it_behaves_like "having the correct range", 4,4
      end
    end
  end
end
