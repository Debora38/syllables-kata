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
      line_syllables += nb_syllables_word(word)
      line_syllables -= 1 if final_e(word)
    end
    line_syllables
  end

  def nb_syllables_word(word)
    word.scan(/[aeiou]/).count
  end

  def final_e(word)
    (last_letter(word) == 'e') && (nb_syllables_word(word) > 1)
  end

  def last_letter(word)
    return word.split("")[-2] if word.split("").last == ","
    return word.split("").last
  end
end
