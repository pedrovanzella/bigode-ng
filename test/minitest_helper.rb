ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)

require "minitest/autorun"
require "minitest/rails"
require "minitest/matchers"
require "minitest/pride"

require "miniskirt"
require "factories"


# Uncomment if you want Capybara in accceptance/integration tests
# require "minitest/rails/capybara"


# include some stuff to be used by all specs
class MiniTest::Rails::Spec
  include Devise::TestHelpers
  # cheat to make #context method available
  class << self
    alias :context :describe
  end
end

# make fixtures and shoulda matchers available within models spec
class MiniTest::Rails::Model
  include Shoulda::Matchers::ActiveRecord
  extend Shoulda::Matchers::ActiveRecord
  include Shoulda::Matchers::ActiveModel
  extend Shoulda::Matchers::ActiveModel
end

# make #describe BDD style available
MiniTest::Spec.register_spec_type MiniTest::Rails::Model do |desc|
 # desc.constantize < ActiveRecord::Base
end

# Do you want all existing Rails tests to use MiniTest::Rails?
# Comment out the following and either:
# A) Change the require on the existing tests to `require "minitest_helper"`
# B) Require this file's code in test_helper.rb

MiniTest::Rails.override_testunit!

