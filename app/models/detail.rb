class Detail < ApplicationRecord
  belongs_to :person, dependent: :destroy
  validates :email, presence: true
end
