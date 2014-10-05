require 'spec_helper'

describe Redacted do
  subject { Redacted::Redact }
  let(:input) { "UFOs stole all of Canada's maple syrup." }

  describe '#text' do
    let(:output) { subject.text(input) }

    it "should create a redacted string of the same length" do
      expect(output.length).to be(input.length)
    end

    it "redacts the string with utf-8 blocks" do
      expect(output).to eq("\u2588" * input.length)
    end
  end

  describe '#html' do
    let(:output) { subject.html(input) }

    it "should create a redacted string with html characters" do
      html_decoded_string = CGI.unescapeHTML(output)
      expect(html_decoded_string).to eq(subject.text(input))
    end
  end
end
