# meteor-matches
Meteor Matches


users
```
	_id: "w5HMPn3DqvoiSXNFB",
	name: "Player 1",
	wins: 1,
	loses: 0,
	draws: 1,
	matches: 2,
	rating: 10
```

tournament
```
	_id: "w5HMPn3DqvoiSXNFB"
	name: "Snooker"
```

tournament_rank
```
	_id: "w5HMPn3DqvoiSXNFB",
	tournamentId: "w5HMPn3DqvoiSXNFB",
	userId: "w5HMPn3DqvoiSXNFB",
	wins: 1,
	loses: 0,
	draws: 1,
	matches: 2,
	rating: 10
```

match
```
	_id: "w5HMPn3DqvoiSXNFB",
	createdAt: new Date(123123123123),
	createdBy: "w5HMPn3DqvoiSXNFB",
	hash: "w5HMPn3DqvoiSXNFB",
	tournament: "w5HMPn3DqvoiSXNFB",
	approved: 2,
	teams: [
		{
			hash: "w5HMPn3DqvoiSXNFB",
			players: ["Player1", "Player2"],
			score: 2,
			points: 1,
			decision: 1,
			approved: false
		},
		{
			hash:
			players: ["Player3", "Player4"],
			score: 0,
			points: 0,
			decision: -1,
			approved: false
		}
	]
```
