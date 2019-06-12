require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

desc 'Look for style guide offenses in your code'
task :rubocop do
  sh 'rubocop --format simple || true'
end

task default: [:rubocop, :spec]

desc 'launching app...'
task :run do
  sh %(ruby app.rb)
end

desc 'setting up enviroment variable file'
task :setup do
  sh %(touch .env)
end
