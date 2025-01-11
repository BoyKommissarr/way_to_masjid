RSpec.describe SalahTimingsController, type: :controller do
  let(:user) { create(:user) }
  
 context "new" do
    it 'renders new page form' do 
      sign_in(user)
      mosque = create(:mosque, user:)

      get :new, params: {mosque_id:mosque.id}

      expect(response).to have_http_status(:ok)
      expect(response).to render_template('new')
    end
  end

  context "create" do
    fit "successfully add new salah request" do
      sign_in(user)
      mosque = create(:mosque, user:)

      post :create, params: {mosque_id: mosque.id, salah_timing: {name: "fajr", timing:"6:40"} }

      expect(response).to have_http_status(302)

      expect(SalahTiming.last.name).to eq("fajr")
      expect(SalahTiming.last.timing).to eq("6:40")
    end
    
  end

  context "edit" do
    it 'it renders edit page' do
      sign_in(user)
      mosque = create(:mosque, user:)
      salah_timing = create(:salah_timing, :fajr, mosque:)
  
      get :edit, params: { mosque_id: mosque.id, id: salah_timing.id}
      expect(response).to have_http_status(:ok)
      expect(response).to render_template('edit')
    end
  end
end
  