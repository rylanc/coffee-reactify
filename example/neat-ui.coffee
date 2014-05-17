React = require './react'
document = require './dom'

RadComponent = require './rad-component.cjsx'

React.renderComponent RadComponent(rad: 'mos def'),
	document.getElementById 'container'
