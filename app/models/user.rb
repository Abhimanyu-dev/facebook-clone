class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :homepage, dependent: :destroy
  has_many :friend_requests, foreign_key: "sender_id", dependent: :delete_all
  has_many :pending_requests, foreign_key: "receiver_id", class_name: "FriendRequest", dependent: :delete_all

  has_many :friendships, foreign_key: "friend_a_id", dependent: :delete_all
  has_many :friendship_inverse, class_name: "Friendship", foreign_key: "friend_b_id", dependent: :delete_all
  
  has_many :posts, dependent: :delete_all

  has_many :likes

  def friend_id
    friend_ids = []
    self.friendships.each do |friendship|
      id = friendship.friend_b_id
      friend_ids.append(id)
    end
    return friend_ids
  end

  def friends
    friend_ids = []
    self.friendships.each do |friendship|
      id = friendship.friend_b_id
      friend_ids.append(id)
    end
    friends_arr = []
    friend_ids.each do |id|
      friend =  User.find(id)
      friends_arr.append(friend)
    end
    return friends_arr
  end

  def friends_count
    friend_arr = self.friends
    return friend_arr.length
  end

  def is_friend?(current_user)
    if current_user.friend_id.include?(self.id)
      return true
    else
      return false
    end
  end

  def request_pending(current_user)
    current_user.friend_requests.each do |request|
      if request.receiver_id == self.id
        return true
      end
    end
    return false
  end
end
