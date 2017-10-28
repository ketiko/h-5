class BankAccountsController < ApplicationController
  # GET /bank_accounts
  # GET /bank_accounts.json
  def index
    @bank_accounts = BankAccount.all
  end
end
