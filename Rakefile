require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:gem_spec)
task :test do
  Rake::Task[:gem_spec].invoke
  Dir.chdir('test/dummy') do
    sh 'bundle e rake spec'
  end
end

task default: :test
