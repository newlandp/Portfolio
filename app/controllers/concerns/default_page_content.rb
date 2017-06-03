module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_filter :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Paul Isaac Newland"
    @seo_keywords = "Paul Newland Portfolio"
  end
end