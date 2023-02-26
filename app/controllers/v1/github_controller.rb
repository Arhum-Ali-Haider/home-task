class V1::GithubController <  ApplicationController
  include GithubPagination

  def search
    @query = params[:q]
    per_page = 30
    if @query.present?
      @results = github_search(@query, params[:commit], per_page)
      session[:current_page] = @results[:page_number]
    end
    render :search
  end

  private

  def github_search(q, action, per_page)
    Github::V1::Repositories::ListMatchedRepos.get_repositories(q, custom_pagination(action,session[:current_page]), per_page) #service to get matching github repos
  end

end
