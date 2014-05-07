require 'spec_helper'
require 'digest/sha2'

describe 'The Travis CI Notify App' do
  include Rack::Test::Methods

  def app
    TravisWebhook
  end

  it "gives usage information on GET request" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to match(/.*Usage:.*/);
  end

  it "returns the build status and the build url of the last POST request" do
    digest = Digest::SHA2.new.update("flopska/travis-notify")
    data = JSON.parse(File.read("payload.json"));
    post '/', { :payload => data.to_json }, "Content-Type" => "application/x-www-form-urlencoded", "HTTP_AUTHORIZATION" => digest.to_s, "HTTP_TRAVIS_REPO_SLUG" => "flopska/travis-notify"
    expect(last_response).to be_ok
    get '/notify'
    expect(last_response).to be_ok
    expect(last_response).to match(/.*status_message.*/)
    expect(last_response).to match(/.*build_url.*/)
  end
end
