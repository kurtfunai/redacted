require 'test_helper'

class RedactedTest < ActionDispatch::IntegrationTest
  test 'redacted stylesheet is available' do
    get "/assets/redacted.css"
    assert_response(:success)
    assert_match ".redacted-text", @response.body
  end

  test 'engine is loaded' do
    assert_equal ::Rails::Engine, Redacted::Engine.superclass
  end

  test 'Redacted::ActionView::Helpers is loaded' do
    assert(Redacted::ActionView::Helpers.present?, 'Redacted::ActionView::Helpers is not defined')
  end

  test 'helper method redact_html is defined' do
    assert(Redacted::ActionView::Helpers.method_defined?(:redact_html), '#redact_html is not defined')
  end
end

class RedactedHelpersTest < ActionView::TestCase
  include Redacted::ActionView::Helpers

  test '#redact_html returns string of random text' do
    phrase = "Canada's maple syrup was stolen by grizzly bears"
    html = redact_html(phrase)
    refute_equal redacted_text(html), phrase
    refute redacted_text(html).include?(phrase)
  end

  test '#redact_html returns string of same length' do
    phrase = "Canada's maple syrup was stolen by grizzly bears"
    html = redact_html(phrase)
    assert_equal phrase.length, redacted_text(html).length
  end

  test '#redact_html creates span tags with class .redacted-text' do
    html = redact_html("Shakedown 1979")
    assert html.include?('<span class="redacted-text">')
    assert html.include?('</span>')
  end

  private
  def redacted_text(redacted_html)
    strip_tags(redacted_html)
  end
end
