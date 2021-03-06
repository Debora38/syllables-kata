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

    it "should not count the e at the end of a word unless it's one syllables word like 'the' or 'age'" do
      expect(subject.haiku?("restore the degree,\nalive like the cat eye age,\nblue concrete bride be")).to eq true
    end

    it "should take in consideration groups of vowels as one syllable" do
      string = "alive blue degree,\nsqueeze that cool sprout like cat eye,\nhonest can restore"
      expect(subject.haiku?(string)).to eq true
    end

    it "should take the pair of vowels e+o as 2 syllables" do
      string = "alive blue neon,\nsqueeze that leo like cat eye,\ncool geography"
      expect(subject.haiku?(string)).to eq true
    end
  end
end
