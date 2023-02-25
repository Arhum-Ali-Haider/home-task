class V1::GithubController <  ApplicationController

  def search
    @query = params[:q]
    @results = github_search(@query) if @query.present?
    render :search
  end

  private

  def github_search(q)
    Github::V1::Repositories::ListMatchedRepos.get_user_repositories(q) #service to get matching github repos
  end

end
