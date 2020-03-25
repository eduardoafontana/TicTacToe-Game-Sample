Class {
	#name : #BaselineOfTicTacToe,
	#superclass : #BaselineOf,
	#category : #'BaselineOfTicTacToe-Game-Sample'
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
