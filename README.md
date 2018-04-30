# API Blueprint Website

## Usage

To be able to build and view the website locally, you will first need to
install its dependencies:

```shell
$ bundle install
```

### Preview Website

Using middleman, you can run a development server which will live-build the API
Blueprint website.

```shell
$ bundle exec rake
```

### Adding a new tool

Open the file `data/tools.yaml` and add a new entry for your tool.

```shell
$ cat << 'EOF' >> data/tools.yaml
- name: Hyperdrive
  summary: Hyperdrive allows you to build Swift applications that can evolve at run-time powered by API Blueprint.
  url: https://github.com/the-hypermedia-project/Hyperdrive
  tags:
    - client
EOF
```

### Deployment

Circle CI will automatically deploy any changes made to master directly to
GitHub pages.
