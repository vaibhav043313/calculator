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

      it 'returns 1025 for 200,700,125' do
        expect(calculator.add('200,700,125')).to eq(1025)
      end
    end

    it 'supports newline as delimiter' do
      expect(calculator.add('1\n2')).to eq(3)
    end

    it 'supports mixed delimiter' do
      expect(calculator.add('1\n2,25')).to eq(28)
    end

    it 'supports different delimiter' do
      expect(calculator.add('//;\n1;2;3')).to eq(6)
    end

    context 'negative numbers' do
      it 'raises an exception if it finds ome' do
        expect { calculator.add('-1') }.to raise_error
      end

      it 'includes the negative numbers in the message' do
        expect { calculator.add('-1,25,-42') }.to raise_error('Negative numbers not allowed: -1, -42')
      end
    end
  end
end
