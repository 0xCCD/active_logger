::ApplicationController.extend ActiveLogger::Controller
::ActiveLogger.history_class = ActiveLogger::MyHistory
::ActiveLogger.history_value_class = ActiveLogger::MyHistoryValue