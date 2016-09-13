ActiveSupport.on_load(:active_record) do
  ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter.class_eval do
    self.emulate_integers_by_column_name = true
    self.emulate_booleans_from_strings = true
  end
end
