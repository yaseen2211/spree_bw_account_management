source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'spree', github: 'spree/spree', branch: 'master'
# Provides basic authentication functionality for testing parts of your engine
gem 'spree_auth_devise', github: 'spree/spree_auth_devise', branch: 'master'
gem 'rails-controller-testing'
gem 'spree_multi_vendor', github: 'spree-contrib/spree_multi_vendor'
gem 'spree_reviews', github: 'spree-contrib/spree_reviews'
gem 'spree_html_invoice', git: 'https://github.com/vinsol-spree-contrib/spree-html-invoice', branch: 'master'
gem 'rubocop', require: false
gem 'rubocop-rspec', require: false

gemspec
