# == Schema Information
#
# Table name: appreciations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  points     :integer
#  token      :string
#  given      :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_appreciations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Appreciation < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :user
  has_secure_token

  validates :user, presence: true

  def url
    give_appreciation_url(self.token, host: ENV.fetch("DEFAULT_URL_HOST", "localhost:3000"))
  end

  def qr_code()
    qrcode = RQRCode::QRCode.new(url)
    output = Base64.encode64(qrcode.as_png.to_s)
    "data:image/png;base64,#{output}"
  end

  def give
    if given != true
      transaction do
        update(given: true)
        AccountTransaction.create!(bank_account_id: user.bank_account.id, appreciation_id: self.id, points: points)
      end
    else
      errors.add(:given, 'This appreciation has already be used')
      false
    end
  end
end
