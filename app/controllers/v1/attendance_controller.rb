# frozen_string_literal: true

module V1
  class AttendanceController < ApplicationController
    resource_description do
      short '勤怠情報関連API'
      description <<-DESC
      勤怠情報関連のAPI<br>
      DESC
    end

    before_action :authenticate

    api :get, 'v1/attendance/record', '出席記録の取得'
    error code: 400, desc: 'リクエストが不正である(サーバデフォルト)'
    error code: 401, desc: '認証失敗エラー'
    error code: 500, desc: 'サーバ内部エラー(サーバデフォルト)'
    param :start_date, String, desc: '開始日(YYYY-MM-DD)', required: true
    param :end_date, String, desc: '終了日(YYYY-MM-DD)', required: true
    example <<-EXAMPLE
      {
        "start_date": "2021-01-01",
        "end_date": "2021-10-01",
        "data": [
          {
            "id": 5,
            "members_id": 3,
            "start_time": "2021-04-22T17:27:53.178Z",
            "end_time": "2021-04-22T17:27:53.178Z",
            "break_time": null,
            "work_time": null,
            "deleted_at": null,
            "created_at": "2021-04-22T17:27:53.178Z",
            "updated_at": "2021-04-22T17:27:53.178Z"
          }
        ]
      }
    EXAMPLE
    def record
      # members = ::member.where(company_id, @company.id)
      attendance_records = ::AttendanceRecord.joins(:member => :company)
                                             .where(company: { id: @company.id })
                                             .where('attendance_records.start_time >= ?', params[:start_date])
                                             .where('attendance_records.end_time <= ?', params[:end_date])
      render json: {
        start_date: params[:start_date],
        end_date: params[:end_date],
        data: attendance_records
      }, status: :ok and return
    end

    api :post, 'v1/attendance/record', '出席記録の取得'
    error code: 400, desc: 'リクエストが不正である(サーバデフォルト)'
    error code: 401, desc: '認証失敗エラー'
    error code: 500, desc: 'サーバ内部エラー(サーバデフォルト)'
    param :data, Array, of: Hash do
      param :members_id, Int, required: true
      param :start_time, String, required: true
      param :end_time, String, required: true
      param :break_time, String, required: false, allow_nil: true
      param :work_time, String, required: false, allow_nil: true
    end
    example <<-EXAMPLE
      {
        "error": null
      }
    EXAMPLE
    def set_record
      now = DateTime.current
      attendance_records = params[:data].map do |item|
        item[:created_at] = now
        item[:updated_at] = now
        item
      end
      # =====================
      #        TODO
      # =====================
      # Fetch all members by company_id = @company.id
      # Delete all AttendanceRecord where members_id = [members.id] from result above
      # Fix rubocop errors
      ::AttendanceRecord.insert_all(attendance_records)
      render json: { error: nil, data: attendance_records }, status: :ok and return
    end

    api :get, 'v1/attendance/schedule', '出席スケジュール'
    error code: 400, desc: 'リクエストが不正である(サーバデフォルト)'
    error code: 401, desc: '認証失敗エラー'
    error code: 500, desc: 'サーバ内部エラー(サーバデフォルト)'
    param :start_date, String, desc: '開始日(YYYY-MM-DD)', required: true
    param :end_date, String, desc: '終了日(YYYY-MM-DD)', required: true
    example <<-EXAMPLE
      {
        "start_date": "2021-01-01",
        "end_date": "2021-10-01",
        "data": [
          {
            "id": 5,
            "members_id": 3,
            "start_time": "2021-04-22T17:27:53.178Z",
            "end_time": "2021-04-22T17:27:53.178Z",
            "break_time": null,
            "work_time": null,
            "deleted_at": null,
            "created_at": "2021-04-22T17:27:53.178Z",
            "updated_at": "2021-04-22T17:27:53.178Z"
          }
        ]
      }
    EXAMPLE
    def schedule
      attendance_schedules = ::AttendanceSchedule.joins(:member => :company)
                                                 .where(company: { id: @company.id })
                                                 .where('attendance_schedules.start_time >= ?', params[:start_date])
                                                 .where('attendance_schedules.end_time <= ?', params[:end_date])
      render json: {
        start_date: params[:start_date],
        end_date: params[:end_date],
        data: attendance_schedules
      }, status: :ok and return
    end

    api :post, 'v1/attendance/schedule', '出席記録の取得'
    error code: 400, desc: 'リクエストが不正である(サーバデフォルト)'
    error code: 401, desc: '認証失敗エラー'
    error code: 500, desc: 'サーバ内部エラー(サーバデフォルト)'
    param :data, Array, of: Hash do
      param :members_id, Int, required: true
      param :start_time, String, required: true
      param :end_time, String, required: true
      param :break_time, String, required: false, allow_nil: true
      param :work_time, String, required: false, allow_nil: true
    end
    example <<-EXAMPLE
      {
        "error": null
      }
    EXAMPLE
    def set_schedule
      now = DateTime.current
      attendance_schedules = params[:data].map do |item|
        item[:created_at] = now
        item[:updated_at] = now
        item
      end
      # =====================
      #        TODO
      # =====================
      # Fetch all members by company_id = @company.id
      # Delete all AttendanceSchedule where members_id = [members.id] from result above
      # Fix rubocop errors
      ::AttendanceSchedule.insert_all(attendance_schedules)
      render json: { error: nil, data: attendance_schedules }, status: :ok and return
    end
  end
end
