#Create users
User.create(username: 				'Example',
			email: 					'example@test.com',
			password: 			    'testtest',
			password_confirmation:  'testtest'
			)
User.create(username: 				'Example 2',
			email: 					'example2@test.com',
			password: 			    'testtest',
			password_confirmation:  'testtest'
			)

#Create decks
(1..3).each do |i|
	Deck.create(title: "Example Deck #{i}",
			 	user_id: 1
		     	)
end

Deck.create(title: "Example Shared Deck",
			user_id: 2
		     )


#Create Cards
(1..10).each do |i|
	Card.create(front: "Example Front #{i}",
				back:  "Example Back #{i + 1}",
				deck_id: 1)
	Card.create(front: "Example Front #{i}",
				back:  "Example Back #{i + 1}",
				deck_id: 2)
end