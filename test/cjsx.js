var test = require('tap').test;
var browserify = require('browserify');
var vm = require('vm');
var fs = require('fs');

function bundle (file, opts) {
    test('bundle transform', function (t) {
        t.plan(1);

        var b = browserify({extensions: ['.coffee', '.cjsx']});
        b.add(__dirname + file);
        b.transform((opts||{}),__dirname + '/..');
        b.bundle(function (err, src) {
            if (err) t.fail(err);
            vm.runInNewContext(src, {
                console: { log: log }
            });
        });

        function log (msg) {
            var expected = "<div class=\"rad-component\"><p>is this component rad? mos def</p></div>";

            t.equal(JSON.stringify(msg), JSON.stringify(expected));
        }
    });
}

bundle('/../example/neat-ui.coffee');
