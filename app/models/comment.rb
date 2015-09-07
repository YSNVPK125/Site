class Comment < ActiveRecord::Base
  attr_accessible :name, :note
  belongs_to :post
end
