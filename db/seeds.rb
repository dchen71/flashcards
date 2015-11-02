#Create users
User.create(email: 					'example@test.com',
			password: 			    'testtest',
			password_confirmation: 'testtest'
			)


#Create decks
(1..3).each do |i|
Deck.create(title: "Example Deck #{i}",
		 	user_id: 1
	     	)
end