class Job < ApplicationRecord
    belongs_to :user

     validates :name, presence: true
     validates :description, presence: true
     validates :location, presence: true
     validates :price, presence: true
     
    def self.search(searchword)
     self.where("lower(name) LIKE ? OR lower(description) LIKE ? OR lower(location) LIKE ? " , "%#{searchword}%" , "%#{searchword}%" , "%#{searchword}%")
    end
end
