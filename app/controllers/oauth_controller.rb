
class OauthController < ApplicationController

  def auth_link
    key = "HvEp40NMG2XEUvVtxvrIg"
    secret =  "9btoslPmCwBxLeCngBMMSjlg2HJfJNsYqhEyREpnI"
    consumer = OAuth::Consumer.new(key, secret, { :site => "https://www.goodreads.com" })
    request_token = consumer.get_request_token(oauth_callback: 'http://localhost:3000/oauth/callback')
    OauthToken.create!(oauth_token: request_token.params[:oauth_token], oauth_token_secret: request_token.params[:oauth_token_secret])
    redirect_to request_token.authorize_url + '&oauth_callback=http://localhost:3000/oauth/callback'
  end

  def callback
    key = "HvEp40NMG2XEUvVtxvrIg"
    secret =  "9btoslPmCwBxLeCngBMMSjlg2HJfJNsYqhEyREpnI"
    consumer = OAuth::Consumer.new(key, secret, { :site => "https://www.goodreads.com" })
    token = OauthToken.find_by(oauth_token: params[:oauth_token])
    request_token = OAuth::RequestToken.new(consumer, token.oauth_token, token.oauth_token_secret)
    access_token = consumer.get_access_token(request_token, :oauth_verifier => '1')
    session[:access_token] = access_token.token
    session[:access_secret] = access_token.secret
    render nothing: true
  end
end