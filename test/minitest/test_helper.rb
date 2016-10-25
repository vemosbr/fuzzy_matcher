$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'fuzzy_matcher'

require 'minitest/autorun'
require 'minitest/hell'

require 'faker'
require 'byebug'

module Minitest
  class Test
    # Add global test code here
    Faker::Config.locale = 'pt-BR'

    @@test_defaults_loaded = true # rubocop:disable Style/ClassVars
  end
end
