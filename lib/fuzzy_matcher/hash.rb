module FuzzyMatcher
  class FuzzyHash < Hash
    attr_accessor :tolerance

    def self.[](*args)
      hash = super(*args)
      me = self.new
      hash.each do |key, val|
        me[key] = val
      end
      me
    end

    def initialize(*args)
      super *args
      @tolerance = 0.85
    end

    def fuzzy_key_lookup(str, tolerance=nil)
      exact_match(str) || caseinsensitive_match(str) || fuzzy_match(str, tolerance)
    end

    def exact_match(str)
      self.find { |key, _| key.to_s == str }
    end

    def caseinsensitive_match(str)
      self.find { |key, _| FuzzyMatcher.nonascii_downcase(key.to_s) == FuzzyMatcher.nonascii_downcase(str) }
    end

    def fuzzy_match(str, oneoff_tolerance=nil)
      return nil if self.empty?

      with_sims = self.to_a.map { |key, val| [key, val, FuzzyMatcher.str_similarity(FuzzyMatcher.nonascii_downcase(key.to_s), FuzzyMatcher.nonascii_downcase(str))] }
      with_sims.sort_by!(&:last)
      key, match, max_sim = *with_sims.last
      limit = oneoff_tolerance || tolerance
      found = limit ? max_sim >= limit : true
      if found
        [key, match]
      else
        nil
      end
    end
  end
end
