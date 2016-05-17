class Transaction

  def initialize(account)
    @account = account
  end


  def new_transaction(transaction)
    store = {:credit => '', :debit => '', :balance => ''}
    store.merge!(transaction)
    format_info(transaction)
  end

  private

  def format_info(transaction)
    time = Time.now.strftime("%d/%m/%Y")
    credit = transaction[:credit].to_s
    debit = transaction[:debit].to_s
    balance = transaction[:balance].to_s
    formatted_transaction = time + ' || ' + credit + ' || ' + debit + ' || ' + balance
    @account.update_statement(formatted_transaction)
  end
end
