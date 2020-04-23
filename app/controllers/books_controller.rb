class BooksController < ApplicationController
  def index
        key = "HvEp40NMG2XEUvVtxvrIg"
    secret = "9btoslPmCwBxLeCngBMMSjlg2HJfJNsYqhEyREpnI"
    consumer = OAuth::Consumer.new(key, secret, { :site => "https://www.goodreads.com" })
    access_token = OAuth::AccessToken.new(consumer, session[:access_token], session[:access_secret])
    response = access_token.get("https://www.goodreads.com/review/list.xml?per_page=200")
    response_hash = Hash.from_xml(response.body)
    @books = response_hash["GoodreadsResponse"]["books"]["book"]
  end
end