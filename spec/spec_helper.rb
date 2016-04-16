
ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../spec/dummy/config/environment.rb', __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path('../../spec/dummy/db/migrate', __FILE__)]

require 'tila'
require 'rails/all'
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.order = :random
end

# # Configure Rails Environment

# require "rails/test_help"

# # Filter out Minitest backtrace while allowing backtrace from other libraries
# # to be shown.
# Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# # Load support files
# Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# # Load fixtures from the engine
# if ActiveSupport::TestCase.respond_to?(:fixture_path=)
#   ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
#   ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
#   ActiveSupport::TestCase.fixtures :all
# end
