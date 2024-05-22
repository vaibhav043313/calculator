class StringCalculator
  def add(string)
    return 0 if string.empty?
    raise_if_negatives_present(string)

    digits(string).inject { |sum, x| sum + x }
  end

  def raise_if_negatives_present(string)
    raise "Negative numbers not allowed: #{negatives(string).join(', ')}" if negatives(string).any?
  end

  def negatives(string)
    @negatives ||= digits(string).select { |x| x<0 }
  end

  def digits(string)
    string.gsub('\n', delimiter(string)).split(delimiter(string)).map { |x| x.to_i }
  end

  def delimiter(string)
    @delimiter ||= string[0,2] == '//' ? delimiter = string[2,1] : ','
  end
end
