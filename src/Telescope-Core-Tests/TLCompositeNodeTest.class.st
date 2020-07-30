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

{ #category : #'as yet unclassified' }
TLCompositeNodeTest >> testAllChildrenCompositeNodes [
	| aCollection |
	node entity: 42.
	aCollection := node allChildrenCompositeNodes.
	self assert: aCollection class equals: Array.
	self assert: aCollection size equals: 1.
	self assert: (aCollection at: 1) class equals: TLCompositeNode.
	self deny: (aCollection at: 1) hasChildren.
	self
		assert: (aCollection at: 1) childrenGroup class
		equals: TLEntitiesGroup.
	self
		assert: (aCollection at: 1) allConnections class
		equals: TLDrawableCollection.
	self assertEmpty: (aCollection at: 1) allConnections.
	self assert: (aCollection at: 1) hasEntity.
	self assert: (aCollection at: 1) isNode.
	self
		assert: (aCollection at: 1) childrenNodes class
		equals: TLDrawableCollection.
	self assertEmpty: (aCollection at: 1) childrenNodes.
	self
		assert: (aCollection at: 1) adjacentNodes class
		equals: TLDrawableCollection.
	self assertEmpty: (aCollection at: 1) adjacentNodes.
	self
		assert: (aCollection at: 1) incomingConnections class
		equals: TLDrawableCollection.
	self assertEmpty: (aCollection at: 1) incomingConnections.
	self assert: (aCollection at: 1) label isNil.
	self
		assert: (aCollection at: 1) lowestLevelNodes class
		equals: TLDrawableCollection.
	self assertEmpty: (aCollection at: 1) lowestLevelNodes.
	self
		assert: (aCollection at: 1) outgoingAdjacentNodes class
		equals: TLDrawableCollection.
	self assertEmpty: (aCollection at: 1) outgoingAdjacentNodes.
	self
		assert: (aCollection at: 1) outgoingConnections class
		equals: TLDrawableCollection.
	self assertEmpty: (aCollection at: 1) outgoingConnections.
	self assert: (aCollection at: 1) isComposite.
	self assert: (aCollection at: 1) childrenProperty isNil.
	self
		assert: (aCollection at: 1) connections class
		equals: TLDrawableCollection.
	self assertEmpty: (aCollection at: 1) connections.
	self
		assert: (aCollection at: 1) incomingAdjacentNodes class
		equals: TLDrawableCollection.
	self assertEmpty: (aCollection at: 1) incomingAdjacentNodes.
	self assert: (aCollection at: 1) entity equals: 42.
	self assert: (aCollection at: 1) isCompositeNode
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest >> testAllNodesRecursively [
	| aCollection |
	aCollection := node
		entity: 30;
		allNodesRecursively.
	self assert: aCollection class equals: TLDrawableCollection.
	self assert: aCollection size equals: 1.
	self assert: (aCollection at: 1) class equals: TLCompositeNode.
	self deny: (aCollection at: 1) hasChildren.
	self
		assert: (aCollection at: 1) childrenGroup class
		equals: TLEntitiesGroup.
	self
		assert: (aCollection at: 1) allConnections class
		equals: TLDrawableCollection.
	self assertEmpty: (aCollection at: 1) allConnections.
	self assert: (aCollection at: 1) hasEntity.
	self assert: (aCollection at: 1) isNode.
	self
		assert: (aCollection at: 1) childrenNodes class
		equals: TLDrawableCollection.
	self assertEmpty: (aCollection at: 1) childrenNodes.
	self
		assert: (aCollection at: 1) adjacentNodes class
		equals: TLDrawableCollection.
	self assertEmpty: (aCollection at: 1) adjacentNodes.
	self
		assert: (aCollection at: 1) incomingConnections class
		equals: TLDrawableCollection.
	self assertEmpty: (aCollection at: 1) incomingConnections.
	self assert: (aCollection at: 1) label isNil.
	self
		assert: (aCollection at: 1) lowestLevelNodes class
		equals: TLDrawableCollection.
	self assertEmpty: (aCollection at: 1) lowestLevelNodes.
	self
		assert: (aCollection at: 1) outgoingAdjacentNodes class
		equals: TLDrawableCollection.
	self assertEmpty: (aCollection at: 1) outgoingAdjacentNodes.
	self
		assert: (aCollection at: 1) outgoingConnections class
		equals: TLDrawableCollection.
	self assertEmpty: (aCollection at: 1) outgoingConnections.
	self assert: (aCollection at: 1) isComposite.
	self assert: (aCollection at: 1) childrenProperty isNil.
	self
		assert: (aCollection at: 1) connections class
		equals: TLDrawableCollection.
	self assertEmpty: (aCollection at: 1) connections.
	self
		assert: (aCollection at: 1) incomingAdjacentNodes class
		equals: TLDrawableCollection.
	self assertEmpty: (aCollection at: 1) incomingAdjacentNodes.
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

{ #category : #'as yet unclassified' }
TLCompositeNodeTest >> testChildrenProperty [
	node childrenProperty: #(1 2 3).
	self
		assert: node hasChildren;
		assert: node allConnections class equals: TLDrawableCollection;
		assert: node isComposite;
		assert: node isCompositeNode
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest >> testError [
	self should: [ node expanded ] raise: KeyNotFound. "KeyNotFound: key #compositeExpandedByDefault not found in Dictionary"
	self should: [ node isExpanded ] raise: KeyNotFound. "KeyNotFound: key #compositeExpandedByDefault not found in Dictionary"
	self should: [ node hasChildrenToDisplay] raise: KeyNotFound. "KeyNotFound: key #compositeExpandedByDefault not found in Dictionary".
	self should: [ node isLeaf ] raise: KeyNotFound "KeyNotFound: key #compositeExpandedByDefault not found in Dictionary".
	self should: [ node leafs ] raise: KeyNotFound "KeyNotFound: key #compositeExpandedByDefault not found in Dictionary".
	self should: [ node childrenLayout ] raise: KeyNotFound "KeyNotFound: key #layout not found in Dictionary"
]

{ #category : #'as yet unclassified' }
TLCompositeNodeTest >> testInitialize [
	"I test correctness of: 

- `self childrenNodes reject: #hasChildren` in method: `TLCompositeNode >> #lowestLevelNodes`

"

	self assert: node class equals: TLCompositeNode.
	self deny: node hasChildren.
	self assert: node childrenGroup class equals: TLEntitiesGroup.
	self
		assert: node childrenGroup telescopeEntities class
		equals: TLDrawableCollection.
	self assertEmpty: node childrenGroup telescopeEntities.
	self assert: node childrenGroup allConnections class equals: Set.
	self
		assert: node childrenGroup nodeCreationStrategy class
		equals: TLNodeCreationStrategy.
	self
		assert: node childrenGroup allNodes class
		equals: TLDrawableCollection.
	self assertEmpty: node childrenGroup allNodes.
	self assert: node childrenGroup obtain class equals: TLObtainRequest.
	self assert: node childrenGroup size equals: 0.
	self
		assert: node childrenGroup sortingStrategy class
		equals: TLKeepingOrderStrategy.
	self
		assert: node childrenGroup subGroupsDictionary class
		equals: Dictionary.
	self deny: node childrenGroup notEmpty.
	self assert: node childrenGroup subGroups class equals: Array.
	self assertEmpty: node childrenGroup subGroups.
	self
		assert: node childrenGroup nodes class
		equals: TLDrawableCollection.
	self assertEmpty: node childrenGroup nodes.
	self assert: node allConnections class equals: TLDrawableCollection.
	self assertEmpty: node allConnections.
	self assert: node hasEntity.
	self assert: node isNode.
	self assert: node childrenNodes class equals: TLDrawableCollection.
	self assertEmpty: node childrenNodes.
	self assert: node adjacentNodes class equals: TLDrawableCollection.
	self assertEmpty: node adjacentNodes.
	self
		assert: node incomingConnections class
		equals: TLDrawableCollection.
	self assertEmpty: node incomingConnections.
	self assert: node label isNil.
	self assert: node lowestLevelNodes class equals: TLDrawableCollection.
	self assertEmpty: node lowestLevelNodes.
	self
		assert: node outgoingAdjacentNodes class
		equals: TLDrawableCollection.
	self assertEmpty: node outgoingAdjacentNodes.
	self
		assert: node outgoingConnections class
		equals: TLDrawableCollection.
	self assertEmpty: node outgoingConnections.
	self assert: node isComposite.
	self assert: node childrenProperty isNil.
	self assert: node connections class equals: TLDrawableCollection.
	self assertEmpty: node connections.
	self
		assert: node incomingAdjacentNodes class
		equals: TLDrawableCollection.
	self assertEmpty: node incomingAdjacentNodes.
	self assert: node entity isNil.
	self assert: node isCompositeNode.
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

{ #category : #'as yet unclassified' }
TLCompositeNodeTest >> testRaisingTLCompositeChildrenAlreadyGeneratedException [
	node allNodesRecursively.
	self
		should: [ node createChildrenNodes ]
		raise: TLCompositeChildrenAlreadyGeneratedException
]
