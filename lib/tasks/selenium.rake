namespace :test do
  Rake::TestTask.new(:selenium) do |t|
    t.libs << "test"
    t.pattern = 'test/selenium/*_test.rb'
    t.verbose = true
  end
  Rake::Task['test:selenium'].comment = "Run the selenium tests in test/selenium"
end
