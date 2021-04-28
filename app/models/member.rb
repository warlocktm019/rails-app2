# frozen_string_literal: true

class Member < ApplicationRecord
  belongs_to :company
  has_many :attendance_records, dependent: :destroy
  has_many :attendance_schedules, dependent: :destroy
end
