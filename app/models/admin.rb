# == Schema Information
#
# Table name: admins
#
#  id              :integer          not null, primary key
#  name            :string
#  avatar          :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Admin < ApplicationRecord
  include JsonWebTokenAble
  mount_uploader :avatar, AvatarUploader
  has_secure_password
end
