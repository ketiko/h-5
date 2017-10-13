class Appreciation < ApplicationRecord
  belongs_to :user
  has_secure_token

  attr_accessor :qr_code, :url

  validates :user, presence: true

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
