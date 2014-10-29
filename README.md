# Redacted

The goal of Redacted is to take a block of text, turn it into Lorem ipsum of the same size, and then apply styles with CSS to make the text appear redacted! Just like top secret documents.

Basically it takes text like `My maple syrup was stolen by a moose!` and turns it into a blacked out block to text that is roughly the same size!

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

Redacted will convert both plaintext and HTML into redacted text.

After installing the gem, you will have access to a couple new methods in your Rails Views.

**Plain text (inline):**
```ruby
<%= redact('All of the maple syrup was stolen by aliens.')=>
#=> Iusto eos eligendi non iure rerum quia accus

All of the maple syrup was stolen by <%= redact('aliens')=>.
#=> All of the maple syrup was stolen by ducimu
```
The plain text method can create inline redacted text, or write out paragraphs to maintain the size/shape of paragraphs.

**Plain text (paragraphs):**
```ruby
<%= redact('Roses are red.\nViolets are blue.\n\nAll our base\r\n are belong to you.')=>
#=> <p>Roses are red.</p><p>Violets are blue.</p><p>All our base</p><p>are belong to you.</p>
```
The `#redact` method will try to guess if the text should be inline or not, but you can also explictly call `redact_text` or `redact_paragraphs` if you want specific functionality.

**HTML**
```ruby
redact_html('<p>A mind needs books as a sword needs a whetstone<br>if it is to keep its edge.</p><div>- George R.R. Martin, A Game of Thrones</div>')
#=> <p>adipisci labore quae perferendis impedit autem <br>odit impedit dolorem rerum</p><div>et quibusdam qui quis accusantium ullam</div>
```

## How it works
Redacted takes text like `Winter is coming.` and replaces it with lorem ipsum of the same string length.

It then returns the redacted text surrounded by `<span></span>` tags that have the class `.redacted-text`.
```ruby
redact('Winter is coming.')
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
