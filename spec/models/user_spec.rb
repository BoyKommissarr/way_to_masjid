RSpec.describe User do
  context 'when user is valid' do
    let(:user) { build(:user, email: '') }

    it 'validates and return false' do
      expect(user.valid?).to be_falsey
    end
  end
end
