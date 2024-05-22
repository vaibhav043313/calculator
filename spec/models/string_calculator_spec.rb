require 'rails_helper'

RSpec.describe StringCalculator, type: :model do
  describe 'add' do
    it 'return 0 for empty string' do
      expect(StringCalculator.new.add('')).to eq(0)
    end
  end
end
