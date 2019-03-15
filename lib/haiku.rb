class Haiku

  def haiku?(string)
    calculation(string) == [5, 7, 5] ? true : false
  end

  def calculation(string)
    result = []
    string.split("\n").each do |line|
      result << line.split.length
    end
    result
  end
end
