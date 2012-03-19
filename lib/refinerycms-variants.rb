require 'refinerycms-base'

module Refinery
  module Variants

    class << self
      attr_accessor :root
      def root
        @root ||= Pathname.new(File.expand_path('../../', __FILE__))
      end
    end

    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      # LineItem is found in the products gem which this gem relies on
      initializer "add variants to line items" do
        LineItem.class_eval { belongs_to :variant}
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "variants"
          plugin.pathname = root
          plugin.activity = {
            :class => Variant,
            :title => 'name'
          }
        end
      end
    end
  end
end
