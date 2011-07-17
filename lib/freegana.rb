require_relative "freegana/version"

module Freegana
  class << self
    VOWELS = ["a", "i", "u", "e", "o"]
    CONSONANTS = ["x", "", "k", "g", "s", "z", "t", "d", "n", "h", "b", "p", "m", "r", "y", "w"]

    def romanize(word)
      result = ""
      word.each_char do |char|
        result += convert_char(char)
      end
      result
    end

    private
    
    def convert_char(char)
      ord = char.ord
      if ord >= 12353 && ord <= 16000
        if ord == 12387
          return "xtsu"
        elsif ord > 12387
          ord -= 1
        end
        ord -= 12353

        # Note: This is all integer math, so it rounds down
        puts ord
        if ord < 40
          vowel_index = (ord % 10) / 2
          consonant_index = 2 * (ord / 10) + (ord.odd? ? 1 : 0)
        elsif ord < 45
          vowel_index = ord % 5
          consonant_index = 8
        elsif ord < 60
          vowel_index = (ord - 45) / 3
          consonant_index = 9 + (ord % 3)
        elsif ord < 70
          vowel_index = ord % 5
          consonant_index = 12 + (ord - 60) / 2
        else
          vowel_index = 0
          consonant_index = 0
        end

        CONSONANTS[consonant_index] + VOWELS[vowel_index]
      else
        char
      end
    end
  end
end
