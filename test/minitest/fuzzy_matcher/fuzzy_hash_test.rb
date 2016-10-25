# encoding: UTF-8

require 'minitest/autorun'
require_relative '../test_helper.rb'
require 'fuzzy_matcher'

module FuzzyMatcher
# rubocop:disable Style/IndentationWidth
class TestFuzzyHash < Minitest::Test # rubocop:enable Style/IndentationWidth
  def test_version
    normal_hash = {'foo' => 1, 'food' => 2, 'good' => 3}
    fuzzy_hash = FuzzyHash[normal_hash]

    normal_hash.each do |key, val|
      assert_equal val, fuzzy_hash.fuzzy_key_lookup(key).last
    end
  end
end
end
