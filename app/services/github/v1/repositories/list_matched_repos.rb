# this service is to fetch public repositories based on search term provided.
require 'net/http'
require 'json'

module Github
  module V1
    module Repositories
      class ListMatchedRepos < ApplicationService

        private
        def self.get_user_repositories(repo_name)
          url = "https://api.github.com/search/repositories?q=#{repo_name}"
          uri = URI(url)
          response = Net::HTTP.get_response(uri)
          if response.code == '200'
            parse_result(JSON.parse(response.body))
          else
            { items: [] }
          end
        end

        def self.parse_result(result)
          {
            items: result['items']
          }
        end
      end
    end
  end
end