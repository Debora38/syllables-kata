class Haiku

  def haiku?(string)
    analyser(string) == [5, 7, 5] ? true : false
  end

  def analyser(string)
    sylables_per_line = []
    string.downcase.split("\n").each do |line|
      sylables_per_line << nb_syllables(words(line))
    end
    sylables_per_line
  end

  def nb_syllables(words)
    line_syllables = 0
    words.each do |word|
      line_syllables += vowels_in_word(word)
      line_syllables -= vowel_groups(word)
      line_syllables -= 1 if final_e(word)
    end
    line_syllables
  end

  def vowels_in_word(word)
    word.scan(/[aeiouy]/).count
  end

  def final_e(word)
    (letters(word).last == 'e') &&
    !vowel?(letters(word)[-2]) &&
    (vowels_in_word(word) > 1)
  end

  def words(line)
    line.split.each { |word| word.gsub!(",", "") }
  end

  def letters(word)
    word.split("")
  end

  def vowel_groups(word)
    previous_letter = 'x'
    groups_of_vowels = 0
    letters(word).each do |letter|
      groups_of_vowels += 1 if vowel?(letter) && vowel?(previous_letter)
      groups_of_vowels -= 1 if letter == 'o' && previous_letter == 'e'
      previous_letter = letter
    end
    return groups_of_vowels
  end

  def vowel?(letter)
    ["a", "e", "i", "o", "u", "y"].include?(letter)
  end
end
