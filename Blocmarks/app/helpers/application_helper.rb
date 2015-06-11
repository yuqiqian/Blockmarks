module ApplicationHelper
  def form_group_tag(errors, &block)
     if errors.any?
       content_tag :div, capture(&block), class: 'form-group has-error'
     else
       content_tag :div, capture(&block), class: 'form-group'
     end
   end

   def markdown_to_html(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end

  def get_host_without_www(url)
    url = "http://#{url}" if URI.parse(url).scheme.nil?
    host = URI.parse(url).host.downcase
    host.start_with?('www.') ? host[4..-1] : host
  end

  def get_embed_image(url)
    require 'embedly'
    require 'json'
    embedly_api = Embedly::API.new :key => ENV['EMBEDLY_KEY'], :user_agent => 'Mozilla/5.0 (compatible; Blocmarks-yuqi/1.0; yuqi.qian@outlook.com)'
    obj = embedly_api.extract :url => url
    temp_json = JSON.pretty_generate(obj[0].marshal_dump)
    dict = JSON.load(temp_json)
    if dict!=nil && dict["images"]!=nil && dict["images"][0] != nil && dict["images"][0]["url"] != "f"
      return image = dict["images"][0]["url"]
    else
      return false
    end
  end
end
