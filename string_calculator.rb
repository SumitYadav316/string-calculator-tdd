class StringCalculator

  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter, numbers = numbers[2..].split("\n", 2)
      numbers = numbers.split(delimiter)
    else
      numbers = numbers.split(/,|\n/)
    end

    negatives = numbers.map(&:to_i).select(&:negative?)
    raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    numbers.map(&:to_i).sum
  end

end