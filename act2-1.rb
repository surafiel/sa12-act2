require 'httparty'

def analyze_github_repositories(surafiel)
  url = "https://api.github.com/users/#{surafiel}/repos"
  response = HTTParty.get(url)
  repositories = JSON.parse(response.body)
  
  most_starred_repo = repositories.max_by { |repo| repo['stargazers_count'] }
  
  puts "Most Starred Repository:"
  puts "Name: #{most_starred_repo['name']}"
  puts "Description: #{most_starred_repo['description']}"
  puts "Stars: #{most_starred_repo['stargazers_count']}"
  puts "URL: #{most_starred_repo['html_url']}"
end

# Example usage:
analyze_github_repositories('octocat')