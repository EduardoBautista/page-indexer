require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest
  def setup
    url = 'https://eduardobautista.com/automatically-correct-typos-in-git/'
    file = File.new(Rails.root.join('test', 'fixtures', 'files', 'nokogiri_http_stub.html'))
    stub_request(:get, url).to_return(body: file)
  end

  test 'POST /pages' do
    assert_difference 'Page.count', 1 do
      post_request
    end

    assert_response :created

    expected_response = {
      'data' => {
        'id' => wildcard_matcher,
        'type' => 'pages',
        'attributes' => {
          'url' => 'https://eduardobautista.com/automatically-correct-typos-in-git/',
          'h1-content' => ['Automatically correct typos in Git'],
          'h2-content' => ['TL;DR', 'The Details'],
          'h3-content' => [],
          'links' => ['/']
        }
      }
    }

    assert_json_match expected_response, response.body
  end

  test 'GET /pages' do
    get '/pages', headers: json_api_headers
    assert_response :ok

    expected_response = {
      'data' => [{
        'id' => wildcard_matcher,
        'type' => 'pages',
        'attributes' => {
          'url' => 'https://eduardobautista.com/switching-from-qwerty-to-colemak/',
          'h1-content' => ['Switching from Qwerty to Colemak'],
          'h2-content' => [],
          'h3-content' => [],
          'links' => ['/', 'http://www.dvzine.org/zine/index.html', 'https://colemak.com/FAQ']
        }
      }]
    }

    assert_json_match expected_response, response.body
  end

  private

  def post_request
      post '/pages', params: {
        data: {
          type: 'pages',
          attributes: {
            url: 'https://eduardobautista.com/automatically-correct-typos-in-git/'
          }
        }
      }, headers: json_api_headers, as: :json
  end

  def json_api_headers
    {
      'HTTP_ACCEPT' => 'application/vnd.api+json',
      'CONTENT_TYPE' => 'application/vnd.api+json'
    }
  end
end
