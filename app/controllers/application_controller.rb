class ApplicationController < ActionController::Base
  protect_from_forgery
  def ruse(url)
    render :text => `phantomjs --local-to-remote-url-access=yes lib/ruse.js #{url}`
  end
end