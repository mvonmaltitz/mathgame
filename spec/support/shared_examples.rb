shared_context "constant numbers" do
  let(:one){ Constant.new(1) }
  let(:two){ Constant.new(2) }
  let(:three){ Constant.new(3) }
  let(:four){ Constant.new(4) }
  let(:five){ Constant.new(5) }
end
shared_examples_for "correct string output" do |output|
  it "shows a correct string representation of #{output}" do
    expect(subject.to_s).to eq output
  end
end

shared_examples_for "a correct calculator" do |result|
  it "returns the correct result" do
    expect(subject.result).to be_within(0.01).of result
  end
end
shared_examples_for "showing the banner" do
  it "shows '## Mathgame ##'" do
    expect(output_array).to have_output /## Mathgame ##/
  end
end
shared_examples_for "showing a success rate of" do |percentage, overall_percentage|
  it "shows 'success rate: #{percentage}'" do
    expect(output_array).to have_output /success rate: #{percentage}/
  end
  it "shows '(overall: #{overall_percentage})'" do
    if overall_percentage
      expect(output_array).to have_output /\(overall: #{overall_percentage}\)/
    end
  end
end
shared_examples_for "showing a positive feedback to the last answer" do
  specify{expect(output_array).to have_output /Correct!/}
end
shared_examples_for "showing a negative feedback to the last answer" do |answer, result|
  specify{expect(output_array).to have_output /#{answer} was incorrect, #{result} would have been correct/}
end

shared_examples_for "deleting the previous output" do
  it "clearing the screen" do
    pending "look up how to escape in regex" do
      output_array.pop
      expect(output_array).to have_output /#{UI::CLEAR_SCREEN_COMMAND}/
    end
  end
end
