# Copyright 2016 The Cocktail Experience, S.L.
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs = %w(lib test)
  t.pattern = 'test/lambda_test.rb'
end

task :default => :test
