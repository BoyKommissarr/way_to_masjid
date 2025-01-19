RSpec.describe WelcomeController, type: :controller do
  context 'index' do
    it 'renders the page' do
      get :index

      expect(response).to render_template('index')
    end
  end

  context 'when params are valid' do
    it 'saves masjid suggestion' do
      create(:user, email: User::SUPER_ADMIN_EMAIL)
      area = create(:area, area_name: 'NIBM')

      post :create, params: { mosque: { name: 'Demo Masjid', address: 'NIBM', area_id: area.id, status: 'pending' } }

      expect(Mosque.count).to eq(1)
      expect(Mosque.first).to have_attributes(
        name: 'Demo Masjid',
        address: 'NIBM',
        status: 'pending'
      )
      expect(response).to have_http_status(:redirect)
    end
  end

  context 'when params are invalid' do
    it 'shows form validation error' do
      create(:user, email: User::SUPER_ADMIN_EMAIL)
      area = create(:area, area_name: 'NIBM')

      post :create, params: { mosque: { address: 'NIBM', area_id: area.id } }
      expect(response).to render_template('suggest')
      expect(response).to have_http_status(:unprocessable_entity)
      expect(flash[:alert]).to eq("Could not add suggestion")
    end
  end
end
