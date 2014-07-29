class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates :email, uniqueness: { scope: :user_id,
    message: "should have unique user_id"
  }

  belongs_to(
    :owner,
    :class_name => "User",
    :foreign_key => :user_id,
    :primary_key => :id
  )

  has_many(
    :shares, :dependent => :destroy,
    :class_name => "ContactShare",
    :foreign_key => :contact_id,
    :primary_key => :id
  )

  has_many(
    :shared_users,
    :through => :shares,
    :source => :user
  )

  has_many(
    :memberships,
    :class_name => "GroupMembership",
    :foreign_key => :contact_id,
    :primary_key => :id
  )

  has_many(
    :contact_groups,
    :through => :memberships,
    :source => :group
  )
end
