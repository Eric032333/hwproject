class Candidate < ApplicationRecord
    validates :name , presence: true  
    validates :age , presence: true 
    
    has_many :vote_logs
end
