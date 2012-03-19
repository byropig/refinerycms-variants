require 'refinerycms-base'

module Refinery
  module Variants
    module ProductExtender
      def self.included(model)
        model.send :include, MethodsToCall
      end

      module MethodsToCall
        def self.included(m)
          m.has_many :variants
        end
      end
    end
  end
end

module Refinery
  module Variants
    module LineItemExtender
      def self.included(model)
        model.send :include, MethodsToCall
      end

      module MethodsToCall
        def self.included(m)
          m.belongs_to :variant
        end
      end
    end
  end
end

module Refinery
  module Variants

    class << self
      attr_accessor :root
      def root
        @root ||= Pathname.new(File.expand_path('../../', __FILE__))
      end
    end

    class Engine < Rails::Engine

      config.to_prepare do
        LineItem.send :include, Refinery::Variants::LineItemExtender
        Product.send :include, Refinery::Variants::ProductExtender

        Product.class_eval do
          has_many :variants
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

