# frozen_string_literal: true

module Languages
  extend ActiveSupport::Concern
  included do
    validates :language, presence: true
  end

  extend Enumerize

  LANGUAGE_LIST = { en: 1, 'zh-hk' => 2, 'zh-tw' => 3, 'zh-cn' => 4, jp: 5, kr: 6 }.freeze

  enumerize :language,
            in: LANGUAGE_LIST,
            default: :en,
            predicates: true
end
