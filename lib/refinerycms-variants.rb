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

      # Lets inject our relationship into Product and LineItem classes
      config.to_prepare do

        Product.class_eval do
          require 'variant'
          self.has_many :variants
        end

        LineItem.class_eval do
          require 'variant'
          self.belongs_to :variant
        end

      end

      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
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

