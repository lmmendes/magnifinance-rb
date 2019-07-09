require 'bundler/setup'
require 'magnifinance'

require 'pry-byebug'
require 'savon/mock/spec_helper'
require 'simplecov'

require File.join('.', 'spec', 'magnifinance_helper').to_s

SimpleCov.start

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Include Savon Spec Helper
  # http://savonrb.com/version2/testing.html
  config.include Savon::SpecHelper
  config.include MagnifinanceHelper
end
