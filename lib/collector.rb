require 'open-uri'
class Collector
  attr_reader :url, :links, :ids

  def initialize(url)
    @url = url
    @links = get_media_embedables
    @ids = get_media_ids
  end

  # private

    MATCH_IFRAME = 'iframe.*src\='
    MATCH_LINK_START = '<iframe'
    MATCH_LINK_END = '</iframe>'
    MATCH_ID_START = 'embed/'
    MATCH_ID_END = '"'

    def get_content_from_blog
      content = []
      open(url) do |f|
        f.each_line { |line| content << line }
      end
      content
    end

    def get_link_from_line(line)
      match = line.match(MATCH_LINK_START).post_match.match(MATCH_LINK_END).pre_match
      "#{MATCH_LINK_START}#{match}#{MATCH_LINK_END}"
    end

    def get_media_embedables
      content = get_content_from_blog
      lines = content.select{ |c| c =~ /#{MATCH_IFRAME}/ }
# TODO I am calling html safe here.. consider sanitizing!!
      lines.map { |line| get_link_from_line(line).html_safe }
    end

    def get_media_ids
      links = get_media_embedables
      links.map { |link| get_id_from_link(link) }.compact
    end

    def get_id_from_link(link)
# TODO this will only work for youtube, not sound cloud
      return unless link =~ /youtube/
      link.match(MATCH_ID_START).post_match.match(MATCH_ID_END).pre_match
    end
end
