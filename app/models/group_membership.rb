class GroupMembership < ActiveRecord::Base
  validates :group_id, :contact_id, presence: true
  validates :contact_id, uniqueness: {scope: :group_id,
    message: "can only belong to a group once"}

  belongs_to(
    :group,
    :class_name => "ContactGroup",
    :foreign_key => :group_id,
    :primary_key => :id
  )

  belongs_to(
    :contact,
    :class_name => "Contact",
    :foreign_key => :contact_id,
    :primary_key => :id
  )
end
