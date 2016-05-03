# Redacted
[![Circle CI](https://circleci.com/gh/kurtfunai/redacted/tree/master.png?style=badge)](https://circleci.com/gh/kurtfunai/redacted/tree/master) [![Code Climate](https://codeclimate.com/github/kurtfunai/redacted/badges/gpa.svg)](https://codeclimate.com/github/kurtfunai/redacted) [![Test Coverage](https://codeclimate.com/github/kurtfunai/redacted/badges/coverage.svg)](https://codeclimate.com/github/kurtfunai/redacted)

The goal of Redacted is to take text like `My maple syrup was stolen by a moose!` and black it out, just like on a top secret document!

To keep the redacted information private, it turns the text into [Lorem ipsum](http://www.lipsum.com/). It tries its best to maintain the same size & shape of the text that is being redacted.

Redacted works with both plain text and HTML.

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'redacted'
```

And then execute:
```bash
$ bundle
```

In your application.css, include the css file:
```css
/*
 *= require redacted
 */
```

## Usage

After installing the gem, you will have access to a couple new methods in your Rails Views.

**redact(str)**
```ruby
# Plain text (inline):
<%= redact("You know nothing Jon Snow") %>
#=> Iusto eos eligendi non iu

All of the maple syrup was stolen by <%= redact("aliens") %>.
#=> All of the maple syrup was stolen by ducimu

# Plain text (paragraphs):
<%= redact("Roses are red.\nViolets are blue.\n\nAll our base\r\n are belong to you.") %>
#=> <p>consequatur et</p><p>excepturi sed dol</p><p>maxime id su</p><p>at non quia nonotas</p>
```
The `#redact` method will try to guess if the text should be inline or not, but you can also explictly call `redact_text(str)` for inline rendering, or `redact_paragraphs(str)` for paragraphs wrapped in `<p>` tags.

**redact_html(html_str)**
```ruby
redact_html("<p>A mind needs books as a sword needs a whetstone<br>if it is to keep its edge.</p><div>- George R.R. Martin, A Game of Thrones</div>")
#=> <p>adipisci labore quae perferendis impedit autem <br>odit impedit dolorem rerum</p><div>et quibusdam qui quis accusantium ullam</div>
```
Redacted parses the HTML string and replaces the text with lorem ipsum while maintaining the original HTML structure.

## How it works
Redacted takes text like `Winter is coming.` and replaces it with lorem ipsum of the same string length.

It then returns the redacted text surrounded by `<span></span>` tags that have the class `.redacted-text`.
```ruby
redact("Winter is coming.")
```
Becomes:
```html
<span class="redacted-text">quis saepe enimat</span>
```
Some basic CSS styles are included with the gem, but you can overwrite the look of the text by adding your own styles if you prefer.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/redacted/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
