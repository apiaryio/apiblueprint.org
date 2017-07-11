---
title: API Blueprint
---

## API Blueprint. A powerful high-level API description language for web APIs.

API Blueprint is simple and accessible to everybody involved in the API
lifecycle. Its syntax is concise yet expressive. With API Blueprint you can
quickly design and prototype APIs to be created or document and test already
deployed mission-critical APIs.

[Tutorial](/documentation/tutorial.html) [Tools section](/tools.html)

```apib
# GET /message
+ Response 200 (text/plain)

        Hello World!
```

### Focused on Collaboration

API Blueprint is built to encourage dialogue and collaboration between
project stakeholders, developers and customers at any point in the API
lifecycle. At the same time, the API Blueprint tools provide the support to
achieve the goals be it API development, governance or delivery.

### Open

API Blueprint is completely open sourced under the MIT license.
Its future is [transparent and open][roadmap].
API Blueprint doesn't need a closed work group. Instead it uses the RFC
process similar to Rust language or Django Enhancement Proposal RFC processes.

To contribute, submit a proposal to [API Blueprint RFC repository][apibrfc].

### At home on GitHub

The API Blueprint language is recognized by GitHub.
[Search for API Blueprint][search] on GitHub using the
`language:"API Blueprint"` query.

The media type for API Blueprint is `text/vnd.apiblueprint`, and the
standard file extension is `.apib`. If you use this extension your
blueprints on GitHub will get syntax-highlighted.

### Built for better API Designs

API Blueprint is built to encourage better API designs through abstraction.
The goal of API Blueprint is to decouple elements of API to enable modularity
while encapsulating backend implementation behavior.

For example, model your data first using the data description syntax.

```apib
# Data Structures

## Blog Post (object)
+ id: 42 (number, required)
+ text: Hello World (string)
+ author (Author) - Author of the blog post.

## Author (object)
+ name: Boba Fett
+ email: fett@intergalactic.com
```

Then, use and reuse the data in your API endpoints.

```apib
# Blog Posts [/posts]

## Retrieve All Posts [GET]
+ Response 200 (application/json)
    + Attributes (array[Blog Post])
```

### Design-first

API Blueprint is all about the design-first philosophy. Similar to tests in
test-driven development, API Blueprint represents a contract for an API.
Discussing your API and settling on the contract before it is developed tends to
lead to better API designs.

Once your API Blueprint is in place everybody can [test][dredd] whether the
implementation is living up to the expectations set in the contract.

### Awesome Tools

Thanks to its broad adoption there is a plethora of tools built for API Blueprint.
From various standalone tools such as mock server, documentation and testing
tools to full-featured API life-cycle solutions.

See the [Tools section][tools] for the list.

---

### Getting Started

To get started with API Blueprint you will need a plain-text editor. For the
best editing experience switch the syntax-highlighting to Markdown or
directly to API Blueprint (if [supported][editors] by your editor).

With editor ready, follow the [API Blueprint tutorial][tutorial].

Once you have written your first API Blueprint you can discuss the API design
with friends and use the [tools for API Blueprint][tools]. For example,
to render documentation, generate a mock of your service or start testing your
backend implementation.

Check the [Documentation section][docs] for additional resources on
the API Blueprint syntax.

[dredd]: https://github.com/apiaryio/dredd
[tools]: ./tools.html
[docs]: ./documentation/
[tutorial]: ./documentation/tutorial.html
[editors]: ./tools.html#editors
[roadmap]: https://github.com/apiaryio/api-blueprint/wiki/Roadmap
[apibrfc]: https://github.com/apiaryio/api-blueprint-rfcs
[search]: https://github.com/search?utf8=%E2%9C%93&q=language%3A%22API+Blueprint%22&ref=simplesearch
