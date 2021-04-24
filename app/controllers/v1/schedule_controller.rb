# frozen_string_literal: true

module V1
  class ScheduleController < ApplicationController
    resource_description do
      short '勤怠情報関連API'
      description <<-DESC
      勤怠情報関連のAPI<br>
      DESC
    end

    api :post, 'v1/schedule', '勤怠情報リストCSVアップロード'
    error code: 400, desc: 'リクエストが不正である(サーバデフォルト)'
    error code: 401, desc: '認証失敗エラー'
    error code: 500, desc: 'サーバ内部エラー(サーバデフォルト)'
    param :access_key, String, desc: 'アクセスキー', required: true
    example <<-EXAMPLE
    メンバーID,対象日付,開始時間,終了時間,休憩時間,勤務時間,
    EXAMPLE
    def post
      render json: {}, status: :ok and return
    end
  end
end
