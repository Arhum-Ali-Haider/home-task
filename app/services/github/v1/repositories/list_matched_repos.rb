# this service is to fetch public repositories based on search term provided.
require 'net/http'
require 'json'


module Github::V1::Repositories
  class ListMatchedRepos < ApplicationService

    private
    def self.get_repositories(repo_name, page, per_page)
      url = "https://api.github.com/search/repositories?q=#{repo_name}&page=#{page}&per_page=#{per_page}"
      uri = URI(url)
      response = Net::HTTP.get_response(uri)
      if response.code == '200'
        parse_result(JSON.parse(response.body),page)
      else
        { items: [] }
      end
    end

    def self.parse_result(result,page)
      {
        items: result['items'],
        page_number: page
      }
    end
  end
end