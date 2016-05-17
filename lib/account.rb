require_relative 'transaction'

class Account

  attr_reader :balance

  def initialize(transaction = Transaction)
    @balance = 0
    @transaction = transaction.new(self)
    @statement = []
  end

  def add_credit(amount)
    @balance += amount
    register_transaction(credit: amount)
  end

  def withdraw(amount)
    @balance -= amount
    register_transaction(debit: amount)
  end

  def print_statement
    return @statement
  end

  def update_statement(update)
    @statement.push(update)
  end


  private

  def register_transaction(transaction)
    @transaction.new_transaction(transaction, balance: @balance)
  end

end
