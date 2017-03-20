require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    let(:user) do
      User.create(
        first_name: 'Han',
        last_name: 'Solo',
        email: 'hansolo@mfalcon.net',
        password: 'easychewie',
        password_confirmation: 'easychewie'
      )
    end
    it 'should be valid when created with valid credentials' do
      expect(user).to be_valid
    end
    it 'should not be valid when passwords don\'t match' do
      user.password_confirmation = 'easych3wie'
      user.valid?
      expect(user.errors.full_messages).to eq(
        ['Password confirmation doesn\'t match Password']
      )
    end
    it 'should not be valid when passwords aren\'t present' do
      user.password = nil
      user.password_confirmation = nil
      user.valid?
      expect(user.errors.full_messages).to eq(
        ['Password can\'t be blank', 'Password confirmation can\'t be blank']
      )
    end
  end
end
