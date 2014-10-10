module Redacted
  class Railtie < ::Rails::Railtie
    initializer "redacted.configure_view_controller" do |app|
      ActiveSupport.on_load :action_view do
        include Redacted::ActionView::Helpers
      end
    end
  end
end
