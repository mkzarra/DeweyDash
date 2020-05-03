class UserController < ApplicationController
  def show
    response = access_token.get("https://www.goodreads.com/api/auth_user")
    response_hash = Hash.from_xml(response.body)
    @user = response_hash['GoodreadsResponse']['user']
  end
end
