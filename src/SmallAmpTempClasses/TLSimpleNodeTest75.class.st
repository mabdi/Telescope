Class {
	#name : #TLSimpleNodeTest75,
	#superclass : #TLSimpleNodeTest,
	#category : #SmallAmpTempClasses
}

{ #category : #'as yet unclassified' }
TLSimpleNodeTest75 class >> allTestSelectors [
		| answer |
		answer := Set withAll: self testSelectors.
		answer addAll: self superclass allTestSelectors.
		^ answer asSortedCollection asOrderedCollection
]

{ #category : #'as yet unclassified' }
TLSimpleNodeTest75 >> testAddStyleRequireUpdate_amp [
	"I test correctness of: 

- `^ true` in method: `TLSimpleNode >> #isSimpleNode`

- `^ true` in method: `TLSimpleNode >> #isLeaf`

- `^ {self}` in method: `TLSimpleNode >> #leafs`

"

	<madeBySmallAmp>
	node addStyle: #style.
	self
		assert: node isSimpleNode;
		assert: node isLeaf;
		assert: node leafs class equals: Array
]

{ #category : #'as yet unclassified' }
TLSimpleNodeTest75 >> testAddStyleRequireUpdate_amp_A4 [
	"I test correctness of: 

- `^ {self}` in method: `TLSimpleNode >> #allNodesRecursively`

"

	<madeBySmallAmp>
	| aCollection |
	aCollection := node
		addStyle: #style;
		allNodesRecursively.
	self assert:
		aCollection class equals: Array
]
