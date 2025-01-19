RSpec.describe Admin::MosquesController, type: :controller do
  context 'super admin login' do
    it 'redirects user to root_path when no login' do
      get :index
      expect(response).to have_http_status(302)
      expect(flash[:alert]).to eq('You need to sign in or sign up before continuing.')
    end

    it 'redirects user to root_path when no super admin login' do
      user = create(:user, email: 'abc@example.com', role: User::MUAZZIN)
      sign_in(user)
      get :index
      expect(response).to have_http_status(302)
      expect(flash[:notice]).to eq('You are not authorized to access this page.')
    end

    it 'returns mosque data' do
      admin_user = create(:user, email: 'abc@example.com', role: User::ADMIN)
      create(:mosque, user: admin_user)

      sign_in(admin_user)
      get :index

      expect(response).to render_template('index')
      expect(assigns(:mosques).length).to eq(1)
    end
  end
end
