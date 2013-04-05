module ActiveLogger

  autoload :User, 'active_logger/user.rb'
  autoload :Controller, 'active_logger/controller.rb'

  mattr_accessor :history_class
  mattr_accessor :history_value_class

  DEBUG = 0
  INFO = 1
  WARN = 2
  ERROR = 3

  class Railtie < ::Rails::Railtie
    # Rails-3.0.1 requires config.app_generators instead of 3.0.0's config.generators
    generators = config.respond_to?(:app_generators) ? config.app_generators : config.generators
    generators.active_logger :active_logger
  end

  module ClassMethods

    def enable_logging options={}

      _default = {class_name: ::ActiveLogger.history_class.to_s.split("::").last, ignore: ["created_at", "updated_at"]}.merge(options)

      cattr_accessor :fields_to_ignore, :history_symbol

      self.fields_to_ignore = _default[:ignore]
      self.history_symbol = :"#{_default[:class_name].pluralize.underscore}"

      send :include, InstanceMethods
      before_save :record_creation_or_changes
      before_destroy :record_destroy

      has_many self.history_symbol, :foreign_key=>:logged_for_id, :class_name => "ActiveLogger::#{_default[:class_name]}", :conditions => { :logged_for => "#{self.name}" }

    end # enable_logging

  end # ClassMethods

  module InstanceMethods

    def i18n_create
      "active_logger.create.#{self.class.name.singularize.underscore}"
    end

    def i18n_update
      "active_logger.update.#{self.class.name.singularize.underscore}"
    end

    def i18n_destroy
      "active_logger.destroy.#{self.class.name.singularize.underscore}"
    end

    def record_creation_or_changes

      before, changed = fetch_changes

      if new_record?
        self.send(self.history_symbol).send(:<<, add_log_entry({:user_id=>::ActiveLogger::User.user_id, :logged_for=>self.class.name, :i18n=>true, :body=>i18n_create}, {:obj=>before.to_yaml, :obj2=>changed.to_yaml}))
      else
        add_log_entry({:user_id=>::ActiveLogger::User.user_id, :logged_for=>self.class.name, :logged_for_id=>read_attribute("id"), :i18n=>true, :body=>i18n_update}, {:obj=>before.to_yaml, :obj2=>changed.to_yaml}) unless before.empty?
      end

    end # record_changes

    def record_destroy

      before = changed_attributes.dup
      add_log_entry({:user_id=>::ActiveLogger::User.user_id, :logged_for=>self.class.name, :logged_for_id=>read_attribute("id"), :i18n=>true, :body=>i18n_destroy}, {:obj=>before.to_yaml, :obj2=>"destroyed"})

    end # record_changes

    private

    def add_log_entry attributes, values, level=::ActiveLogger::INFO

      uh = ::ActiveLogger.history_class.new(attributes)
      uh.level = level
      uh.i18n = true

      if !values.nil?
        values.each do |key,val|
          ahv = ::ActiveLogger.history_value_class.new
          ahv.key = key.to_s
          ahv.value = val
          uh.active_logger_history_values << ahv
        end
      end

      uh.save!

      uh

    end # add_log_entry

    def fetch_changes

      before = changed_attributes.dup

      self.fields_to_ignore.each do |k|
        before.delete(k)
        before.delete(k.to_sym)
      end
      changed = before.keys.inject({}) do |c, (k,v)|
        c[k] = send(k.to_sym)
        c
      end

      [before, changed]

    end

  end # InstanceMethods

end # ActiveLogger

ActiveRecord::Base.extend ActiveLogger::ClassMethods