# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a default user
user = User.where(email: "test@tylermyracle.com").first_or_initialize
if !user.id
  user.update(
    password: "password",
    password_confirmation: "password"
  )
end

if Rails.env.development?
  100.times do |i|
    blog_post = BlogPost.where(title: "Blog Post #{i}").first_or_initialize
    blog_post.update(
      title: "Blog Post #{i}",
      content: "This is the content for Blog Post #{i}",
      published_at: Time.current
    )
  end
end

