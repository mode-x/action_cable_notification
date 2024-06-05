class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :recipient, class_name: "User"
  belongs_to :notifiable, polymorphic: true

  after_commit { ActionCable.server.broadcast("notifications:1", {html: "<div>Hello!!!</div>"}) }
end
