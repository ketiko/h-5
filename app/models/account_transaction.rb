class AccountTransaction < ApplicationRecord
  belongs_to :bank_account
  has_one :appreciation

  def self.total
    sum(:points)
  end
end
