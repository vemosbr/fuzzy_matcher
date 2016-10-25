# encoding: UTF-8

# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exists?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

# This group allows to skip running RuboCop when RSpec failed.
group :red_green_refactor, halt_on_fail: true do
  guard :minitest do
    # with Minitest::Unit
    watch(%r{^app/(.+)\.rb$}) { |m| "test/minitest/#{m[1]}_test.rb" }
    watch(%r{^test/minitest/.+_test\.rb$})
    # watch(%r{^lib/(.*/)?([^/]+)\.rb$}) { |m| "test/minitest/#{m[1]}test_#{m[2]}.rb" }
    watch(%r{^lib/(.+)\.rb$}) { |m| "test/minitest/#{m[1]}_test.rb" }
    watch(%r{^test/minitest/test_helper\.rb$}) { 'test' }

    # with Minitest::Spec
    # watch(%r{^spec/(.*)_spec\.rb$})
    # watch(%r{^lib/(.+)\.rb$})         { |m| "spec/#{m[1]}_spec.rb" }
    # watch(%r{^spec/spec_helper\.rb$}) { 'spec' }
  end

  guard :rubocop, all_on_start: true, keep_failed: false, notification: :failed do
    watch(%r{^lib/.+\.rb$})
    watch(%r{^test/.+\.rb$})
    watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
  end
end

guard :bundler do
  require 'guard/bundler'
  require 'guard/bundler/verify'
  helper = Guard::Bundler::Verify.new

  files = ['Gemfile']
  files += Dir['*.gemspec'] if files.any? { |f| helper.uses_gemspec?(f) }

  # Assume files are symlinked from somewhere
  files.each { |file| watch(helper.real_path(file)) }
end
