class Task < ApplicationRecord
    belongs_to :category
    belongs_to :user

    validates :task_name , presence: true
    validates :desc , presence: true
    
end
