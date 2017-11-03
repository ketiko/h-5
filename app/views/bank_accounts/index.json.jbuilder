json.array! @bank_accounts do |bank_account|
  json.(bank_account, :total)
  json.user do
    json.(bank_account.user, :first_name, :last_name, :email, :avatar_url)
  end
end
