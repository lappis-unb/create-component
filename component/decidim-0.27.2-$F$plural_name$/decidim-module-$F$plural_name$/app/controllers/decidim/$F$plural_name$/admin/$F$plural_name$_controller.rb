# frozen_string_literal: true

module Decidim
  module $Plural_name$
    module Admin
      # This controller allows the user to update a $Singular_name$.
      class $Plural_name$Controller < Admin::ApplicationController
        def edit
          enforce_permission_to :update, :$singular_name$

          @form = form(Admin::$Singular_name$Form).from_model($singular_name$)
        end

        def update
          enforce_permission_to :update, :$singular_name$

          @form = form(Admin::$Singular_name$Form).from_params(params)

          Admin::Update$Singular_name$.call(@form, $singular_name$) do
            on(:ok) do
              flash[:notice] = I18n.t("$Plural_name$.update.success", scope: "decidim.$Plural_name$.admin")
              redirect_to parent_path
            end

            on(:invalid) do
              flash.now[:alert] = I18n.t("$Plural_name$.update.invalid", scope: "decidim.$Plural_name$.admin")
              render action: "edit"
            end
          end
        end

        private

        def $singular_name$
          @$singular_name$ ||= $Plural_name$::$Singular_name$.find_by(component: current_component)
        end
      end
    end
  end
end
