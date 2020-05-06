class BooksController < ApplicationController
  def index
    response = goodreads_oauth_access_token.get("https://www.goodreads.com/review/list.xml?per_page=200")
    response_hash = Hash.from_xml(response.body)
    @books = response_hash["GoodreadsResponse"]["books"]["book"]
  end

  def show
    response = goodreads_oauth_access_token.get("https://www.goodreads.com/book/show.xml?id=#{params[:id]}")
    response_hash = Hash.from_xml(response.body)
    @book = response_hash["GoodreadsResponse"]["book"]
  end
end