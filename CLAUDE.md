# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Redacted is a Ruby gem that provides Rails view helpers to convert text into lorem ipsum while maintaining the original text's length and structure. It's useful for obscuring sensitive content in UI mockups or demos.

## Common Commands

```bash
# Install dependencies
bundle install

# Run all tests
rake test

# Run a single test file
ruby -Ilib:test test/redacted_helper_test.rb

# Build the gem
rake build

# Generate documentation
rake rdoc
```

## Architecture

This is a Rails engine gem with the following structure:

- **lib/redacted.rb** - Entry point, loads dependencies (ffaker, nokogiri) and conditionally loads Rails integration
- **lib/redacted/action_view/helpers.rb** - Core functionality: view helper methods (`redact`, `redact_text`, `redact_paragraphs`, `redact_html`, `ascii_redact`)
- **lib/redacted/railtie.rb** - Integrates helpers into ActionView
- **lib/redacted/engine.rb** - Rails engine for serving the CSS asset

The gem uses FFaker to generate lorem ipsum text and Nokogiri to parse/traverse HTML while preserving structure.

## Testing

Tests are in `test/` using Minitest with ActionView::TestCase. The `test/dummy/` directory contains a minimal Rails app for integration testing.
