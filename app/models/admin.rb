# == Schema Information
#
# Table name: admins
#
#  id              :integer          not null, primary key
#  name            :string
#  avater          :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Admin < ApplicationRecord
  include JsonWebTokenAble
  has_secure_password
end
