class Area < ApplicationRecord
    validates :area_name, presence: true, uniqueness: true
end
