class ActiveLoggerGenerator < Rails::Generators::Base
  
  source_root File.expand_path('../templates', __FILE__)
  argument :logger_class_name, :type => :string, :default => "History"
  
  #  if yes?("Whats the name of your user model?")
  #    model_name = ask("What would you like the user model to be called? [user]")
  #    model_name = "user" if model_name.blank?
  #  end
  
  def generate_models
    # copy_file "stylesheet.css", "public/stylesheets/#{logger_class_name.underscore}.css"
    template "models/history.rb", "app/models/active_logger/#{logger_class_name.underscore}.rb"
    template "models/history_value.rb", "app/models/active_logger/#{logger_class_name.underscore}_value.rb"
  end

  def add_initializer
    template "active_logger.rb", "config/initializers/active_logger.rb"
  end
  
  def migrations
    timestamp = Time.new.strftime("%Y%m%d%H%M%S")
    l = timestamp.size
    template "db/migrate/history.rb", "db/migrate/#{timestamp}_#{logger_class_name.underscore}.rb"
    rep = timestamp[l-1].to_i+1
    if rep>9
      timestamp = "#{timestamp[0..l-3]}10"
    else
      timestamp = "#{timestamp[0..l-2]}#{rep}"
    end
    template "db/migrate/history_value.rb", "db/migrate/#{timestamp}_#{logger_class_name.underscore}_value.rb"
    rake("db:migrate")
    
  end
  
end
