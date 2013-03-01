::ApplicationController.extend ActiveLogger::Controller
::ActiveLogger.history_class = ActiveLogger::<%= logger_class_name %>
::ActiveLogger.history_value_class = ActiveLogger::<%= logger_class_name %>Value