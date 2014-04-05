React = require './react'
document = require './dom'

RadComponent = require './rad-component.csx'

React.renderComponent RadComponent(rad: 'mos def'),
	document.getElementById 'container'
