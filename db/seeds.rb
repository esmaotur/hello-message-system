# Veritabanını temizle
puts "Cleaning database..."
Reaction.destroy_all
Message.destroy_all
Conversation.destroy_all
Category.destroy_all
User.destroy_all

# Kullanıcılar oluştur
puts "Creating users..."
user1 = User.create!(name: "Ahmet Yılmaz", email: "ahmet@example.com")
user2 = User.create!(name: "Ayşe Demir", email: "ayse@example.com")
user3 = User.create!(name: "Mehmet Kaya", email: "mehmet@example.com")

# Kategoriler oluştur
puts "Creating categories..."
cat1 = Category.create!(name: "Greeting", description: "Hello and welcome messages")
cat2 = Category.create!(name: "Question", description: "Questions and inquiries")
cat3 = Category.create!(name: "Farewell", description: "Goodbye messages")

# Konuşmalar oluştur
puts "Creating conversations..."
conv1 = Conversation.create!(title: "Morning Greetings")
conv2 = Conversation.create!(title: "Project Discussion")
conv3 = Conversation.create!(title: "Weekend Plans")

# Mesajlar oluştur
puts "Creating messages..."
msg1 = Message.create!(
  content: "Hello everyone! Good morning!",
  user: user1,
  category: cat1,
  conversation: conv1
)

msg2 = Message.create!(
  content: "Hello Ahmet! How are you today?",
  user: user2,
  category: cat1,
  conversation: conv1
)

msg3 = Message.create!(
  content: "Hi! I have a question about the project.",
  user: user3,
  category: cat2,
  conversation: conv2
)

msg4 = Message.create!(
  content: "Hello! Sure, what would you like to know?",
  user: user1,
  category: cat2,
  conversation: conv2
)

msg5 = Message.create!(
  content: "Goodbye everyone! See you tomorrow!",
  user: user2,
  category: cat3,
  conversation: conv1
)

# Tepkiler oluştur
puts "Creating reactions..."
Reaction.create!(reaction_type: "👍", user: user2, message: msg1)
Reaction.create!(reaction_type: "❤️", user: user3, message: msg1)
Reaction.create!(reaction_type: "👍", user: user1, message: msg2)
Reaction.create!(reaction_type: "🤔", user: user2, message: msg3)
Reaction.create!(reaction_type: "👋", user: user3, message: msg5)

puts "✅ Seed data created successfully!"
puts "📊 Summary:"
puts "  - #{User.count} users"
puts "  - #{Category.count} categories"
puts "  - #{Conversation.count} conversations"
puts "  - #{Message.count} messages"
puts "  - #{Reaction.count} reactions"
