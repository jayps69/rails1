class Article < ApplicationRecord
    include Visible

    paginates_per 15

    #resourcify
    

    #has_many :users, -> { distinct }, through: :roles, class_name: 'User', source: :users
    #has_many :moderators, -> { where(:roles => {name: :moderator}) }, through: :roles, class_name: 'User', source: :users
  
    has_many :comments, dependent: :destroy
    belongs_to :user
  
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
  end
  