# Decide how titles appear
module ApplicationHelper
  def full_title page_title = ""
    base_title = t "rails_sample_app"
    page_title.empty? ? base_title : page_title + t("vertical_bar") + base_title
  end
end
