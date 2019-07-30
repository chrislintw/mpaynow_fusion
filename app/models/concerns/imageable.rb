# frozen_string_literal: true

module Imageable
  extend ActiveSupport::Concern
  included do
    has_one_attached :image, dependent: false
  end
  def image_url(options = {})
    return '/images/default_image2x.png' unless image.attached?

    full = options.delete(:full)
    size = options.delete(:size) || '160x160'
    if full
      Rails.application.routes.url_helpers.rails_representation_url image.variant(resize: size), host: Rails.application.config.domain_url
    else
      Rails.application.routes.url_helpers.rails_representation_url image.variant(resize: size), only_path: true
    end
  end
end
