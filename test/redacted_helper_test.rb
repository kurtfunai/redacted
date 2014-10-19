require 'test_helper'

class RedactedHelpersTest < ActionView::TestCase
  include Redacted::ActionView::Helpers

  def setup
    @phrase = "Canada's maple syrup was stolen by grizzly bears"
    @redacted_html = redact_html(@phrase)
  end

  test '#redact_html returns string of random text' do
    refute_equal html_text(@redacted_html), @phrase
    refute html_text(@redacted_html).include?(@phrase)
  end

  test '#redact_html returns string of same length' do
    assert_equal @phrase.length, html_text(@redacted_html).length
  end

  test '#redact_html creates span tags with class .redacted-text' do
    assert @redacted_html.include?('<span class="redacted-text">')
    assert @redacted_html.include?('</span>')
  end

  private
  def html_text(redacted_html)
    strip_tags(redacted_html)
  end
end
