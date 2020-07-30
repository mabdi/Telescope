Class {
	#name : #TLSimpleNodeTest,
	#superclass : #TestCase,
	#instVars : [
		'node'
	],
	#category : #'Telescope-Core-Tests-Model'
}

{ #category : #running }
TLSimpleNodeTest >> setUp [
	super setUp.
	node := TLSimpleNode new
]

{ #category : #tests }
TLSimpleNodeTest >> testAddStyleRequireUpdate [
	self deny: node isUpdateRequired.
	node addStyle: #style.
	self assert: node isUpdateRequired
]

{ #category : #tests }
TLSimpleNodeTest >> testAdjacentNodes [
	| nodeFrom nodeTo |
	nodeFrom := TLSimpleNode new.
	nodeTo := TLSimpleNode new "shape: shape".
	nodeFrom connectTo: node.
	node connectTo: nodeTo.
	self assert: node adjacentNodes asSet equals: { nodeFrom . nodeTo } asSet
]

{ #category : #tests }
TLSimpleNodeTest >> testAllNodesRecursively [
	| aCollection |
	aCollection := node allNodesRecursively.
	self assert: aCollection class equals: Array.
	self assert: aCollection size equals: 1.
	self assert: (aCollection at: 1) class equals: TLSimpleNode.
]

{ #category : #tests }
TLSimpleNodeTest >> testBecomeComposite [
	self deny: node isComposite.
	node becomeComposite.
	self assert: node isComposite
]

{ #category : #tests }
TLSimpleNodeTest >> testConnectionCreation [
	| anotherNode visualization |
	visualization := TLVisualization new.
	visualization addDrawable: node.
	anotherNode := TLSimpleNode new.
	visualization addDrawable: anotherNode.
	node connectTo: anotherNode.
	self assert: node outgoingConnections size equals: 1.
	self assert: anotherNode incomingConnections size equals: 1.
	self assert: node outgoingConnections first equals: anotherNode incomingConnections first
]

{ #category : #tests }
TLSimpleNodeTest >> testInitialize [
	self assert: node class equals: TLSimpleNode.
	self assert: node label isNil.
	self assert: node isSimpleNode.
	self assert: node allConnections class equals: TLDrawableCollection.
	self assertEmpty: node allConnections.
	self assert: node hasEntity.
	self assert: node isNode.
	self
		assert: node incomingConnections class
		equals: TLDrawableCollection.
	self assertEmpty: node incomingConnections.
	self assert: node adjacentNodes class equals: TLDrawableCollection.
	self assertEmpty: node adjacentNodes.
	self
		assert: node outgoingConnections class
		equals: TLDrawableCollection.
	self assertEmpty: node outgoingConnections.
	self
		assert: node outgoingAdjacentNodes class
		equals: TLDrawableCollection.
	self assertEmpty: node outgoingAdjacentNodes.
	self assert: node isLeaf.
	self deny: node isComposite.
	self assert: node connections class equals: TLDrawableCollection.
	self assertEmpty: node connections.
	self
		assert: node incomingAdjacentNodes class
		equals: TLDrawableCollection.
	self assertEmpty: node incomingAdjacentNodes.
	self assert: node entity isNil.
	self assert: node leafs class equals: Array.
	self assert: node leafs size equals: 1.
	self assert: (node leafs at: 1) class equals: TLSimpleNode
]

{ #category : #tests }
TLSimpleNodeTest >> testInteractions [
	self assert: node interactions size equals: 0.
	node addInteraction: TLPopUpAction onMouseOver.
	self assert: node interactions size equals: 1.
	
]

{ #category : #tests }
TLSimpleNodeTest >> testIsGroup [
	self deny: node isGroup
]

{ #category : #tests }
TLSimpleNodeTest >> testSimpleNodeBecameParent [
	| child |
	child := TLSimpleNode new.
	child parent: node.
	self assert: node isComposite.
	self assert: node childrenNodes size equals: 1.
	self assert: child parent equals: node.
	self assert: node isUpdateRequired 
]
