require 'rubygems'
require 'rake'

class Rake::Task
  def overwrite(&block)
    @actions.clear
    enhance(&block)
  end
end

Rake::Task[:test].overwrite do
  errors = %w(test:units test:functionals test:integration test:selenium).collect do |task|
    begin
      Rake::Task[task].invoke
      nil
    rescue => e
      task
    end
  end.compact
  abort "Errors running #{errors * ', '}!" if errors.any?
end
