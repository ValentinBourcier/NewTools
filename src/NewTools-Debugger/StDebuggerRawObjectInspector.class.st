"
An object inspector specialized for debuggers.
I show only a compacted raw view instead of a notebook page, in particular I remove tabs and provide an optional layout without a header.
Activating one of my items (by clicking or double-clicking on it) shows a miller list with a standard object inspector.
"
Class {
	#name : #StDebuggerRawObjectInspector,
	#superclass : #StObjectInspectorPresenter,
	#instVars : [
		'raw'
	],
	#category : #'NewTools-Debugger-View'
}

{ #category : #specs }
StDebuggerRawObjectInspector class >> noHeaderSpec [
	<spec: #default>
	^ SpBoxLayout newTopToBottom
		add: #raw;
		yourself
]

{ #category : #initialization }
StDebuggerRawObjectInspector >> defaultLayout [
	
	^ SpBoxLayout newTopToBottom 
		add: header expand: false fill: false padding: 5;
		add: raw;
		yourself

]

{ #category : #initialization }
StDebuggerRawObjectInspector >> initializePresenters [


	raw := self model inspectionRaw.
	raw beForDebugger.
	raw owner: self.
	self addActivationTo: raw.
	
	super initializePresenters
]

{ #category : #initialization }
StDebuggerRawObjectInspector >> rawInspectorPageOrNil [
	^raw
]

{ #category : #accessing }
StDebuggerRawObjectInspector >> selectedObject [
	"The debugger raw object inspector is opened on a StDebuggerContext object that holds context information. Here the view expected by users is on the receiver and not on the StDebuggerContext."
	^super selectedObject context receiver
]

{ #category : #stepping }
StDebuggerRawObjectInspector >> step [
	super step.
	raw step
]

{ #category : #'private - updating' }
StDebuggerRawObjectInspector >> updateHeaderBar [
	| filter |

	super updateHeaderBar.
	self rawInspectorPageOrNil ifNil: [ ^ self ].
"	self rawInspectorPageOrNil attributeTable hasActiveFilter ifFalse: [header label: self model labelString. ^ self ]."
	filter := self rawInspectorPageOrNil attributeTable filter.
	filter ifNil:[ 
		header label: self model labelString. 
		^ self].
	header label: '[Active filter: ', filter, '] ', self model labelString
]
