class User < ActiveRecord::Base
  validates :username, uniqueness: true, presence: true

  has_many(
    :contacts,
    :class_name => "Contact",
    :foreign_key => :user_id,
    :primary_key => :id
  )

end
