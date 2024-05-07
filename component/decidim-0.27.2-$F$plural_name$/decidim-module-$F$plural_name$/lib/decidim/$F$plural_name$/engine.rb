# frozen_string_literal: true

require "decidim/core"

module Decidim
  module $Plural_name$
    # This is the engine that runs on the public interface of `decidim-$plural_name$`.
    # It mostly handles rendering the created $singular_name$ associated to a participatory
    # process.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::$Plural_name$

      routes do
        resources :$plural_name$, only: [:show], controller: :application
        root to: "application#show"
      end

      initializer "decidim_$plural_name$.webpacker.assets_path" do
        Decidim.register_assets_path File.expand_path("app/packs", root)
      end
    end
  end
end
