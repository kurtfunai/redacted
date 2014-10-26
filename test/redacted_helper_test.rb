require 'test_helper'

class RedactedHelpersTest < ActionView::TestCase
  include Redacted::ActionView::Helpers

  def setup
    @phrase = "Canada's maple syrup was stolen by grizzly bears"
    @paragraphs = "This one paragraph.\nThis is two.\n\nThis is three!\r\nThis is four?"
    @redacted_html = redacted_html(@phrase)
  end

  test '#redact returns single line when passed string without characters' do
    refute redact(@phrase).include?('<p>'), "redact phrase should not have paragraph tags"
  end

  test '#redact splits into paragraphs when passed paragraphs' do
    assert redact(@paragraphs).include?('<p>'), "redact paragraphs should have p tags"
    assert redact(@paragraphs).include?('</p>')
  end

  test '#redact_paragraphs returns p tags around content' do
    assert redact_paragraphs(@paragraphs).first.include?('<p>')
    assert redact_paragraphs(@paragraphs).first.include?('</p>')
  end

  test '#redact_paragraphs splits into correct number of paragraphs returned' do
    assert_equal 4, redact_paragraphs(@paragraphs).size
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
