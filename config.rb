###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

activate :i18n, :mount_at_root => :en
activate :directory_indexes

activate :blog do |blog|
  blog.permalink = "{lang}/guides/{device}/{product}/{title}.html"
  blog.sources = "guides/{lang}/{device}/{product}/{title}.html"
  blog.layout = "layouts/blog"
end

# Reload the browser automatically whenever files change
configure :development do
	activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
	def locale_path(path)
		path = path == "/" ? "" : "#{path}/"
		I18n.locale.to_s == "en" ? "/#{path}" : "/#{I18n.locale}/#{path}"
	end
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end
