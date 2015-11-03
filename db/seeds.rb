#Create users
User.create(username: 				'Example',
			email: 					'example@test.com',
			password: 			    'testtest',
			password_confirmation:  'testtest'
			)

#Create decks
(1..3).each do |i|
	Deck.create(title: "Example Deck #{i}",
			 	user_id: 1
		     	)
end


#Create Cards
(1..10).each do |i|
	Card.create(front: "Example Front #{i}",
				back:  "Example Back #{i + 1}",
				deck_id: 1)
end