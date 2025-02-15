"
An inspection container to hold any kind of presenter and show them as inspections.
Called in `SpPresenter>>#asInspection`, a presenter inspection is used to build an inspector, when collecting the inspections defined for the instance.
"
Class {
	#name : #StPresenterInspection,
	#superclass : #StInspection,
	#instVars : [
		'presenter'
	],
	#category : #'NewTools-Inspector-View'
}

{ #category : #layout }
StPresenterInspection class >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: #presenter;
		yourself
]

{ #category : #'instance creation' }
StPresenterInspection class >> for: aPresenter [

	^ self new
		presenter: aPresenter;
		yourself
]

{ #category : #accessing }
StPresenterInspection >> activateOnDoubleClick [

	self presenter activateOnDoubleClick
]

{ #category : #accessing }
StPresenterInspection >> activateOnSingleClick [

	self presenter activateOnSingleClick
]

{ #category : #ports }
StPresenterInspection >> defaultOutputPort [
	
	^ self presenter defaultOutputPort
]

{ #category : #testing }
StPresenterInspection >> hasOutputActivationPort [

	^ self presenter respondsTo: #outputActivationPort
	
]

{ #category : #ports }
StPresenterInspection >> outputActivationPort [

	^ self presenter outputActivationPort
]

{ #category : #accessing }
StPresenterInspection >> presenter [
	^ presenter
]

{ #category : #accessing }
StPresenterInspection >> presenter: aPresenter [

	aPresenter owner: self.
	presenter := aPresenter
]
