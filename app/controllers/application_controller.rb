class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def default_url_options
    { host: ENV.fetch('DEFAULT_URL_HOST', 'localhost:3000') }
  end
end
