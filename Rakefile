desc 'Run a development version of the site'
task :serve do
  sh 'bundle exec middleman server'
end

desc 'Validate the tools section'
task 'validate-tools' do
  require 'bundler/setup'
  require 'yaml'
  require 'json-schema'

  tools = YAML.load_file('data/tools.yaml')

  schema = {
    type: 'array',
    items: {
      type: 'object',
      properties: {
        name: {
          type: 'string',
        },
        summary: {
          type: 'string',
        },
        url: {
          type: 'string',
          format: 'uri',
        },
        tags: {
          type: 'array',
          items: {
            type: 'string'
          }
        },
      },
      required: [
        'name',
        'summary',
        'url',
        'tags',
      ]
    }
  }

  JSON::Validator.validate!(schema, tools)
end

task :default => :serve
