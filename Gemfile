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

gem 'spree_sales', github: 'ronzalo/spree_sales', branch: 'master'
gem 'spree_bw_page_contents', github: 'omairrazam/spree_bw_page_contents'
gem 'spree_wishlist', github: 'yaseen2211/spree_wishlist', branch: '3-0-stable'
gem 'spree_i18n', github: 'spree-contrib/spree_i18n'
gem 'spree_globalize', github: 'yaseen2211/spree_globalize'

gem 'rubocop', require: false
gem 'rubocop-rspec', require: false

gemspec
