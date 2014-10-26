require 'test_helper'

class RedactedHelpersTest < ActionView::TestCase
  include Redacted::ActionView::Helpers

  def setup
    @phrase = "Canada's maple syrup was stolen by grizzly bears"
    @paragraphs = "This one paragraph.\nThis is two.\n\nThis is three!\r\nThis is four?"
    @redacted_text = redact_text(@phrase)
    @redacted_paragraphs = redact_paragraphs(@paragraphs)
  end

  test '#redact returns single line when passed string without characters' do
    refute redact(@phrase).include?('<p>'), "redact phrase should not have paragraph tags"
  end

  test '#redact splits into paragraphs when passed paragraphs' do
    assert redact(@paragraphs).include?('<p>'), "redact_paragraphs should have p tags"
    assert redact(@paragraphs).include?('</p>')
  end

  test '#redact_paragraphs returns array of p tags around content' do
    assert @redacted_paragraphs.first.include?('<p>')
    assert @redacted_paragraphs.first.include?('</p>')
  end

  test '#redact_paragraphs returns array with correct number of paragraphs returned' do
    assert @redacted_paragraphs.class.name == "Array", "redact_paragraphs should be an array"
    assert_equal 4, @redacted_paragraphs.size, "redacted_paragraphs should return proper number of paragraphs"
  end

  test '#redact_text returns string of random text' do
    refute_equal html_text(@redacted_text), @phrase
    refute html_text(@redacted_text).include?(@phrase)
  end

  test '#redact_text returns string of same length' do
    assert_equal @phrase.length, html_text(@redacted_text).length
  end

  test '#redact_text creates span tags with class .redacted-text' do
    assert @redacted_text.include?('<span class="redacted-text">')
    assert @redacted_text.include?('</span>')
  end

  test '#ascii_redact returns ascii blocks of same length' do
    assert_equal ["\u2588"], ascii_redact(@phrase).split('').uniq
    assert_equal ("\u2588" * @phrase.length), ascii_redact(@phrase)
  end

  private
  def html_text(redact_text)
    strip_tags(redact_text)
  end
end
