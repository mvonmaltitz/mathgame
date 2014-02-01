require "spec_helper"
describe SlidingWindowAverage do
  let(:limit){ 10 }

  subject{SlidingWindowAverage.new(limit)}
  it "receives a default length during instantiation" do
    expect{SlidingWindowAverage.new(4)}.not_to raise_exception
  end
  it {should respond_to(:hit)}
  it {should respond_to(:miss)}
  it {should respond_to(:current_average)}
  it {should respond_to(:avg)}

  describe "having one hit" do
    before { subject.hit }
    it "leads to 100%" do
      expect(subject.avg).to eq 1
    end
  end
  describe "having two hits" do
    before {2.times{subject.hit}}
    it "leads to 100%" do
      expect(subject.avg).to eq 1
    end
  end
  describe "having one miss" do
    before {1.times{subject.miss}}
    it "leads to 0%" do
      expect(subject.avg).to eq 0
    end
  end
  describe "having two misses" do
    before {2.times{subject.miss}}
    it "leads to 0%" do
      expect(subject.avg).to eq 0
    end
  end
  describe "having a hit and a miss" do
    before do
      subject.hit
      subject.miss
    end
    it "leads to 50%" do
      expect(subject.avg).to eq 0.5
    end
  end
  describe "having two hits and a miss" do
    before do
      subject.hit
      subject.hit
      subject.miss
    end
    it "leads to 66%" do
      expect(subject.avg).to be_within(0.001).of(0.666)
    end
  end
  describe "when exceeding the limit defined during instantiation" do
    describe "having #limit times hits and one miss" do
      before do
        limit.times do
          subject.hit
        end
        subject.miss
      end
      it "leads to 90%" do
        expect(subject.avg).to eq 0.9
        expect(subject.overall_avg).to eq limit.to_f/(limit+1)
      end
      describe "when adding more misses" do
        it "degrades the avg by 10% each" do
          result = 9
          sum = limit
          count = limit + 1
          9.times do
            subject.miss
            result -= 1
            count += 1
            expect(subject.avg).to eq result.to_f/10
            expect(subject.overall_avg).to eq sum.to_f / count
          end
        end
      end
    end
  end
end
