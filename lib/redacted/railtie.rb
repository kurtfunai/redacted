module Redacted
  module Rails
    class Railtie < ::Rails::Railtie
      config.redacted = true
    end
  end
end
