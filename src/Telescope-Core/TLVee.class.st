"
A TLVee is an enum value for a Vee.

"
Class {
	#name : #TLVee,
	#superclass : #TLSimpleShape,
	#category : #'Telescope-Core-Shape'
}

{ #category : #'instance creation' }
TLVee class >> polygonPoints [
	^ {(-1 @ 1).
	(0 @ 0.5).
	(1 @ 1).
	(0 @ -1)}
]
