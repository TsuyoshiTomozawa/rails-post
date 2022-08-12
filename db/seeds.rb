# users create
user = User.new(:name => 'example user', :email => 'example@railstutorial.org', :password => 'foobar')
user.save!

# posts create
50.times do
    title = Faker::Coffee.blend_name
    body = Faker::Coffee.notes
    user.posts.create!(title: title, body: body, is_draft: Post::DRAFT_OFF, is_public: Post::PUBLIC_ON)
end
