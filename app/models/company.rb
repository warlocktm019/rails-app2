# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :member, dependent: :destroy
end
