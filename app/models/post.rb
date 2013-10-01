class Post < ActiveRecord::Base
  validates :title,    :presence => true,
                       :length => { :minimum => 5 }
  validates :content,  :presence => true,
                       :length => { :minimum => 4 }
  validates :bgcolor,  :presence => true,
                       :length => { :minimum => 7 }
  has_many  :comments, :dependent => :destroy
  has_many  :tags
  
  has_friendly_id :title, :use_slug => true,
                  :approximate_ascii => true,
                  :max_length => 50
  
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
