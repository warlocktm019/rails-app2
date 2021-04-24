# frozen_string_literal: true

module V1
  class MemberController < ApplicationController
    resource_description do
      short 'メンバーリスト関連API'
      description <<-DESC
      メンバーリスト関連のAPI<br>
      DESC
    end

    api :post, 'v1/member', 'メンバーリストCSVアップロード'
    error code: 400, desc: 'リクエストが不正である(サーバデフォルト)'
    error code: 401, desc: '認証失敗エラー'
    error code: 500, desc: 'サーバ内部エラー(サーバデフォルト)'
    param :access_key, String, desc: 'アクセスキー', required: true
    example <<-EXAMPLE
    氏名,メールアドレス,職種.契約形態.勤務地,マネージャーになるチーム,メンバーになるチーム
    EXAMPLE
    def post
      render json: {}, status: :ok and return
    end
  end
end
