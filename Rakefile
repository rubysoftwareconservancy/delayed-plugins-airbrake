require 'bundler/gem_tasks'
require 'rake'
require 'rspec/core/rake_task'

task :default => :spec

Bundler::GemHelper.install_tasks
RSpec::Core::RakeTask.new(:spec)

task :console do
  sh('irb -I lib -r delayed-plugins-airbrake')
end
