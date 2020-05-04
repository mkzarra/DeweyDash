class ShelvesController < ApplicationController
  def index
    response = goodreads_oauth_access_token.get("https://www.goodreads.com/shelf/list.xml?per_page=200")
    response_hash = Hash.from_xml(response.body)
    @shelves = response_hash["GoodreadsResponse"]['shelves']['user_shelf']
  end

  def show
    @shelf_name = params[:name]
    response = goodreads_oauth_access_token.get("https://www.goodreads.com/review/list.xml?shelf=#{@shelf_name}&per_page=200")
    response_hash = Hash.from_xml(response.body)
    @reading_list = response_hash["GoodreadsResponse"]["books"]["book"]
  end
end