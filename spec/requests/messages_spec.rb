# spec/requests/messages_spec.rb
require "rails_helper"

RSpec.describe "Messages API", type: :request do  let!(:user) { User.create!(name: "Esma", email: "esma@example.com") }
  let!(:category) { Category.create!(name: "Genel", description: "Genel mesajlar") }
  let!(:conversation) { Conversation.create!(title: "Test Konuşması") }

  describe "POST /api/v1/messages" do
    it "boş content gönderilirse 422 döndürür" do
      post "/api/v1/messages", params: {
        message: {
          content: "",
          user_id: user.id,
          category_id: category.id,
          conversation_id: conversation.id
        }
      }

      expect(response.status).to eq(422)
      body = JSON.parse(response.body) rescue {}
      expect(body.to_s.downcase).to include("can't be blank")
    end

    it "geçerli content ile 201 döndürür ve mesajı döner" do
      post "/api/v1/messages", params: {
        message: {
          content: "Merhaba Mimi!",
          user_id: user.id,
          category_id: category.id,
          conversation_id: conversation.id
        }
      }

      expect(response.status).to eq(201)
      body = JSON.parse(response.body)
      expect(body["content"]).to eq("Merhaba Mimi!")
    end
  end

  describe "GET /api/v1/messages" do
    it "200 döndürür ve mesajları listeler" do
      get "/api/v1/messages"
      expect(response.status).to eq(200)
    end
  end
end
