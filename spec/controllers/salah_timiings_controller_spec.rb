Rspec.describe SalahTimingsController, type: :controller do
  context "edit" do
  it 'it renders edit page' do
    sign_in(user)
    name = create(:name, salah_name: "Fajar")
    salah_timing = create(:salah_timing, salah_timing: "06.40", name:)
  
    get :edit, params: { id: mosque.id }
    expect(response)
  end
  end
  end
  