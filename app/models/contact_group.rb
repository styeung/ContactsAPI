class ContactGroup < ActiveRecord::Base

  validates :name, :user_id, :presence => true
  validates :name, :uniqueness => {scope: :user_id,
    message: "should have unique user_id"}

  belongs_to(
    :user,
    :class_name => "User",
    :foreign_key => :user_id,
    :primary_key => :id
  )
end
