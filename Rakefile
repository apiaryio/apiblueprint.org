desc 'Run a development version of the site'
task :serve do
  sh 'bundle exec middleman server'
end

desc 'Validate the tools section'
task 'validate-tools' do
  require 'yaml'
  YAML.load_file('data/tools.yaml')
end

task :default => :serve
