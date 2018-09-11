module PushNotifications
  module Creator
    class Post < Base
      private

      def title
        event.post.title
      end

      def body
        event.post.description&.truncate(20) || 'No description'
      end

      def data
        if event.post.class.to_s == 'Offer'
          { url: Rails.application.routes.url_helpers.offer_path(event.post) }
        elsif event.post.class.to_s == 'Inquiry'
          { url: Rails.application.routes.url_helpers.inquiry_path(event.post) }
        else
          {}
        end
      end
    end
  end
end
