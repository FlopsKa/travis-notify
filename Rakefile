require './app'
require 'rspec'
require 'rspec/core/rake_task'

task :default => 'ci:spec'

namespace :ci do
  desc "Used for CI. Set up the database."
  task :build do
  end

  task :deploy do
    # sh "cap staging deploy"
  end

  desc "Used for CI. Set up the database."
  task :run => ['ci:build'] do
  end

  desc "Run the specs."
  RSpec::Core::RakeTask.new do |t|
    t.pattern = "spec/**/*_spec.rb"
  end

end
