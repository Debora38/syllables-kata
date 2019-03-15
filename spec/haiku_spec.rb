require 'haiku'

RSpec.describe Haiku do
  context '#haiku' do
    it "should return true for a haiku 5-7-5 pattern in one-syllabus words" do
      expect(subject.haiku?("the the the the the,\nthe the the the the the the,\nthe the the the the")).to eq true
    end

    it "should return false for a string not in 5-7-5 syllables pattern" do
      expect(subject.haiku?("the the,\nthe the the the,\nthe")).to eq false
    end

    it 'should return true for a string 5-7-5 in 1 or 2 syllabus words' do
      expect(subject.haiku?("the kata kata,\nthe kata kata kata,\nthe kata kata")).to eq true
    end
  end
end
