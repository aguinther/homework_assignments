require 'rspec'
require_relative '../../lib/cash_register'

describe CashRegister do

  describe '#total' do
    it 'should equal 0.0 for new registers' do
      expect(subject.total).to eq(0.0)
    end
  end

  describe '#purchase(amount)' do
    context 'when the amount > 0' do
      it 'adds the amount to the total' do
        subject.purchase(3.78)
        expect(subject.total).to eq(3.78)
      end
    end
  end

  context 'when the amount = 0' do
    it 'does not change the total' do
      subject.purchase(0)
      expect(subject.total).to eq(0.00)
    end
  end

  context 'when the amount < 0' do
    it 'raises an argument error' do
      expect(subject.purchase(-1)).to eq('Negative purchase not allowed')
    end
    it 'does not change the total' do
      subject.purchase(-1)
      expect(subject.total).to eq(0.00)
    end
  end

  describe '#pay(amount)' do
    before do
      subject.purchase(3.78)
      subject.purchase(5.22)
    end
    context 'when the amount > 0' do
      context 'and the amount < total' do
        it 'subtracts the amount from the total' do
          subject.pay(5.00)
          expect(subject.total).to eq(4.00)
        end
        it 'returns a string specifying the new total' do
          expect(subject.pay(5.00)).to eq('Your new total is $4.00')
        end
      end
      context 'and the amount = total' do
        it 'subtracts the amount from the total' do
          subject.pay(9)
          expect(subject.total).to eq(0.00)
        end
        it 'should make the total 0.0' do
          subject.pay(9)
          expect(subject.total).to eq(0.00)
        end
      end
      context 'and the amount > total' do
        it 'sets the total to 0.0' do
          subject.pay(10)
          expect(subject.total).to eq(0.00)
        end
        it 'returns a string specifying the change.' do
          expect(subject.pay(10)).to eq('Your change is $1.00')
        end
      end
    end

    context 'and the amount = 0' do
      it 'does not change the total' do
        subject.pay(0)
        expect(subject.total).to eq(9.00)
      end
    end

    context 'and the amount < 0' do
      it 'raises an argument error' do
        expect(subject.pay(-10)).to eq('Payment must be positive')
      end
      it 'does not change the total' do
        subject.pay(-10)
        expect(subject.total).to eq(9.00)
      end
    end
  end
end
