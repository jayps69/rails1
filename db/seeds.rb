# 20.times do
#     user = User.new(
#       email: Faker::Internet.unique.email,
#       password: 'password123',
#       password_confirmation: 'password123'
#     )
  
#     if user.save
#       puts "User created successfully."
#     else
#       puts "Error creating user: #{user.errors.full_messages.join(", ")}"
#     end
#   end

# Create Users
20.times do
    user = User.new(
      email: Faker::Internet.unique.email,
      password: 'password123',
      password_confirmation: 'password123'
    )
    
    if user.save
      puts "User #{user.email} created successfully."
    else
      puts "Error creating user: #{user.errors.full_messages.join(", ")}"
    end
  end
  
  # Create Articles
50.times do
    article = Article.new(
      title: Faker::Lorem.sentence(word_count: 4),  # A sentence that sounds like a title
      body: Faker::Lorem.paragraphs(number: 2).join("\n\n") + "\n\n" + Faker::Quote.famous_last_words,  # Add some paragraphs with a famous quote at the end
      status: "public",  # Set status to "public"
      user_id: User.all.sample.id  # Randomly assign a user from the existing users
    )
  
    if article.save
      puts "Article '#{article.title}' created successfully."
    else
      puts "Error creating article: #{article.errors.full_messages.join(", ")}"
    end
  end
  
  