# == Schema Information
#
# Table name: account_transactions
#
#  id              :integer          not null, primary key
#  bank_account_id :integer
#  appreciation_id :integer
#  points          :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_account_transactions_on_appreciation_id  (appreciation_id)
#  index_account_transactions_on_bank_account_id  (bank_account_id)
#
# Foreign Keys
#
#  fk_rails_...  (appreciation_id => appreciations.id)
#  fk_rails_...  (bank_account_id => bank_accounts.id)
#

class AccountTransaction < ApplicationRecord
  belongs_to :bank_account
  belongs_to :appreciation

  def self.total
    sum(:points)
  end
end
