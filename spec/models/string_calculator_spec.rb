require 'rails_helper'

RSpec.describe StringCalculator, type: :model do
  let(:calculator) { StringCalculator.new }

  describe 'add' do
    it 'return 0 for empty string' do
      expect(calculator.add('')).to eq(0)
    end

    context 'single number' do
      it 'return 0 for 0' do
        expect(calculator.add('0')).to eq(0)
      end

      it 'return 5 for 5' do
        expect(calculator.add('5')).to eq(5)
      end

      it 'return 27 for 27' do
        expect(calculator.add('27')).to eq(27)
      end
    end

    context '2 numbers' do
      it 'returns 5 for 2,3' do
        expect(calculator.add('2,3')).to eq(5)
      end

      it 'returns 27 for 22,5' do
        expect(calculator.add('22,5')).to eq(27)
      end
    end

    context '3 numbers' do
      it 'returns 25 for 10,12,3' do
        expect(calculator.add('10,12,3')).to eq(25)
      end
    end
  end
end
