# == Schema Information
#
# Table name: bank_accounts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_bank_accounts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class BankAccount < ApplicationRecord
  belongs_to :user
  has_many :account_transactions, dependent: :destroy

  validates :user, presence: true

  def total
    account_transactions.total
  end
end
