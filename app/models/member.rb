# frozen_string_literal: true

class Member < ApplicationRecord
  belongs_to :company
  has_many :attendance_record, dependent: :destroy
  has_many :attendance_schedule, dependent: :destroy
end
