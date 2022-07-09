class FriendRequest < ApplicationRecord
    belongs_to :sender, class_name: "User"
    belongs_to :receiver, class_name: "User"

    def accept
        sender = User.find(self.sender_id)
        receiver = User.find(self.receiver_id)
        friendship = Friendship.new({friend_a_id: self.sender_id, friend_b_id: self.receiver_id})
        # if !friendship.exists?
            friendship.save()
        # end
        friendship = Friendship.new({friend_a_id: self.receiver_id, friend_b_id: self.sender_id})
        # if !friendship.exists?
            friendship.save()
        # end
        FriendRequest.find(self.id).destroy
    end
end
