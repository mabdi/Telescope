as yet unclassified
collapseNode: aNode
	(self parentToChildren at: aNode)
		do: [ :node | 
			(node state at: #expanded ifAbsent: [ false ])
				ifTrue: [ self collapseNode: node ].
			(self destinationGroupFrom: node) remove: node ].
	self parentToChildren removeKey: aNode.
	aNode state at: #expanded put: false