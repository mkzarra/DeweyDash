class ShelvesController < ApplicationController
  def index
    response = goodreads_oauth_access_token.get("https://www.goodreads.com/shelf/list.xml?per_page=200")
    response_hash = Hash.from_xml(response.body)
    @shelves = response_hash["GoodreadsResponse"]['shelves']['user_shelf']
    binding.pry
  end

  def show
    response = goodreads_oauth_access_token.get("https://www.goodreads.com/shelf/list.xml?id=#{params[:id]}")
    response_hash = Hash.from_xml(response.body)
    @shelf = response_hash["GoodreadsResponse"]["shelves"]['user_shelf'][0]
  end
end