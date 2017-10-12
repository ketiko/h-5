class User < ApplicationRecord
  has_many :appreciations, dependent: :destroy
  has_one :bank_account, dependent: :destroy

  after_commit :create_bank_account, on: :create

  private

  def create_bank_account
    BankAccount.create!(user: self)
  end
end
