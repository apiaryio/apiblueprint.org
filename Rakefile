desc 'Run a development version of the site'
task :serve do
  sh 'bundle exec middleman server'
end

task :build do
  sh 'bundle exec middleman build'
end

task :deploy do
  sh 'bundle exec middleman deploy'
end

desc 'Validate the tools section'
task 'validate-tools' do
  require 'yaml'
  YAML.load_file('data/tools.yaml')
end

task :default => :serve
