# frozen_string_literal: true

# Adds a srcset to screenshots so standard-density displays load the smaller file.
#
# A screenshot at /assets/images/Name.png is a 2x render. When Name@1x.png exists next to it, the <img> tag gets
# srcset="/assets/images/Name@1x.png 1x, /assets/images/Name.png 2x". Images without an @1x file, and tags that
# already have a srcset, are left alone.
module ImageSrcset
  IMG_TAG = %r{<img\b[^>]*?\ssrc="(?<two_x>/assets/images/(?<name>[^"/]+?)\.png)"[^>]*>}

  def self.rewrite(html, source)
    html.gsub(IMG_TAG) do |tag|
      match = Regexp.last_match
      name = match[:name]
      two_x = match[:two_x]
      one_x = "/assets/images/#{name}@1x.png"

      next tag if tag.include?("srcset=") || name.end_with?("@1x")
      next tag unless File.file?(File.join(source, one_x))

      tag.sub(%(src="#{two_x}"), %(src="#{two_x}" srcset="#{one_x} 1x, #{two_x} 2x"))
    end
  end
end

Jekyll::Hooks.register %i[pages documents], :post_render do |doc|
  next unless doc.output_ext == ".html"

  doc.output = ImageSrcset.rewrite(doc.output, doc.site.source)
end
