# frozen_string_literal: true

class AttendanceSchedule < ApplicationRecord
  belongs_to :member, inverse_of: :attendance_schedules, foreign_key: 'members_id'

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def self.insert_all_by_company_id(company_id, data)
    # remove all attendance schedule of company members
    members = Member.select(:id).where(company_id: company_id).all
    AttendanceSchedule.where(members_id: members.map(&:id)).delete_all unless members.empty?
    created = []
    # add attandance schedule only to register members_id
    data.each do |d|
      next unless members.any? { |m| m[:id] == d[:members_id] }

      created << AttendanceSchedule.create(members_id: d[:members_id],
                                           start_time: d[:start_time],
                                           end_time: d[:end_time],
                                           break_time: d[:break_time],
                                           work_time: d[:work_time])
    end
    created
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
end
