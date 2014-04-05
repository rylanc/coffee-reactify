# coffee-reactify

browserify v2 plugin for applying [coffee-react-transform](https://github.com/jsdf/coffee-react-transform)

mix and match `.csx` and `.coffee` files in the same project

# example

given some files written in a mix of `coffee` and `csx`:

neat-ui.coffee:
``` coffee
require './rad-component.csx'

React.renderComponent RadComponent({rad:"mos def"}), document.getElementById('container')
```

rad-component.csx:
``` coffee
# @csx React.DOM 

React = require('react')

RadComponent = React.createClass
  render: ->
    <div className="rad-component">
      <p>is this component rad? {@props.rad}</p>
    </div>
```

install coffee-reactify:

```bash
$ npm install coffee-reactify
```

when you compile your app, pass `-t coffee-reactify` to browserify:

```bash
$ browserify -t coffee-reactify neat-ui.coffee > bundle.js
```

you can omit the `.csx` extension from your requires if you add the extension to browserify's module extensions:

``` coffee
require './component'
...
```

```bash
$ browserify -t coffee-reactify --extension=".csx" neat-ui.coffee > bundle.js
```

providing the transform option `coffeeout: true` will passthrough the transformed
output of `.coffee` files with the `# @csx` pragma without compiling them to javascript.
this means you can use a different coffee compiler transform such as [icsify](https://github.com/maxtaco/icsify) or [coffeeify](https://github.com/jnordberg/coffeeify) in conjunction with this transform.
**note:** at this stage, `.csx` files will still be compiled even with `--coffeeout`,
as other transform modules like coffeeify will skip them due to the file extension.

```bash
$ browserify -t [ coffee-reactify --coffeeout ] -t coffeeify neat-ui.coffee > bundle.js
```

# install

With [npm](https://npmjs.org) do:

```bash
npm install coffee-reactify
```

# license

MIT
