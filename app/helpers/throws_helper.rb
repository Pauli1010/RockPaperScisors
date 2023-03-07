# frozen_string_literal: true

module ThrowsHelper
  def throw_link(element)
    link_to throws_path(value: element),
            method: :post,
            class: "throw-btn throw-btn-js #{element}-btn",
            data: { value: element } do
      content_tag(:span, element.capitalize)
    end
  end
end
