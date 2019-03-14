require 'haiku'

RSpec.describe Haiku do
  context '#haiku' do
    it "should return true for a haiku 5-7-5 pattern in one-syllabus words" do
      expect(subject.haiku?("the the the the the,\nthe the the the the the the,\nthe the the the the")).to eq true
    end
  end
end
