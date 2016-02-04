require 'lib/gfm_ids.rb'

activate :bh

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash  # Cache Buster
end

configure :development do
  activate :livereload
end

set :markdown, { fenced_code_blocks: true, with_toc_data: true }
set :markdown_engine, :redcarpet
activate :rouge_syntax
activate :gfm_ids

page '/documentation/*', :layout => 'documentation'

helpers do
  def include(path)
    IO.read(path).sub(/^#[ \w].+$/, '')
  end

  # Returns all of the available tool tags
  def tool_tags
    data.tools.map(&:tags).flatten.uniq
  end
end
