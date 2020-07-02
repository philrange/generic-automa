# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
phil = User.create!(email: 'philrange@gmail.com', password: 'qwerty', password_confirmation: 'qwerty', display_name: 'Phil Range', is_admin: true)
user2 = User.create!(email: 'a@abc.com', password: 'qwerty', password_confirmation: 'qwerty', display_name: 'user2')
user3 = User.create!(email: 'b@abc.com', password: 'qwerty', password_confirmation: 'qwerty', display_name: 'user3')

# London Automa
london = Game.create!(title: 'London', text: 'AutoMartin created by sangwizz on bgg', loop: 'true', number_of_cards: 0 , user_id: phil.id)
london_easy = DifficultyMode.create!(game_id: london.id, name: 'Easy')
london_medium = DifficultyMode.create!(game_id: london.id, name: 'Medium')
london_hard = DifficultyMode.create!(game_id: london.id, name: 'Hard')
london_deck1 = Deck.create!(name: "Deck 1", game_id: london.id)
london_deck2 = Deck.create!(name: "Deck 2", game_id: london.id)
london_deck3 = Deck.create!(name: "Deck 3", game_id: london.id)
DeckSelection.create!(difficulty_mode_id: london_easy.id, deck_id: london_deck1.id, number_of_cards: 0)
DeckSelection.create!(difficulty_mode_id: london_medium.id, deck_id: london_deck1.id, number_of_cards: 0)
DeckSelection.create!(difficulty_mode_id: london_medium.id, deck_id: london_deck2.id, number_of_cards: 0)
DeckSelection.create!(difficulty_mode_id: london_hard.id, deck_id: london_deck1.id, number_of_cards: 0)
DeckSelection.create!(difficulty_mode_id: london_hard.id, deck_id: london_deck2.id, number_of_cards: 0)
DeckSelection.create!(difficulty_mode_id: london_hard.id, deck_id: london_deck3.id, number_of_cards: 0)

london_deck1Folder = File.join(Rails.root, "app/assets/images/seed/london/deck1")
Dir.foreach(london_deck1Folder) do |filename|
    next if filename == '.' or filename == '..'
    card = london_deck1.cards.new
    card.card_image.attach(io: File.open(london_deck1Folder + "/" + filename), filename: filename, content_type: 'image/jpg') 
    card.save
end

london_deck2Folder = File.join(Rails.root, "app/assets/images/seed/london/deck2")
Dir.foreach(london_deck2Folder) do |filename|
    next if filename == '.' or filename == '..'
    card = london_deck2.cards.new
    card.card_image.attach(io: File.open(london_deck2Folder + "/" + filename), filename: filename, content_type: 'image/jpg') 
    card.save
end

london_deck3Folder = File.join(Rails.root, "app/assets/images/seed/london/deck3")
Dir.foreach(london_deck3Folder) do |filename|
    next if filename == '.' or filename == '..'
    card = london_deck3.cards.new
    card.card_image.attach(io: File.open(london_deck3Folder + "/" + filename), filename: filename, content_type: 'image/jpg') 
    card.save
end

# Explorers Automa
explorers = Game.create!(title: 'Explorers of the North Sea', text: 'created by dukefanblue2005 on bgg', loop: 'false', number_of_cards: 0 , user_id: phil.id)
explorers_standard = DifficultyMode.create!(game_id: explorers.id, name: 'Standard')
explorers_standard_deck = Deck.create!(name: "Standard Deck", game_id: explorers.id)
DeckSelection.create!(difficulty_mode_id: explorers_standard.id, deck_id: explorers_standard_deck.id, number_of_cards: 24)

explorers_deckFolder = "app/assets/images/seed/explorers"
Dir.foreach(explorers_deckFolder) do |filename|
    next if filename == '.' or filename == '..'
    card = explorers_standard_deck.cards.new
    card.card_image.attach(io: File.open(explorers_deckFolder + "/" + filename), filename: filename, content_type: 'image/jpg') 
    card.save
end