ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new(:color => true)]


class Minitest::Test
  def after_setup
    before_each
    super
  end

  def before_teardown
    super
    after_each
  end

  def before_each
  end

  def after_each
  end
end

class ActiveSupport::TestCase
  DatabaseCleaner.clean_with :truncation
  DatabaseCleaner.strategy = :truncation

  def setup
    DatabaseCleaner.start
    super
  end

  def teardown
    super
    DatabaseCleaner.clean
  end

end

class UnitTest < ActiveSupport::TestCase

end
