require 'rubygems'
require 'rake'

Rake::Task["test"].enhance do
  begin  
    Rake::Task["test:selenium"].invoke
    nil
  rescue => e
    "test:selenium"
  end 
end
