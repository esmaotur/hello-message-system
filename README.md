# Hello Message System - Ruby on Rails API

Bu proje, Ruby on Rails ile geliştirilmiş 5 modelli bir mesajlaşma API'sidir.

## 👨‍🎓 Öğrenci Bilgileri

- **Ad Soyad:** Esma Otur
- **E-posta:** 231118003@samsun.edu.tr
- **Üniversite:** Samsun Üniversitesi

## 📋 Proje Açıklaması

Kullanıcıların birbirlerine mesaj gönderebileceği, mesajları kategorilere ayırabileceği ve tepki verebileceği bir API sistemi.

## 🏗️ Modeller ve İlişkiler

### 1. User (Kullanıcı)

- **Alanlar:** `name`, `email`
- **İlişkiler:**
  - Birçok Message'a sahip
  - Birçok Reaction'a sahip
  - Conversation'lara mesajlar üzerinden bağlı

### 2. Category (Kategori)

- **Alanlar:** `name`, `description`
- **İlişkiler:**
  - Birçok Message'a sahip

### 3. Conversation (Konuşma)

- **Alanlar:** `title`
- **İlişkiler:**
  - Birçok Message'a sahip
  - User'lara mesajlar üzerinden bağlı

### 4. Message (Mesaj)

- **Alanlar:** `content`
- **İlişkiler:**
  - Bir User'a ait
  - Bir Category'ye ait
  - Bir Conversation'a ait
  - Birçok Reaction'a sahip

### 5. Reaction (Tepki)

- **Alanlar:** `reaction_type`
- **İlişkiler:**
  - Bir User'a ait
  - Bir Message'a ait

## 📊 Veritabanı Şeması

```
User
├── has_many :messages
├── has_many :reactions
└── has_many :conversations (through messages)

Category
└── has_many :messages

Conversation
├── has_many :messages
└── has_many :users (through messages)

Message
├── belongs_to :user
├── belongs_to :category
├── belongs_to :conversation
└── has_many :reactions

Reaction
├── belongs_to :user
└── belongs_to :message
```

## 🚀 Kurulum

### Gereksinimler

- Ruby 3.x
- Rails 7.x veya 8.x
- SQLite3

### Adımlar

1. Projeyi klonlayın:

```bash
git clone https://github.com/esmaotur/hello-message-system.git
cd hello-message-system
```

2. Bağımlılıkları yükleyin:

```bash
bundle install
```

3. Veritabanını oluşturun ve migrate edin:

```bash
rails db:create
rails db:migrate
```

4. Test verilerini yükleyin:

```bash
rails db:seed
```

5. Sunucuyu başlatın:

```bash
rails server
```

API http://localhost:3000 adresinde çalışacaktır.

## 📡 API Endpoints

### Users (Kullanıcılar)

- `GET /api/v1/users` - Tüm kullanıcıları listele
- `GET /api/v1/users/:id` - Belirli bir kullanıcıyı getir
- `POST /api/v1/users` - Yeni kullanıcı oluştur
- `PUT /api/v1/users/:id` - Kullanıcı güncelle
- `DELETE /api/v1/users/:id` - Kullanıcı sil

### Categories (Kategoriler)

- `GET /api/v1/categories` - Tüm kategorileri listele
- `GET /api/v1/categories/:id` - Belirli bir kategoriyi getir
- `POST /api/v1/categories` - Yeni kategori oluştur
- `PUT /api/v1/categories/:id` - Kategori güncelle
- `DELETE /api/v1/categories/:id` - Kategori sil

### Conversations (Konuşmalar)

- `GET /api/v1/conversations` - Tüm konuşmaları listele
- `GET /api/v1/conversations/:id` - Belirli bir konuşmayı getir
- `POST /api/v1/conversations` - Yeni konuşma oluştur
- `PUT /api/v1/conversations/:id` - Konuşma güncelle
- `DELETE /api/v1/conversations/:id` - Konuşma sil

### Messages (Mesajlar)

- `GET /api/v1/messages` - Tüm mesajları listele
- `GET /api/v1/messages/:id` - Belirli bir mesajı getir
- `POST /api/v1/messages` - Yeni mesaj oluştur
- `PUT /api/v1/messages/:id` - Mesaj güncelle
- `DELETE /api/v1/messages/:id` - Mesaj sil
- `GET /api/v1/conversations/:conversation_id/messages` - Belirli konuşmanın mesajları

### Reactions (Tepkiler)

- `GET /api/v1/reactions` - Tüm tepkileri listele
- `GET /api/v1/reactions/:id` - Belirli bir tepkiyi getir
- `POST /api/v1/messages/:message_id/reactions` - Mesaja tepki ekle
- `DELETE /api/v1/reactions/:id` - Tepki sil
- `GET /api/v1/messages/:message_id/reactions` - Belirli mesajın tepkileri

## 🧪 Test Örnekleri

### Tüm kullanıcıları getir

```bash
curl http://localhost:3000/api/v1/users
```

### Yeni kullanıcı oluştur

```bash
curl -X POST http://localhost:3000/api/v1/users \
  -H "Content-Type: application/json" \
  -d '{"user":{"name":"Ali Veli","email":"ali@example.com"}}'
```

### Tüm mesajları getir

```bash
curl http://localhost:3000/api/v1/messages
```

### Mesaja tepki ekle

```bash
curl -X POST http://localhost:3000/api/v1/messages/1/reactions \
  -H "Content-Type: application/json" \
  -d '{"reaction":{"reaction_type":"👍","user_id":1}}'
```

**Geliştirici:** Esma Otur  
**Tarih:**21 Ekim 2025
