# frozen_string_literal: true

require "decidim/components/namer"

Decidim.register_component(:$plural_name$) do |component|
  component.engine = Decidim::$Plural_name$::Engine
  component.admin_engine = Decidim::$Plural_name$::AdminEngine
  component.icon = "media/images/decidim_pages.svg"
  component.serializes_specific_data = true
  component.specific_data_serializer_class_name = "Decidim::$Plural_name$::DataSerializer"
  component.specific_data_importer_class_name = "Decidim::$Plural_name$::DataImporter"
  component.permissions_class_name = "Decidim::$Plural_name$::Permissions"

  component.query_type = "Decidim::$Plural_name$::$Plural_name$Type"

  component.on(:create) do |instance|
    Decidim::$Plural_name$::Create$Singular_name$.call(instance) do
      on(:invalid) { raise "Can't create $singular_name$" }
    end
  end

  component.on(:destroy) do |instance|
    Decidim::$Plural_name$::Destroy$Singular_name$.call(instance) do
      on(:error) { raise "Can't destroy $singular_name$" }
    end
  end

  component.on(:copy) do |context|
    Decidim::$Plural_name$::Copy$Singular_name$.call(context) do
      on(:invalid) { raise "Can't duplicate $singular_name$" }
    end
  end

  component.register_stat :$plural_name$_count do |components, start_at, end_at|
    $plural_name$ = Decidim::$Plural_name$::$Singular_name$.where(component: components)
    $plural_name$ = $plural_name$.where("created_at >= ?", start_at) if start_at.present?
    $plural_name$ = $plural_name$.where("created_at <= ?", end_at) if end_at.present?
    $plural_name$.count
  end

  component.settings(:global) do |settings|
    settings.attribute :announcement, type: :text, translated: true, editor: true
  end

  component.settings(:step) do |settings|
    settings.attribute :announcement, type: :text, translated: true, editor: true
  end

  component.register_resource(:$singular_name$) do |resource|
    resource.model_class_name = "Decidim::$Plural_name$::$Singular_name$"
  end

  component.seeds do |participatory_space|
    component = Decidim::Component.create!(
      name: Decidim::Components::Namer.new(participatory_space.organization.available_locales, :$plural_name$).i18n_name,
      manifest_name: :$plural_name$,
      published_at: Time.current,
      participatory_space: participatory_space
    )

    Decidim::$Plural_name$::$Singular_name$.create!(
      component: component,
      body: Decidim::Faker::Localized.wrapped("<p>", "</p>") do
        Decidim::Faker::Localized.paragraph(sentence_count: 3)
      end
    )
  end
end
