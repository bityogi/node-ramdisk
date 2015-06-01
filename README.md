# node-ramdisk

create a ram disk with node.js

<a href="https://nodei.co/npm/node-ramdisk/"><img src="https://nodei.co/npm/node-ramdisk.png?downloads=true"></a>

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg?style=flat-square)](https://travis-ci.org/joaquimserafim/node-ramdisk)![Code Coverage 100%](https://img.shields.io/badge/code%20coverage-100%25-green.svg?style=flat-square)[![ISC License](https://img.shields.io/badge/license-ISC-blue.svg?style=flat-square)](https://github.com/joaquimserafim/node-ramdisk/blob/master/LICENSE)


## API
```js
var ramdisk = require('node-ramdisk')
```
return a `ramdisk` object


#### ramdisk(volumeName) 
`var disk = ramdisk('my_ramdisk')`

##### ramdisk#create(size[, callback(err, data, code)])
*   **size** - {integer} the size of the volume in MB
*   **callback** - {function}
    -   **err**   - {Error} error message
    -   **mount** - {string} the mounted block (in case of error is undefined)
    -   **code**  - {integer} the exit code (0 should means successful)

##### ramdisk#delete(volume[, callback(err, code)])
*   **mount** - {string} the mounted block
*   **callback** {function}
    -   **err**  - {Error} error message
    -   **code** - {integer} the exit code (0 should means successful)


## Usage

```js
var ramdisk = require('node-ramdisk')

var disk = ramdisk('my_ramdisk')

var volumePoint

// create a disk with 100MB of size
disk.create(100, function (err, mount, code) {
  // err, data, code
  volumePoint = mount
})

// when isn't needed then delete the disk
disl.delete(volumePoint, function (err, code) {
  // err, code
})
```


### Supported OS

*   darwin
*   linux

## Development

##### this projet has been set up with a precommit that forces you to follow a code style, no jshint issues and 100% of code coverage before commit


to run test
``` js
npm test
```

to run jshint
``` js
npm run jshint
```

to run code style
``` js
npm run code-style
```

to run check code coverage
``` js
npm run check-coverage
```

to open the code coverage report
``` js
npm run open-coverage
```
