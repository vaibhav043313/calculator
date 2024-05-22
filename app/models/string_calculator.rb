class StringCalculator
  def add(string)
    return 0 if string.empty?
    return string.to_i unless string.include?(',')

    digit = string.split(',').map { |x| x.to_i }
    digit[0] + digit[1]
  end
end
