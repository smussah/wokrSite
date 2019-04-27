# Jekyll - Easy Youtube Embed
#
# Katie Harron - https://github.com/pibby
#
#   Input:
#     {% youtube Al9FOtZcadQ %}
#   Output:
#   <div class="video">
#     <figure>
#       <iframe width="640" height="480" src="//www.youtube.com/embed/Al9FOtZcadQ" allowfullscreen></iframe>
#     </figure>
#   </div>

module Jekyll
  class FacebookVideo < Liquid::Tag
    @url = nil

    VIDEO_URL = /(\S+)/i

    def initialize(tag_name, markup, tokens)
      super

      if markup =~ VIDEO_URL
        @url = $1
      end
    end

    def render(context)
      source = "<div class=\"video-responsive\">"
      source += "<iframe src=\"//www.facebook.com/plugins/video.php?href=#{@url}\" width=\"560\" height=\"315\" scrolling=\"no\" frameborder=\"0\" allowfullscreen=\"false\"></iframe>"
      source += "</div>"
      source
    end
  end
end

Liquid::Template.register_tag('facebookvideo', Jekyll::FacebookVideo)