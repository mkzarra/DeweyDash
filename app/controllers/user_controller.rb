class UserController < ApplicationController

  def show
    key = "HvEp40NMG2XEUvVtxvrIg"
    secret =  "9btoslPmCwBxLeCngBMMSjlg2HJfJNsYqhEyREpnI"
    consumer = OAuth::Consumer.new(key, secret, { :site => "https://www.goodreads.com" })
    access_token = OAuth::AccessToken.new(consumer, session[:access_token], session[:access_secret])
    response = access_token.get("https://www.goodreads.com/api/auth_user")
    render xml: response.body
  end
end
