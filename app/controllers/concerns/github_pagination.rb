module GithubPagination
  extend ActiveSupport::Concern

  def custom_pagination(action,current_page)
    current_page ||= 1
    if action == "Previous"
      current_page -= 1 if current_page > 1
    elsif action == "Next"
      current_page += 1
    end
    current_page
  end

end