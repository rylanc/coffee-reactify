React = require 'react'

RadComponent = require './rad-component'

console.log React.renderComponentToStaticMarkup React.createElement(RadComponent, rad: 'mos def')
