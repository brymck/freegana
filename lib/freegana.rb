# coding: utf-8
require_relative "freegana/version"

module Freegana
  class << self
    HIRAGANA_START = 12353
    KATAKANA_START = 12449
    ROMAJI_EQUIVALENTS = [
      "xa",  "a",
      "xi",  "i",
      "xu",  "u",
      "xe",  "e",
      "xo",  "o",
      "ka", "ga",
      "ki", "gi",
      "ku", "gu",
      "ke", "ge",
      "ko", "go",
      "sa", "za",
      "si", "zi",
      "su", "zu",
      "se", "ze",
      "so", "zo",
      "ta", "da",
      "ti", "di",
      "xtu",
      "tu", "du",
      "te", "de",
      "to", "do",
      "na",
      "ni",
      "nu",
      "ne",
      "no",
      "ha", "ba", "pa",
      "hi", "bi", "pi",
      "hu", "bu", "pu",
      "he", "be", "pe",
      "ho", "bo", "po",
      "ma",
      "mi",
      "mu",
      "me",
      "mo",
      "xya", "ya",
      "xyu", "yu",
      "xyo", "yo",
      "ra",
      "ri",
      "ru",
      "re",
      "ro",
      "xwa",
      "wa",
      "wi",
      "we",
      "wo",
      "n'",
      "vu"
    ]
    HIRAGANA_END = HIRAGANA_START + ROMAJI_EQUIVALENTS.length - 1
    KATAKANA_END = KATAKANA_START + ROMAJI_EQUIVALENTS.length - 1

    def romanize(word)
      result = ""
      word.each_char do |char|
        result += convert_char(char)
      end
      puts hepburn(result)
    end

    private
    
    def convert_char(char)
      ord = char.ord
      if    ord >= HIRAGANA_START && ord <= HIRAGANA_END
        ROMAJI_EQUIVALENTS[ord - HIRAGANA_START]
      elsif ord >= KATAKANA_START && ord <= KATAKANA_END
        ROMAJI_EQUIVALENTS[ord - KATAKANA_START]
      else
        char
      end
    end

    def hepburn(word)
      word.gsub(/aa/,  "ā")
          .gsub(/iii/, "ī")
          .gsub(/uu/,  "ū")
          .gsub(/ee/,  "ē")
          .gsub(/o[ou]/,  "ō")
          .gsub(/si/, "shi")
          .gsub(/[zd]i/, "ji")
          .gsub(/ti/, "chi")
          .gsub(/tu/,  "tsu")
          .gsub(/du/, "zu")
          .gsub(/hu/, "fu")
          .gsub(/wo/, "o")
          .gsub(/\'(?![aeiouy])/, "")
    end
  end
end
