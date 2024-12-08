RSpec.describe User do
  context 'when user is valid' do
    let(:user) { described_class.new(email: '', password: 'password', full_name: 'Junaid Khan sb') }

    it 'verifies and rasie issues with the user' do
      expect(user.valid?).to be_falsey
    end
  end
end
