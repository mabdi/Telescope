Class {
	#name : #TLCompositeNodeTest435,
	#superclass : #TLCompositeNodeTest,
	#category : #SmallAmpTempClasses
}

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 class >> allTestSelectors [
		| answer |
		answer := Set withAll: self testSelectors.
		answer addAll: self superclass allTestSelectors.
		^ answer asSortedCollection asOrderedCollection
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithBlock_amp_A1 [
	"I test correctness of: 

- `^ lowestLevelNodes
	, (self childrenNodes flatCollect: #lowestLevelNodes)` in method: `TLCompositeNode >> #lowestLevelNodes`

- `^ allChildrenCompositeNodes
	, (self childrenNodes flatCollect: #allChildrenCompositeNodes)` in method: `TLCompositeNode >> #allChildrenCompositeNodes`

"

	<madeBySmallAmp>
	| aCollection |
	node entity: 42.
	self assert: node lowestLevelNodes class equals: TLDrawableCollection.
	aCollection := node allChildrenCompositeNodes.
	self assert:
		aCollection class equals: Array.
	node childrenProperty: [ :entity | #(1 2 3) ].
	self
		should: [ node createChildrenNodes ]
		raise: TLCompositeChildrenAlreadyGeneratedException
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithBlock_amp_A12 [
	<madeBySmallAmp>
	node entity: 42.
	self should: [ node leafs ] raise: KeyNotFound
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithBlock_amp_A16 [
	<madeBySmallAmp>
	node entity: 42.
	self should: [ node isExpanded ] raise: KeyNotFound
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithBlock_amp_A2 [
	<madeBySmallAmp>
	node entity: 42.
	self should: [ node isLeaf ] raise: KeyNotFound
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithBlock_amp_A24 [
	<madeBySmallAmp>
	node
		entity: 42;
		childrenProperty: [ :entity | #(1 2 3) ];
		allChildrenCompositeNodes.
	self
		should: [ node createChildrenNodes ]
		raise: TLCompositeChildrenAlreadyGeneratedException
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithBlock_amp_A30 [
	<madeBySmallAmp>
	node
		entity: 42;
		childrenProperty: [ :entity | #(1 2 3) ];
		allNodesRecursively.
	self
		should: [ node createChildrenNodes ]
		raise: TLCompositeChildrenAlreadyGeneratedException
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithBlock_amp_A7 [
	<madeBySmallAmp>
	node entity: 42.
	self should: [ node expanded ] raise: KeyNotFound
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithCollectionOfEntities_amp [
	"I test correctness of: 

- `childrenGroup isEmpty` in method: `TLCompositeNode >> #childrenGroup`

- `^ super allConnections union: self childrenGroup allConnections` in method: `TLCompositeNode >> #allConnections`

- `^ true` in method: `TLCompositeNode >> #isComposite`

- `^ true` in method: `TLCompositeNode >> #isCompositeNode`

"

	<madeBySmallAmp>
	node childrenProperty: #(1 2 3).
	self
		assert: node hasChildren;
		assert: node allConnections class equals: TLDrawableCollection;
		assert: node isComposite;
		assert: node isCompositeNode;
		should: [ node createChildrenNodes ]
			raise: TLCompositeChildrenAlreadyGeneratedException
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithCollectionOfEntities_amp_A0 [
	<madeBySmallAmp>
	node childrenProperty: #(1 2 3).
	self should: [ node childrenLayout ] raise: KeyNotFound
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithCollectionOfEntities_amp_A10 [
	<madeBySmallAmp>
	node
		childrenProperty: #(1 2 3);
		entity: 42.
	self
		should: [ node createChildrenNodes ]
		raise: TLCompositeChildrenAlreadyGeneratedException
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithCollectionOfEntities_amp_A2 [
	<madeBySmallAmp>
	node childrenProperty: #(1 2 3).
	self should: [ node isLeaf ] raise: KeyNotFound
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithCollectionOfEntities_amp_A30 [
	<madeBySmallAmp>
	node childrenProperty: #(1 2 3).
	self
		should: [ node createChildrenNodes ]
		raise: TLCompositeChildrenAlreadyGeneratedException
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithCollectionOfEntities_amp_A32 [
	<madeBySmallAmp>
	node childrenProperty: #(1 2 3).
	self
		should: [ node createChildrenNodes ]
		raise: TLCompositeChildrenAlreadyGeneratedException
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithCollectionOfEntities_amp_A44 [
	<madeBySmallAmp>
	node childrenProperty: #(1 2 3).
	self
		should: [ node createChildrenNodes ]
		raise: TLCompositeChildrenAlreadyGeneratedException
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithCollectionOfEntities_amp_A6 [
	<madeBySmallAmp>
	node childrenProperty: #(1 2 3).
	self should: [ node expanded ] raise: KeyNotFound
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithCollectionOfEntities_amp_L20 [
	<madeBySmallAmp>
	node childrenProperty: #(1 2 6).
	self
		should: [ node createChildrenNodes ]
		raise: TLCompositeChildrenAlreadyGeneratedException
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithProperty_amp_A0 [
	<madeBySmallAmp>
	node entity: 30.
	self should: [ node childrenLayout ] raise: KeyNotFound
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithProperty_amp_A1 [
	"I test correctness of: 

- `each class = TLCompositeNode` in method: `TLCompositeNode >> #allChildrenCompositeNodes`

"

	<madeBySmallAmp>
	| aCollection |
	aCollection := node
		entity: 30;
		allChildrenCompositeNodes.
	self assert:
		aCollection class equals: Array.
	node childrenProperty: #primeFactors.
	self
		should: [ node createChildrenNodes ]
		raise: TLCompositeChildrenAlreadyGeneratedException
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithProperty_amp_A12 [
	<madeBySmallAmp>
	node entity: 30.
	self should: [ node leafs ] raise: KeyNotFound
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithProperty_amp_A4 [
	<madeBySmallAmp>
	node entity: 30.
	self should: [ node hasChildrenToDisplay ] raise: KeyNotFound
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithProperty_amp_A7 [
	<madeBySmallAmp>
	node entity: 30.
	self should: [ node expanded ] raise: KeyNotFound
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testChildrenCreationWithProperty_amp_A8 [
	"I test correctness of: 

- `^ (self childrenGroup flatCollect: #allNodesRecursively)
	add: self;
	yourself` in method: `TLCompositeNode >> #allNodesRecursively`

"

	<madeBySmallAmp>
	| aCollection |
	aCollection := node
		entity: 30;
		allNodesRecursively.
	self assert:
		aCollection class equals: TLDrawableCollection.
	node childrenProperty: #primeFactors.
	self
		should: [ node createChildrenNodes ]
		raise: TLCompositeChildrenAlreadyGeneratedException
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testMoveChildNodeFromOneParentToAnother_amp_A35 [
	<madeBySmallAmp>
	| childNode anotherNode |
	childNode := node addChildNodeFromEntity: #child.
	anotherNode := TLCompositeNode new.
	node childrenNodes.
	self should: [ node leafs ] raise: KeyNotFound
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testMoveChildNodeFromOneParentToTheSame_amp_A11 [
	"I test correctness of: 

- `self childrenNodes reject: #hasChildren` in method: `TLCompositeNode >> #lowestLevelNodes`

"

	<madeBySmallAmp>
	| childNode |
	node
		addChildNodeFromEntity: #child;
		entity: 30.
	self assert: node lowestLevelNodes class equals: TLDrawableCollection
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testMoveChildNodeFromOneParentToTheSame_amp_A13 [
	<madeBySmallAmp>
	| childNode |
	childNode := node addChildNodeFromEntity: #child.
	self should: [ node leafs ] raise: KeyNotFound
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest435 >> testMoveChildNodeFromOneParentToTheSame_amp_A2 [
	<madeBySmallAmp>
	| childNode |
	childNode := node addChildNodeFromEntity: #child.
	self should: [ node isLeaf ] raise: KeyNotFound
]
