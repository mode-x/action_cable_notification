class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :recipient, class_name: "User"
  belongs_to :notifiable, polymorphic: true

  after_commit :send_notification

  def send_notification
    NotificationRelayJob.perform_async(id)
  end
end
