Class {
	#name : #BaselineOfTicTacToeGameSample,
	#superclass : #BaselineOf,
	#category : #BaselineOfTicTacToeGameSample
}

{ #category : #baselines }
BaselineOfTicTacToeGameSample >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec
				package: 'TicTacToeGameSample'.
		].

]

{ #category : #accessing }
BaselineOfTicTacToeGameSample >> projectClass [
	^ MetacelloCypressBaselineProject
]
