# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Peter = User.create(name: "Peter", photo: "https://avatars2.githubusercontent.com/u/527058?s=460&v=4", bio: "I am a programmer",posts_counter: 0)
Jill = User.create(name: "Jill", photo: "https://avatars2.githubusercontent.com/u/527058?s=460&v=4", bio: "I am a programmer",posts_counter: 0)
John = User.create(name: "John", photo: "https://avatars2.githubusercontent.com/u/527058?s=460&v=4", bio: "I am a programmer",posts_counter: 0)

post_1 = Peter.posts.create(title: "First Post", text: "This is the first post", comments_counter: 0, likes_counter: 0)
post_2 = John.posts.create(title: "Second Post", text: "This is the second post", comments_counter: 0, likes_counter: 0)
post_3 = Jill.posts.create(title: "Third Post", text: "This is the third post", comments_counter: 0, likes_counter: 0)
 Peter.comments.create(text: "This is the first comment", post: post_1)
 John.comments.create(text: "This is the second comment", post: post_1)
    Jill.comments.create(text: "This is the third comment", post: post_1)
    Peter.comments.create(text: "This is the fourth comment", post: post_2)
    John.comments.create(text: "This is the fifth comment", post: post_2)
    Jill.comments.create(text: "This is the sixth comment", post: post_2)
    
