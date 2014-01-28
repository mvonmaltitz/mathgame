require "spec_helper"
describe UI do

  let(:output){ double() }
  let(:input){ double() }

  it "should accept two parameters during instantiation" do
    expect{UI.new(input, output)}.not_to raise_exception
  end
  describe "input and output" do
    let(:ui){ UI.new(input, output) }
    it "puts on the output when data is given" do
      output.should_receive(:puts)
      ui.write_message("test_message")
    end
    it "reads a line without newline character" do
      input.should_receive(:gets).and_return("Message\n")
      expect(ui.get_answer).to eq "Message"
    end
    it "is able clear the screen" do
      output.should_receive(:puts).with("\e[H\e[2J")
      ui.clear_screen
    end
  end
end
