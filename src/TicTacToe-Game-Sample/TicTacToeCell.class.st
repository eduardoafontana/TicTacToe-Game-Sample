Class {
	#name : #TicTacToeCell,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'parentModel',
		'rowNum',
		'colNum'
	],
	#category : #'TicTacToe-Game-Sample'
}

{ #category : #initialization }
TicTacToeCell >> initialize [ 

super initialize.

self label: ''.

self extent: 80@80.

self color: Color blue.

self on: #click send: #value to: (self onClickExecutionBlock).

^self.
]

{ #category : #'as yet unclassified' }
TicTacToeCell >> onClickExecutionBlock [

	^[
		(self label size) == 0
		ifTrue:[
			self label: (parentModel updateAtRow: rowNum Col: colNum).
			parentModel checkWinCondition.
			self extent: 80@80.
		].
	]
]

{ #category : #initialization }
TicTacToeCell >> setModel: 
	ticTacToeModel row: aRow col: aCol [
	parentModel := ticTacToeModel.
	rowNum := aRow.
	colNum := aCol.
]
