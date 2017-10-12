json.extract! account_transaction, :id, :bank_account_id, :created_at, :updated_at
json.url account_transaction_url(account_transaction, format: :json)
