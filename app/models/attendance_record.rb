# frozen_string_literal: true

class AttendanceRecord < ApplicationRecord
  belongs_to :member, foreign_key: 'members_id'
end
