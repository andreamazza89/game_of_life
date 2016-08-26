require 'coveralls'
Coveralls.wear!

require_relative '../lib/grid'
require_relative '../lib/cell'
require_relative '../lib/rule_two'
require_relative '../lib/rule_four'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
end
