class Job < ApplicationRecord
    def self.search(searchword)
     self.where("lower(name) LIKE ? OR lower(description) LIKE ? OR lower(location) LIKE ? " , "%#{searchword}%" , "%#{searchword}%" , "%#{searchword}%")
    end
end
