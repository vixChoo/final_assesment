class Testing < ApplicationRecord
    has_many :test_jobs
    has_many :jobs, through: :test_jobs

     validates :name, presence: true
end
