module RailsAudit::Audit
  extend ActiveSupport::Concern
  included do
    attribute :audited_changes, :json, default: {}
    attribute :related_changes, :json, default: {}
    attribute :unconfirmed_changes, :json, default: {}
    attribute :extra, :json, default: {}

    belongs_to :audited, polymorphic: true
    belongs_to :operator, polymorphic: true
  end

  def audited_changes_i18n
    audited_changes.transform_keys { |key| audited.class.human_attribute_name(key) }
  end

end
