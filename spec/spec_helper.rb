require File.expand_path('../../lib/activerecord-uuid.rb', __FILE__)
require File.expand_path('../support/schema.rb', __FILE__)
require File.expand_path('../support/models.rb', __FILE__)

RSpec.configure do |config|
  config.before(:suite) do
    puts '=' * 80
    puts "Running specs against Active Record #{ActiveRecord::VERSION::STRING} and ARel #{Arel::VERSION}..."
    puts '=' * 80
  end
end
