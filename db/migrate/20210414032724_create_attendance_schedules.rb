# coding: utf-8
class CreateAttendanceSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :attendance_schedules do |t|
      t.references :members, foreign_key: true
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.interval :break_time
      t.interval :work_time
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
