# frozen_string_literal: true

module Decidim
  module $Plural_name$
    # Command that gets called whenever a component's $singular_name$ has to be created. It
    # usually happens as a callback when the component itself is created.
    class Create$Singular_name$ < Decidim::Command
      def initialize(component)
        @component = component
      end

      def call
        @$singular_name$ = $Singular_name$.new(component: @component)

        @$singular_name$.save ? broadcast(:ok) : broadcast(:invalid)
      end
    end
  end
end
