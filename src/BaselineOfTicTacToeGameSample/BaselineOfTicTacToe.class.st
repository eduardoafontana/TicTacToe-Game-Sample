Class {
	#name : #BaselineOfTicTacToe,
	#superclass : #BaselineOf,
	#category : #BaselineOfTicTacToeGameSample
}

{ #category : #baselines }
BaselineOfTicTacToe >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec
				package: 'TicTacToe-Game-Sample'.
		].

]

{ #category : #accessing }
BaselineOfTicTacToe >> projectClass [
	^ MetacelloCypressBaselineProject
]
