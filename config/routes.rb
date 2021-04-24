# frozen_string_literal: true

Rails.application.routes.draw do
  apipie
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1, format: 'json' do
    post 'member', to: 'member#post'
    post 'schedule', to: 'schedule#post'
    get 'attendance/record', to: 'attendance#record'
    post 'attendance/record', to: 'attendance#set_record'
    get 'attendance/schedule', to: 'attendance#schedule'
    post 'attendance/schedule', to: 'attendance#set_schedule'
  end
end
