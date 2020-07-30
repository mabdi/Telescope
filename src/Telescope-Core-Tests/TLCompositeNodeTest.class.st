Class {
	#name : #TLCompositeNodeTest,
	#superclass : #TestCase,
	#instVars : [
		'node'
	],
	#category : #'Telescope-Core-Tests-Model'
}

{ #category : #running }
TLCompositeNodeTest >> setUp [
	super setUp.
	node := TLCompositeNode new.
	node childrenNodeCreationStrategy: TLNodeCreationStrategy default.
	
]

{ #category : #tests }
TLCompositeNodeTest >> testAllChildrenCompositeNodes [
	| aCollection |
	node entity: 42.
	aCollection := node allChildrenCompositeNodes.
	self assert: aCollection class equals: Array.
	self assert: aCollection size equals: 1.
	self assert: (aCollection at: 1) class equals: TLCompositeNode.
	self assert: (aCollection at: 1) hasEntity.
	self assertEmpty: (aCollection at: 1) childrenNodes.
	self assert: (aCollection at: 1) label isNil.
	self assert: (aCollection at: 1) isComposite.
	self assert: (aCollection at: 1) entity equals: 42.
	self assert: (aCollection at: 1) isCompositeNode
]

{ #category : #tests }
TLCompositeNodeTest >> testAllNodesRecursively [
	| aCollection |
	aCollection := node
		entity: 30;
		allNodesRecursively.
	self assert: aCollection class equals: TLDrawableCollection.
	self assert: aCollection size equals: 1.
	self assert: (aCollection at: 1) class equals: TLCompositeNode.
	self deny: (aCollection at: 1) hasChildren.
	self assert: (aCollection at: 1) hasEntity.
	self assertEmpty: (aCollection at: 1) childrenNodes.
	self assert: (aCollection at: 1) label isNil.
	self assert: (aCollection at: 1) isComposite.
	self assert: (aCollection at: 1) entity equals: 30.
	self assert: (aCollection at: 1) isCompositeNode
]

{ #category : #tests }
TLCompositeNodeTest >> testChildrenCreationWithBlock [
	node entity: 42.
	node childrenProperty: [ :entity | 
			self assert: entity equals: 42.
			#(1 2 3) ].
	node createChildrenNodes.
	self assert: node childrenNodes size equals: 3.
	self assert: node childrenNodes first entity equals: 1.
	self assert: node childrenNodes second entity equals: 2.
	self assert: node childrenNodes third entity equals: 3
]

{ #category : #tests }
TLCompositeNodeTest >> testChildrenCreationWithCollectionOfEntities [
	node childrenProperty: #(1 2 3).
	node createChildrenNodes.
	self assert: node childrenNodes size equals: 3.
	self assert: node childrenNodes first entity equals: 1.
	self assert: node childrenNodes second entity equals: 2.
	self assert: node childrenNodes third entity equals: 3
]

{ #category : #tests }
TLCompositeNodeTest >> testChildrenCreationWithProperty [
	node entity: 30.
	node childrenProperty: #primeFactors.
	node createChildrenNodes.
	self assert: node childrenNodes size equals: 3.
	self assert: node childrenNodes first entity equals: 2.
	self assert: node childrenNodes second entity equals: 3.
	self assert: node childrenNodes third entity equals: 5
]

{ #category : #tests }
TLCompositeNodeTest >> testChildrenProperty [
	node childrenProperty: #(1 2 3).
	self
		assert: node hasChildren;
		assert: node allConnections class equals: TLDrawableCollection;
		assert: node isComposite;
		assert: node isCompositeNode
]

{ #category : #tests }
TLCompositeNodeTest >> testError [
	self should: [ node expanded ] raise: KeyNotFound. "KeyNotFound: key #compositeExpandedByDefault not found in Dictionary"
	self should: [ node isExpanded ] raise: KeyNotFound. "KeyNotFound: key #compositeExpandedByDefault not found in Dictionary"
	self should: [ node hasChildrenToDisplay] raise: KeyNotFound. "KeyNotFound: key #compositeExpandedByDefault not found in Dictionary".
	self should: [ node isLeaf ] raise: KeyNotFound "KeyNotFound: key #compositeExpandedByDefault not found in Dictionary".
	self should: [ node leafs ] raise: KeyNotFound "KeyNotFound: key #compositeExpandedByDefault not found in Dictionary".
	self should: [ node childrenLayout ] raise: KeyNotFound "KeyNotFound: key #layout not found in Dictionary"
]

{ #category : #tests }
TLCompositeNodeTest >> testMoveChildNodeFromOneParentToAnother [
	| childNode anotherNode |
	childNode := node addChildNodeFromEntity: #child.
	anotherNode := TLCompositeNode new.
	node childrenNodes first parent: anotherNode.
	self assert: node childrenNodes isEmpty.
	self assert: anotherNode childrenNodes size equals: 1.
	self assert: childNode parent equals: anotherNode
]

{ #category : #tests }
TLCompositeNodeTest >> testMoveChildNodeFromOneParentToTheSame [
	| childNode  |
	childNode := node addChildNodeFromEntity: #child.
	childNode parent: node.
	childNode parent: node.
	self assert: node childrenNodes size equals: 1.
	self assert: childNode parent equals: node
]
