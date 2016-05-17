describe Transaction do

  subject(:transaction) {described_class.new(account)}
  let(:account){double:account, update_statement: nil}




  context 'credit transaction' do

    it 'creates a credit transaction' do
      allow(Time).to receive(:now).and_return('2012-01-14 15:51:47 +0000')
      expect(account).to receive(:update_statement).with(['14/01/2012 || 500.00 || || 500.00'])
      transaction.new_transaction(:credit => 500.00, :balance => 500.00)
    end

  end


end
