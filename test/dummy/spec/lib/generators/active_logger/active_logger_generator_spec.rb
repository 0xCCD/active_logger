require "spec_helper"
require "generator_spec/test_case"
require "generators/active_logger/active_logger_generator"

describe ActiveLoggerGenerator do

  include GeneratorSpec::TestCase
  destination File.expand_path("../../../../tmp", __FILE__)
  arguments %w(MyHistory)

  before(:all) do
    prepare_destination
    run_generator
  end

  it "test created models" do
    assert_file "app/models/active_logger/my_history.rb", "module ActiveLogger\n  class MyHistory < ActiveRecord::Base\n    attr_accessible :user_id, :logged_for, :logged_for_id, :i18n, :body\n    has_many :my_history_values\n    \n    def active_logger_history_values\n      my_history_values\n    end\n    \n  end\nend"
    assert_file "app/models/active_logger/my_history_value.rb", "module ActiveLogger\n  class MyHistoryValue < ActiveRecord::Base\n\n    attr_accessible :my_history_id, :key, :value\n\n    belongs_to :my_history\n    \n  end\nend"
  end

  it "test created initializer" do
    assert_file "config/initializers/active_logger.rb", "::ApplicationController.extend ActiveLogger::Controller\n::ActiveLogger.history_class = ActiveLogger::MyHistory\n::ActiveLogger.history_value_class = ActiveLogger::MyHistoryValue"
  end

end