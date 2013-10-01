class Comment < ActiveRecord::Base
  belongs_to :post

  validates_presence_of :commenter
  validates_presence_of :body

  #validates :body,         :presence => true,
  #                         :length => { :minimum => 10 }
end
