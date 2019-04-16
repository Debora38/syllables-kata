class Haiku

  def haiku?(string)
    analyser(string) == [5, 7, 5] ? true : false
  end

  def analyser(string)
    result = []
    string.split("\n").each do |line|
      result << nb_syllables(words(line))
    end
    result
  end

  def words(line)
    line.split.each { |word| word.gsub!(",", "") }
  end

  def nb_syllables(words)
    line_syllables = 0
    words.each do |word|
      line_syllables += nb_syllables_word(word)
      line_syllables -= vowel_groups(word)
      line_syllables -= 1 if final_e(word)
    end
    line_syllables
  end

  def nb_syllables_word(word)
    word.scan(/[aeiouy]/).count
  end

  def final_e(word)
    (letters(word).last == 'e') &&
    !vowel?(letters(word)[-2]) &&
    (nb_syllables_word(word) > 1)
  end

  def letters(word)
    word.split("")
  end

  def vowel_groups(word)
    previous_is_vowel = false
    groups_of_vowels = 0
    letters(word).each do |letter|
      groups_of_vowels += 1 if vowel?(letter) && previous_is_vowel
      previous_is_vowel = true if vowel?(letter)
      previous_is_vowel = false if !vowel?(letter)
    end
    return groups_of_vowels
  end

  def vowel?(letter)
    ["a", "e", "i", "o", "u", "y"].include?(letter)
  end
end
