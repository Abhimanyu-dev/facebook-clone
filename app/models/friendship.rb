class Friendship < ApplicationRecord
    belongs_to :friend_a, class_name: "User", foreign_key: "friend_a_id"
    belongs_to :friend_b, class_name: "User", foreign_key: "friend_b_id" 
end
