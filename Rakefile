require 'rake/testtask'

task default: :test

Rake::TestTask.new do |t|
  t.libs << 'test' # here is the test_helper
  t.pattern = 'test/**/*_test.rb'
end

