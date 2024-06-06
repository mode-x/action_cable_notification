class NotificationRelayJob
  include Sidekiq::Job

  def perform(id)
    notification = Notification.find(id)

    template = %(
      <turbo-stream action="append" target="notifications">
        <template>
          <p class="title is-6">Notification #{id}</p>
        </template>
      </turbo-stream>
    )

    ActionCable.server.broadcast("notifications:#{notification.recipient_id}", {html: template})

    (1..100).each do |i|
      ActionCable.server.broadcast("notifications:#{notification.recipient_id}", {html: template})
    end
  end
end
