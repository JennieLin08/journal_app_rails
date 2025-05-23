class Category < ApplicationRecord
    belongs_to :user
    has_many :tasks

    validates :category_name , presence: true, length: {minimum: 5}
    validates :description , presence: true

end
