require 'account'

describe Account do
  subject(:account) { described_class.new(transactionclass) }
  let(:transactionclass){double:transactionclass, new: transaction }
  let(:transaction){double:transaction, new_transaction: nil}


  context 'balance' do

    it 'starts with a balance of zero' do
      expect(account.balance).to be(0)
    end

  end

  context 'credit' do

    it 'adds amount to balance' do
      account.add_credit(10)
      expect(account.balance).to be(10)
    end

    it 'sends for credit transaction to be processed' do
      expect(transaction).to receive(:new_transaction).with({credit: 10}, {balance:10})
      account.add_credit(10)
    end

  end

  context 'debit' do

    it 'reduces amount to balance' do
      account.add_credit(6)
      account.withdraw(4)
      expect(account.balance).to be(2)
    end

    it 'sends for debit transaction to be processed' do
      expect(transaction).to receive(:new_transaction).with({debit: 10}, {balance:-10})
      account.withdraw(10)
    end

  end

  context 'update statement' do

    it 'updates the statement' do
      account.update_statement('New Update')
      expect(account.print_statement).to include('New Update')
    end

  end

end
