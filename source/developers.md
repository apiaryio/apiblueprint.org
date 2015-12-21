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

## Refract API Description

The [Refract API Description namespace](https://github.com/refractproject/refract-spec/blob/master/namespaces/api-description-namespace.md) is the recommended format to parse API Blueprint into, it supersedes the now deprecated API Blueprint AST. Refract is a versatile format for recursive structures. Its constructed of many element types which act as building blocks for building data structures and descriptions. Refract has namespaces which build upon the core Refract elements and adds elements for other descriptions such as API Description.

For example, an HTTP Response can be expressed in Refract using the following:

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

1. Install binding for your language (e.g. [Protagonist](https://github.com/apiaryio/protagonist) for Node.js)

    ```sh
    $ npm install protagonist
    ```

2. Parse your API Blueprint into Refract

    ```javascript
    var protagonist = require('protagonist');

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

[`drafter.js`](https://github.com/apiaryio/drafter#drafterjs) is a pure JavaScript version of the `drafter` library. It exposes a single `parse` function which takes an API Blueprint stirng and options and returns the Refract Parse Result.

1. Install drafter.js

    Via NPM:

    ```sh
    $ npm install drafter.js
    ```

    You may also download drafter.js from the [releases page](https://github.com/apiaryio/drafter/releases) and reference it in HTML.

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

1. Build Drafter

    ```sh
    $ ./configure
    $ make
    ```

    See full [build instructions](https://github.com/apiaryio/drafter#build)

2. Parse your API Blueprint into its AST

    ```c++
    #include "drafter.h"         // Blueprint Parser
    #include "SerializeResult.h" // Result Wrapper for serialization
    #include "sosJSON.h"         // Serializer

     mdp::ByteBuffer blueprint = R"(
    # My API
    ## GET /message
     + Response 200 (text/plain)

            Hello World!
    )";

    // Blueprint parsing
     snowcrash::ParseResult<snowcrash::Blueprint> ast;
     drafter::ParseBlueprint(blueprint, 0, ast);

     std::cout << "API Name: " << ast.node.name << std::endl;

    // Serialization to JSON format
     sos::SerializeJSON serializer;
     serializer.process(drafter::WrapResult(ast.node, drafter::WrapperOptions(drafter::RefractASTType)), std::cout);
    ```
