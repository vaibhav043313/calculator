class StringCalculator
  def add(string)
    return 0 if string.empty?

    digits(string).inject { |sum, x| sum + x }
  end

  def digits(string)
    string.gsub('\n', delimiter).split(delimiter).map { |x| x.to_i }
  end

  def delimiter
    ','
  end
end
