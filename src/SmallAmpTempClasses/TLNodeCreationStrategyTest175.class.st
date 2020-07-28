Class {
	#name : #TLNodeCreationStrategyTest175,
	#superclass : #TLNodeCreationStrategyTest,
	#category : #SmallAmpTempClasses
}

{ #category : #'as yet unclassified' }
TLNodeCreationStrategyTest175 class >> allTestSelectors [
		| answer |
		answer := Set withAll: self testSelectors.
		answer addAll: self superclass allTestSelectors.
		^ answer asSortedCollection asOrderedCollection
]

{ #category : #'as yet unclassified' }
TLNodeCreationStrategyTest175 >> testStrategyForCompositeNodeCreationAlsoCreatingComposite_amp_A6 [
	"I test correctness of: 

- `^ self copy
	childrenStrategy: nil;
	compositeProperty: nil;
	yourself` in method: `TLNodeCreationStrategy >> #copyAsSimpleStrategy`

"

	<madeBySmallAmp>
	| node aTLNodeCreationStrategy1 aTLNodeCreationStrategy2 |
	aTLNodeCreationStrategy1 := strategy compositeProperty: {1}.
	aTLNodeCreationStrategy2 := strategy copyAsSimpleStrategy.
	self
		assert:
			aTLNodeCreationStrategy2 class
		equals: TLNodeCreationStrategy.
	aTLNodeCreationStrategy1 childrenProperty: [ :i | i to: i + 1 ].
	node := strategy createNodeFromEntity: #Digit
]
