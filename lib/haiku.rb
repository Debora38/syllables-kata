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
      line_syllables -= diphthong(word)
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

  def diphthong(word)
    previous_letter = 'x'
    count = 0
    letters(word).each do |letter|
      count += 1 if previous_letter == 'i' && ["e"].include?(letter)
      count += 1 if previous_letter == 'a' && ["u", "y", "i", "e"].include?(letter)
      count += 1 if previous_letter == 'e' && ["a", "e", "y", "i"].include?(letter)
      count += 1 if previous_letter == 'o' && ["i", "o", "u", "e", "y", "a"].include?(letter)
      count += 1 if previous_letter == 'u' && ["e", "i", "y"].include?(letter)
      previous_letter = letter
    end
    return count
  end

  def vowel?(letter)
    ["a", "e", "i", "o", "u"].include?(letter)
  end
end
