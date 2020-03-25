Class {
	#name : #TicTacToe,
	#superclass : #Object,
	#instVars : [
		'container',
		'model'
	],
	#category : #TicTacToeGameSample
}

{ #category : #adding }
TicTacToe >> addControls [

	| rowMorph newGameButton exitGameButton |

	rowMorph := Morph new 
             layoutPolicy: RowLayout new; 
             color: Color transparent.

	newGameButton := self createCtrlLabelled: 'New'    onClickExecutes: [self restart].
	exitGameButton := self createCtrlLabelled: 'Exit'  onClickExecutes: [container delete].

	rowMorph addMorph: exitGameButton.

	rowMorph addMorph: newGameButton.

	container addMorph: rowMorph
]

{ #category : #initialization }
TicTacToe >> addRows [

| rowMorph aCell rowCol |

	1 to:3 do:[ :row |

		rowMorph := Morph new layoutPolicy: RowLayout new.
		1 to: 3 do: [ :col |
			aCell := TicTacToeCell new.
			aCell setModel: (model) row: row col: col.
			rowMorph addMorph: aCell.
		].

		container addMorph: rowMorph.
	]
]

{ #category : #'as yet unclassified' }
TicTacToe >> createCtrlLabelled: aString onClickExecutes: aBlock [

	| aCtrlButton |

	aCtrlButton := SimpleButtonMorph new label: aString.

	aCtrlButton color: (Color black alpha: 0.2).

	aCtrlButton extent: 120@50.

	aCtrlButton on: #click send: #value to: aBlock.

	^aCtrlButton.
]

{ #category : #initialization }
TicTacToe >> initialize [ 
	container := Morph new 
						layoutPolicy: TableLayout new; 
						color: Color transparent.
						
	model := TicTacToeModel new: 3.
	
	self addRows.
	self addControls.
	
	^self.
]

{ #category : #'instance creation' }
TicTacToe >> open [ 
	container openInWindow.
]

{ #category : #initialization }
TicTacToe >> restart [

	container delete.
	Smalltalk garbageCollect.
	TicTacToe new open.
]
