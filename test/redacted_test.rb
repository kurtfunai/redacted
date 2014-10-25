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

  test 'helper method redact is defined' do
    assert(Redacted::ActionView::Helpers.method_defined?(:redact), '#redact is not defined')
  end

  test 'helper method redacted_html is defined' do
    assert(Redacted::ActionView::Helpers.method_defined?(:redacted_html), '#redacted_html is not defined')
  end
end
