require 'middleman-core'
require 'nokogiri'


# Updates IDs from Markdown headings to be GFM compatible
class GFMIDs < Middleman::Extension
  def initialize(app, options={})
    super

    app.after_render do |content, path, locs, template_class|
      if template_class == Middleman::Renderers::RedcarpetTemplate
        document = Nokogiri::HTML(content)

        document.css('h1, h2, h3, h4, h5, h6').each do |node|
          node.attributes['id'].value = node.content
            .downcase
            .gsub(/[^\p{Alnum} -]/, '')  # Remove non-alpha numeric characters
            .tr(' ', '-')  # Replace spaces with dashes
        end

        document.to_s
      else
        nil
      end
    end
  end
end


::Middleman::Extensions.register(:gfm_ids, GFMIDs)
