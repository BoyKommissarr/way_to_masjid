RSpec.describe User do
    context 'when user is valid' do
        let(:user) { build(:user, email: '') }

        it 'verifies and rasie issues with the user' do
            expect(user.valid?).to be_falsey
        end
    end
end
