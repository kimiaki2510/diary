class Like < ApplicationRecord
  belongs_to :user
  #counter_cahce: :like_countはリレーションされているlikeの数をリレーション先のlikes_countというカラムの値に入れる
  belongs_to :record
end
