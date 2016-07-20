---
title: Developing tools for API Blueprint
---

API Blueprint can be consumed via an API Blueprint parser which outputs an [API Description](https://github.com/refractproject/refract-spec/blob/master/namespaces/api-description-namespace.md) which can be processed.

- [Command line tool](#using-the-command-line-tool)
- [Parsing service](#using-the-api-blueprint-parsing-service)
- [Node.js binding](#using-a-parser-binding-nodejs)
- [JavaScript parser](#using-drafterjs-pure-javascript-parser)
- [Native Parser](#using-the-native-parser-interface-cc)

Regardless of the parsing method, the parsing output is [Refract](https://github.com/refractproject/refract-spec).

## API Elements

The [API Elements](http://api-elements.readthedocs.org/) is the recommended format to consume API Blueprint, it supersedes the now deprecated API Blueprint AST. 

For example, an HTTP Response can be expressed in API Elements using the following:

```json
{
  "element": "httpResponse",
  "attributes": {
    "statusCode": 200
  },
  "content": [
    {
      "element": "asset",
      "attributes": {
        "contentType": "text/plain"
      },
      "content": "Hello World"
    }
  ]
}
```

API Elements are built on top of [Refract](https://github.com/refractproject/refract-spec). Refract is a versatile format for recursive structures. Its constructed of many element types which act as building blocks for building data structures and descriptions.

Every Refract element may have 4 attributes, the element name, Refract specific metadata, attributes specified by the element type, and a content value holding the content for the specific element.

**NOTE**: *There are various tools for consuming Refract in JavaScript such as [Fury](https://github.com/apiaryio/fury.js) and [minim](https://github.com/refractproject/minim).*

## Parsing API Blueprint

### Using the command line tool

1. Get Drafter command line tool

    ```sh
    $ brew install --HEAD \
        https://raw.github.com/apiaryio/drafter/master/tools/homebrew/drafter.rb
    ```

    Build notes for [Linux](https://github.com/apiaryio/drafter#drafter-command-line-tool) and [Windows](https://github.com/apiaryio/drafter/wiki/Building-on-Windows).

2. Parse API Blueprint into the Refract API Description namespace:

    ```sh
    $ cat << 'EOF' | drafter --format json
    # GET /message
    + Response 200 (text/plain)

            Hello World!
    EOF
    {
      "element": "parseResult",
      "content": [
        {
          "element": "category",

     ...
    ```

### Using the API Blueprint parsing service

You can use the API Blueprint parsing service, full API documentation for the service can be found on [Apiary](http://docs.apiblueprintapi.apiary.io/).

```shell
$ curl -X POST
    --header "Content-Type: text/vnd.apiblueprint" \
    --header "Accept: application/vnd.refract.parse-result+json" \
    --data-binary "# My API Blueprint" \
    https://api.apiblueprint.org/parser
{"element":"parseResult","content":[{"element":"category","meta":{"classes":["api"],"title":"My API Blueprint"},"content":[]}]}
```

### Using a parser binding (Node.js)

1. Install binding for your language (e.g. [Drafter NPM](https://github.com/apiaryio/drafter-npm) for Node.js)

    ```sh
    $ npm install drafter
    ```

2. Parse your API Blueprint into Refract

    ```javascript
    var drafter = require('drafter');

    var blueprint = '''
    # GET /message
    + Response 200 (text/plain)

            Hello World!
    ''';

    protagonist.parse(blueprint, function(error, result) {
        ...
    });
    ```

### Using drafter.js (Pure JavaScript parser)

[`drafter.js`](https://github.com/apiaryio/drafter.js) is a pure JavaScript version of the `drafter` library designed to work in web browsers. It exposes a single `parse` function which takes an API Blueprint string and options and returns the Refract Parse Result.

1. Install drafter.js

    You may also download drafter.js from the [releases page](https://github.com/apiaryio/drafter.js/releases) and reference it in HTML.

    ```html
    <script src="./drafter.js"></script>
    <script src="./drafter.js.mem"></script>
    ```

2. Parse your API Blueprint into Refract

    ```javascript
    var blueprint = '''
    # GET /message
    + Response 200 (text/plain)

            Hello World!
    ''';

    try {
      var res = drafter.parse(blueprint, {exportSourcemap: true});
      console.log(res);
    } catch (err) {
      console.log(err);
    }
    ```

### Using the native parser interface (C/C++)

1. Build [Drafter](https://github.com/apiaryio/drafter)

    ```sh
    $ ./configure
    $ make
    ```

    See full [build instructions](https://github.com/apiaryio/drafter#build)

2. Parse your API Blueprint

    ```c
    #include <drafter/drafter.h>

    const char *blueprint =
      "# My API\n"
      "## GET /message\n"
      "+ Response 200 (text/plain)\n"
      "\n"
      "      Hello World!\n";

    drafter_options options;
    options.format = DRAFTER_SERIALIZE_JSON;
    options.sourcemap = true;

    char *result = NULL;
    if (drafter_parse_blueprint_to(blueprint, &result, options) == 0) {
        printf("%s\n", result);
        free(result);
    }
    ```

    Please see [Drafter](https://github.com/apiaryio/drafter) for full API documentation.
