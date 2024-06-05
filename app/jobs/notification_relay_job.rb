class NotificationRelayJob
  include Sidekiq::Job

  def perform(id)
    # notification = Notification.find(id)
    # html = Application.render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: { notification: notification }, formats: [:html]
    # ActionCable.server.broadcast "notifications:#{notification.recipient_id}", html: html

    ActionCable.server.broadcast("notifications:1", {html: "<div>Hello!!!</div>"})
  end
end
