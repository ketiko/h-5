class Appreciation < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user
  has_secure_token

  def url
    give_appreciation_path(self)
  end

  def qr_code
    qrcode = RQRCode::QRCode.new(url)
    qrcode.as_html
  end
end
