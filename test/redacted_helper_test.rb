require 'test_helper'

class RedactedHelpersTest < ActionView::TestCase
  include Redacted::ActionView::Helpers

  def setup
    @phrase = "Canada's maple syrup was stolen by grizzly bears"
    @paragraphs = "This one paragraph.\n\nThis is two."
    @redacted_html = redacted_html(@phrase)
  end

  test '#redact splits into paragraphs' do
    assert_equal 2, redact(@paragraphs).size
  end

  test '#redacted_html returns string of random text' do
    refute_equal html_text(@redacted_html), @phrase
    refute html_text(@redacted_html).include?(@phrase)
  end

  test '#redacted_html returns string of same length' do
    assert_equal @phrase.length, html_text(@redacted_html).length
  end

  test '#redacted_html creates span tags with class .redacted-text' do
    assert @redacted_html.include?('<span class="redacted-text">')
    assert @redacted_html.include?('</span>')
  end

  test '#ascii_redact returns ascii blocks of same length' do
    assert_equal ["\u2588"], ascii_redact(@phrase).split('').uniq
    assert_equal ("\u2588" * @phrase.length), ascii_redact(@phrase)
  end

  private
  def html_text(redacted_html)
    strip_tags(redacted_html)
  end
end
