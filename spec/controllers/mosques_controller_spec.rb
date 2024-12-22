RSpec.describe MosquesController, type: :controller do
  let(:user) { create(:user) }

  context 'index' do
    it 'returns mosque data' do
      sign_in(user)
      get :index

      expect(response).to render_template('index')
      expect(assigns(:mosques).length).to eq(Mosque.all.length)
    end
  end

  context 'with search page' do
    context 'when only search page rendering' do
      it 'renders search page' do
        get :search

        expect(response).to have_http_status(:ok)
        expect(response).to render_template('search')
      end
    end

    context 'search page with results' do
      it 'returns search result' do
        area = create(:area, area_name: 'Kausar Bagh')
        mosque = create(:mosque, name: 'Kausar Bagh Masjid', area:)

        get :search, params: { query: mosque.id }
        expect(response).to have_http_status(:ok)
        expect(assigns(:mosques).length).to eq(1)
        expect(assigns(:mosques).first.name).to eq('Kausar Bagh Masjid')
      end
    end
  end
end
