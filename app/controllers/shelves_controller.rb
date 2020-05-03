class ShelvesController < ApplicationController
  def index
    response = goodreads_oauth_access_token.get("https://www.goodreads.com/shelf/list.xml?per_page=200")
    response_hash = Hash.from_xml(response.body)
    @shelves = response_hash["GoodreadsResponse"]['shelves']['user_shelf']
  end

  def show
    response = goodreads_oauth_access_token.get("https://www.goodreads.com/shelf/list/#{params[:id]}.xml?v=2")
    response_hash = Hash.from_xml(response.body)
    @shelf = response_hash["GoodreadsResponse"]['shelves']['user_shelf'].find { |shelf| shelf['id'].to_s == params[:id] }
    # @reading_list = @books.filter { |book| book['my-review']['shelves']['shelf']['name'] == @shelf['name'] }
  end
end