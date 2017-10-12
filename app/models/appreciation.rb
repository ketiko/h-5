class Appreciation < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user
  has_secure_token

  def url
    give_appreciation_path(self)
  end

  def qr_code
    qrcode = RQRCode::QRCode.new(url)
    output = Base64.encode64(qrcode.as_png.to_s)
    "data:image/png;base64,#{output}"
  end

  def give
    if given != true
      update(given: true)
    else
      errors.add(:given, 'This appreciation has already be used')
      false
    end
  end
end
