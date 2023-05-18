# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Post.destroy_all
Comment.destroy_all
Like.destroy_all

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post from Tom')
second_post = Post.create(author: second_user, title: 'Hi', text: 'This is my first post from Lilly')
third_post = Post.create(author: first_user, title: 'How are you?', text: 'This is my second post from Tom')
fourth_post = Post.create(author: second_user, title: 'I am fine', text: 'This is my second post from Lilly')
fifth_post = Post.create(author: first_user, title: 'Goodbye', text: 'This is my third post from Tom')
sixth_post = Post.create(author: second_user, title: 'Bye', text: 'This is my third post from Lilly')
seventh_post = Post.create(author: first_user, title: 'See you later', text: 'This is my fourth post from Tom')
eighth_post = Post.create(author: second_user, title: 'See you soon', text: 'This is my fourth post from Lilly')

Comment.create(post: first_post, author: second_user, text: 'Hi Tom!')
Comment.create(post: second_post, author: first_user, text: 'Hi Lilly!')
Comment.create(post: third_post, author: second_user, text: 'How are you Tom?')
Comment.create(post: fourth_post, author: first_user, text: 'I am fine Lilly!')
Comment.create(post: fifth_post, author: first_user, text: 'Okay, Goodbye!')
Comment.create(post: sixth_post, author: second_user, text: 'Bye')

Like.create(post: first_post, author: second_user)
Like.create(post: second_post, author: first_user)
