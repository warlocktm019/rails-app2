# frozen_string_literal: true

class InitSchema < ActiveRecord::Migration[5.1] # rubocop:disable Metrics/ClassLength
  def up # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    create_table 'companies', force: :cascade do |t|
      t.string 'name', null: false
      t.string 'address', null: false
      t.string 'phone', null: false
      t.string 'email', null: false
      t.integer 'plan', null: false
      t.datetime 'start_time', null: false
      t.datetime 'end_time'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.bigint 'master_member_id'
      t.integer 'limit_member_number'
      t.datetime 'deleted_at'
      t.datetime 'track_start_time', default: '1970-01-01 00:00:00', null: false
      t.datetime 'track_stop_time', default: '1970-01-01 23:59:59', null: false
      t.index ['master_member_id'], name: 'index_companies_on_master_member_id'
    end
    create_table 'member_details', primary_key: 'member_id', id: :bigint, default: nil, force: :cascade do |t|
      t.string 'contract'
      t.string 'place'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.datetime 'deleted_at'
      t.string 'app_version'
      t.string 'db_version'
      t.string 'platform'
      t.index ['member_id'], name: 'index_member_details_on_member_id'
    end
    create_table 'members', force: :cascade do |t|
      t.bigint 'company_id'
      t.string 'name', limit: 30, null: false
      t.string 'email', null: false
      t.string 'password_digest', default: '', null: false
      t.string 'token', null: false
      t.integer 'sign_in_count', default: 0, null: false
      t.datetime 'current_sign_in_at'
      t.datetime 'last_sign_in_at'
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.datetime 'deleted_at'
      t.index ['company_id'], name: 'index_members_on_company_id'
    end
    add_foreign_key 'companies', 'members', column: 'master_member_id'
  end

  def down
    raise ActiveRecord::IrreversibleMigration, 'The initial migration is not revertable'
  end
end
