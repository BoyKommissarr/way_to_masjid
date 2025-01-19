class BackFillUsersRole < ActiveRecord::Migration[8.0]
  def up
    ActiveRecord::Base.transaction do
      User.all.each do |user|
        if user.email == "ntsuperadmin@namaztime.com"
          user.update!(role: User::ADMIN)
        else
          user.update!(role: User::MUAZZIN)
        end
      end
    end
  end
end
