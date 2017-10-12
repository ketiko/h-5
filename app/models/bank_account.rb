class BankAccount < ApplicationRecord
  belongs_to :user
  has_many :account_transactions, dependent: :destroy

  validates :user, presence: true

  def total
    account_transactions.total
  end
end
