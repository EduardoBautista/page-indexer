# Page Indexer

This is a Rails 5 app that indexes h1, h2, h3, and link content of a url.  It is
an api only app, so it only accepts and serves [JSON API](http://jsonapi.org)
compliant requests and responses.

## Request Headers

In order to be compliant with the JSON API spec, the following header must be
set in every request:

`Content-Type: application/vnd.api+json`

## Indexing a URL

`POST /pages`

```
{
  "data": {
    "type": "pages",
    "attributes": {
      "url": "https://eduardobautista.com/automatically-correct-typos-in-git/"
    }
  }
}
```

## List indexed URLs

```
{
  "data" : [{
    "id" : wildcard_matcher,
    "type" : "pages",
    "attributes" : {
      "url" : "https://eduardobautista.com/switching-from-qwerty-to-colemak/",
      "h1-content" : ["Switching from Qwerty to Colemak"],
      "h2-content" : [],
      "h3-content" : [],
      "links" : ["/", "http://www.dvzine.org/zine/index.html', "https://colemak.com/FAQ"]
    }
  }]
}
```
