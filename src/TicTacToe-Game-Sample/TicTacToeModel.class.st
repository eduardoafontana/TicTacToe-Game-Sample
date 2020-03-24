Class {
	#name : #TicTacToeModel,
	#superclass : #Array2D,
	#instVars : [
		'filledCellCount',
		'currentFill',
		'winner'
	],
	#category : #'TicTacToe-Game-Sample'
}

{ #category : #'as yet unclassified' }
TicTacToeModel >> checkWinCondition [

filledCellCount >= 5 "for optimization. Win can occur minimum at 5th turn"

ifTrue: [

Transcript show: 'Yes'.

1 to: 3 do: [:idx |

self checkWinConditionInRow: idx.

self checkWinConditionInColumn: idx.

].

self checkWinConditionInDiagonals.

].

]

{ #category : #'as yet unclassified' }
TicTacToeModel >> checkWinConditionInColumn: colNum [

|set|

winner isNil

ifTrue: [

set := (self atColumn: colNum) asSet.

self checkWinConditionInSet: set.

].

^winner.
]

{ #category : #'as yet unclassified' }
TicTacToeModel >> checkWinConditionInDiagonals [

|set1 set2 |

winner isNil

ifTrue: [

set1 := (self diagonal) asSet.

set2 := Set newFrom: {(self at: 1 at: 3). (self at: 2 at: 2). (self at: 3 at: 1)} asOrderedCollection.

self checkWinConditionInSet: set1.

self checkWinConditionInSet: set2.

].

^winner.
]

{ #category : #'as yet unclassified' }
TicTacToeModel >> checkWinConditionInRow: rowNum [

|set|

winner isNil

ifTrue: [

set := (self atRow: rowNum) asSet.

self checkWinConditionInSet: set

].

^winner
]

{ #category : #'as yet unclassified' }
TicTacToeModel >> checkWinConditionInSet: aSet [

aSet size == 1

ifTrue: [

(aSet includes: 'X')

ifTrue: [

        winner := 'P1'. 

        Transcript open. 

        Transcript show: 'Player 1 is the winner!!'.

    ].



(aSet includes: 'O')



ifTrue: [

        winner := 'P2'.  

        Transcript open. 

        Transcript show: 'Player 2 is the winner!!'.

    ].

].
]

{ #category : #initialization }
TicTacToeModel >> initialize [ 

super initialize.

filledCellCount := 0.

currentFill := nil.

winner := nil
]

{ #category : #'as yet unclassified' }
TicTacToeModel >> updateAtRow: r Col: c [

currentFill == nil

ifTrue:[ currentFill := 'X'. ]

ifFalse:[

currentFill == 'X'

ifTrue: [ currentFill := 'O'. ]

ifFalse: [ currentFill := 'X'. ]

].

self at: r at: c put: currentFill.

filledCellCount := filledCellCount + 1.

^currentFill
]
