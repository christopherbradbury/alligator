class PlayerController < ApplicationController
  def index
    # TODO get some validation/errors around what is coming in
    blog_url = params[:blog_url]
    return unless blog_url =~ URI::regexp
    @blog_url = blog_url
  end
end
