require 'fuzzystringmatch'
require 'fuzzy_matcher/hash'

module FuzzyMatcher
  def self.case_insensitive_str_fuzzy_match?(str1, str2, tolerance=0.85)
    str_fuzzy_match?(nonascii_downcase(str1), nonascii_downcase(str2), tolerance)
  end

  # They're the same if you squint
  def self.str_fuzzy_match?(str1, str2, tolerance=0.85)
    similarity = str_similarity(str1, str2)
    similarity >= tolerance
  end

  def self.str_similarity(str1, str2)
    stripped_str1 = strip_diacritics(str1)
    stripped_str2 = strip_diacritics(str2)

    similarity = fuzzy_matcher.getDistance(stripped_str1, stripped_str2)
    similarity
  end

  def self.fuzzy_matcher
    @@jarow ||= FuzzyStringMatch::JaroWinkler.create(:pure)
  end

  # http://stackoverflow.com/questions/39408402/in-ruby-how-to-convert-special-characters-like-%C3%AB-%C3%A0-%C3%A9-%C3%A4-all-to-e-a-e-a
  # https://ruby-doc.org/stdlib-2.2.2/libdoc/unicode_normalize/rdoc/String.html#method-i-unicode_normalize
  # Ruby 2.2+
  def self.strip_diacritics(str)
    str.unicode_normalize(:nfkd).encode('ASCII', replace: '')
  end

  def self.nonascii_downcase(str)
    str.unicode_normalize(:nfkd).downcase
  end
end
