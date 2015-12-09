module PlayerHelper
  def ids
    return unless @blog_url
    ids = Collector.new(@blog_url).ids
    ids && ids.reverse!
  end
end
