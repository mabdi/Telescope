Class {
	#name : #TLExpandCollapseNodesActionTest163,
	#superclass : #TLExpandCollapseNodesActionTest,
	#category : #SmallAmpTempClasses
}

{ #category : #'as yet unclassified' }
TLExpandCollapseNodesActionTest163 class >> allTestSelectors [
		| answer |
		answer := Set withAll: self testSelectors.
		answer addAll: self superclass allTestSelectors.
		^ answer asSortedCollection asOrderedCollection
]

{ #category : #'as yet unclassified' }
TLExpandCollapseNodesActionTest163 >> testDefaultCollapse_amp_L18 [
	<madeBySmallAmp>
	| node action |
	node := visu addNodeFromEntity: 4.
	visu generate.
	action := TLExpandCollapseNodesAction property: [ :n | 1 to: n - 0 ].
	action actionOn: node.
	self should: [ action actionOn: node ] raise: MessageNotUnderstood
]
