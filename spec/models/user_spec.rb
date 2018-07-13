require 'rails_helper'

RSpec.describe User, type: :model do
  
  # let(:user1) { User.new(password: '123123')}
  # let(:user2) { User.new(username: 'Eric')}
  # 
  # it 'validates presence of username' do
  #   expect(user1).not_to be_valid
  # end
  # 
  # it 'validates presence of password' do
  #   expect(user2).not_to be_valid
  # end
  subject(:user) do
    User.create!(username: 'BOB', password: '1234122')
  end
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  
  
end
