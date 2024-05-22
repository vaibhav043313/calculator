class StringCalculator
  def add(string)
    return 0 if string.empty?

    digits(string).inject { |sum, x| sum + x }
  end

  def digits(string)
    string.gsub('\n', delimiter(string)).split(delimiter(string)).map { |x| x.to_i }
  end

  def delimiter(string)
    @delimiter ||= string[0,2] == '//' ? delimiter = string[2,1] : ','
  end
end
