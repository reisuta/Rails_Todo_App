# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { 'テストを書く' }
    description { 'Rspecを準備する' }
    user
  end
end
