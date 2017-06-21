class Fixnum
  Written = {
    0 => "zero",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",

    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",

    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety",
  }

  Multiples = {
    100               => "hundred",
    1_000             => "thousand",
    1_000_000         => "million",
    1_000_000_000     => "billion",
    1_000_000_000_000 => "trillion"
  }

  def in_words
    if Written.include?(self)
      return Written[self]

    elsif self < 100
      result = Written[(self/10) * 10]
      result += " #{Written[self % 10]}"

    else
      multiples = multiple
      result = (self / multiples).in_words + " " + Multiples[multiple]
      if self % multiple != 0
        result + " " + (self % multiple).in_words

      else
        result

      end
    end
  end

  def multiple
    Multiples.keys.reverse.each do|multiple|
      return multiple if self >= multiple
    end
  end

end
