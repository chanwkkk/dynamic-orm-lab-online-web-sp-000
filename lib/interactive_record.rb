require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'pry'

class InteractiveRecord

  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    sql="PRAGMA table_info ('#{table_name}')"
    column_names=[]
    table_info = DB[:conn].execute(sql)
    binding.pry
    table_info.each do |column|
      colunm_names<<colunm["name"]
    end
  end

end
