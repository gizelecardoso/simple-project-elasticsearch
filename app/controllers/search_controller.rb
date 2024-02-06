class SearchController < ApplicationController
  def search
    @results = params[:search].blank? ?  Post.search("*") : Post.search(params[:search])

    render turbo_stream:
      turbo_stream.update("posts",
                        partial: "posts/posts",
                        locals: { posts: @results })
  end
end
