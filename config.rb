require 'lib/gfm_ids.rb'

activate :deploy do |deploy|
  deploy.deploy_method = :git
end

activate :bh

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash  # Cache Buster
  # Asset pipeline
  activate :sprockets do |c|
    c.expose_middleman_helpers = true
  end
end

configure :development do
  activate :livereload
end

set :markdown, { fenced_code_blocks: true, with_toc_data: true }
set :markdown_engine, :redcarpet
activate :syntax
activate :gfm_ids

Dir['api-blueprint/examples/*.md']
  .map do |path|
    path = Pathname.new(path)

    title = path.basename.sub_ext('').to_s
    slug = title.gsub('.', '').gsub(' ', '-').downcase

    {
      title: title,
      slug: slug,
      path: path,
      content: path.read
        .split("\n")
        .reject do |line|
          # Remove the interlinking
          line == '## API Blueprint' || line.start_with?('+ [Previous:') || line.start_with?('+ [This:') || line.start_with?('+ [Next:')
        end
        .join("\n"),
    }
  end
  .reject { |example| example[:title] == 'README' }
  .each do |example|
    proxy "/documentation/examples/#{example[:slug]}.html", "/documentation/examples/example.html", :locals => example
  end

ignore '/documentation/examples/example.html'

helpers do
  def include(path)
    if path.include? ".rb"
      print("[debug] " + path)
      IO.read(path).sub(/^#[ \w].+$/, '')
    end
  end

  # Returns all of the available tool tags
  def tool_tags
    data.tools.map(&:tags).flatten.uniq
  end
end
