# frozen_string_literal: true

module Decidim
  module $Plural_name$
    # This is the admin interface for `decidim-$plural_name$`. It lets you edit and
    # configure the $singular_name$ associated to a participatory process.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::$Plural_name$::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        post "/", to: "$plural_name$#update", as: :$singular_name$
        root to: "$plural_name$#edit"
      end

      def load_seed
        nil
      end
    end
  end
end
