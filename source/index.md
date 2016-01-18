---
title: API Blueprint
---

## API Blueprint. A powerful high-level API description language for web APIs.

API Blueprint is simple and accessible to everybody involved in the API
lifecycle. Its syntax is concise yet expressive. With API Blueprint you can
quickly design and prototype APIs to be created or document and test already
deployed mission-critical APIs.

[Tutorial](./documentation/) [Tools section](./tools.html) 

```apib
# GET /message
- Response 200 (text/plain)

        Hello World!
```

### Focused on Collaboration

The API Blueprint is built to encourage dialogue and collaboration between
project stakeholders, developers and customers at any point in the API
lifecycle. At the same time, the API Blueprint tools provide the support to
achieve the goals be it API development, governance or delivery.

### Open

API Blueprint is completely open sourced under the MIT license.
Its future is [transparent and open](https://github.com/apiaryio/api-blueprint/wiki/Roadmap).
API Blueprint doesn't need a closed work group. Instead it uses the RFC
process similar to Rust lang or DEP RFC processes.

To contribute submit a proposals to [API Blueprint RFC repository](https://github.com/apiaryio/api-blueprint-rfcs).

### At home on GitHub

API Blueprint language is recognized by GitHub. [Search for API Blueprint](https://github.com/search?utf8=%E2%9C%93&q=language%3A%22API+Blueprint%22&ref=simplesearch) on
GitHub using the `language:"API Blueprint"` query.

API Blueprint media type is `text/vnd.apiblueprint` and standard file extension
is `.apib`. If you use this extension your blueprints on GitHub will get
syntax-highlighted.

### Built for better API Designs

API Blueprint is a medium is built to encourage better API designs through
abstraction.

First, model your data using the innovative data description syntax.

```apib
# Data Structures

## Blog Post (object)
- id: 42 (number, required)
- text: Hello World (string)
- author (Author) - Author of the blog post.

## Author (object)
- name: Boba Fett
- email: fett@intergalactic.com
```

Then, use and reuse the data in your API endpoints.

```apib
# Blog Posts [/posts]

## Retrieve All Posts [GET]
- Response 200 (application/json)
    - Attributes (array[Blog Post])
```

Focusing on the right things at the right time is the key for successful API
design.

### Design-first
TODO:

### How API description works?
TODO:

### Backed up by Awesome Tools

Thanks to its broad adoption there is a plethora of tools built for API Blueprint.
From various standalone tools such as mock server, documentation and testing
tools to full-featured API lifecycle solutions.

See the [Tools section](./tools.html) for the listing.

### Getting Started

To get started with API Blueprint you will need a plain-text editor. For the
best editing experience switch the syntax-highlighting to Markdown or
directly API Blueprint (if your editor [supports it](./tools.html#editors)).

Once your editor is ready, follow the
[API Blueprint tutorial](./documentation/tutorial.html).

TODO: What to do with the first blueprint.

Check the [Documentation section](./documentation/) for additional resources on
API Blueprint.