class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def goodreads_oauth_consumer
    @goodreads_oauth_consumer ||= OAuth::Consumer.new(key, secret, { :site => "https://www.goodreads.com" })
  end

  def goodreads_oauth_access_token
    @goodreads_oauth_access_token ||= OAuth::AccessToken.new(goodreads_oauth_consumer, session[:access_token], session[:access_secret])
  end

  def key
    "HvEp40NMG2XEUvVtxvrIg"
  end

  def secret
    "9btoslPmCwBxLeCngBMMSjlg2HJfJNsYqhEyREpnI"
  end
end
