# frozen_string_literal: true

module Decidim
  module $Plural_name$
    # Command that gets called when the $singular_name$ of this component needs to be
    # destroyed. It usually happens as a callback when the component is removed.
    class Destroy$Singular_name$ < Decidim::Command
      def initialize(component)
        @component = component
      end

      def call
        $Singular_name$.where(component: @component).destroy_all
        broadcast(:ok)
      end
    end
  end
end
