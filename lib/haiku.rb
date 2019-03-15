class Haiku

  def haiku?(string)
    calculation(string) == [5, 7, 5] ? true : false
  end

  def calculation(string)
    result = []
    string.split("\n").each do |line|
      result << nb_syllables(words(line))
    end
    result
  end

  def words(line)
    line.split
  end

  def nb_syllables(words)
    line_syllables = 0
    words.each do |word|
      line_syllables += word.scan(/[aeiou]/).count
    end
    line_syllables
  end
end
