require 'sinatra'
require 'json'
require 'digest/sha2'

$stdout.sync = true # for heroku logs

class TravisWebhook < Sinatra::Base
  set :token, ENV['TRAVIS_USER_TOKEN']

  @build_status = ""
  @build_url = ""

  get '/' do
    "Usage: "
  end

  get '/notify' do
    content_type 'application/json'
    {
      :status_message => @build_status,
      :build_url => @build_url
    }.to_json
  end

  post '/' do
    if not valid_request?
      puts "Invalid payload request for repository #{repo_slug}"
    else
      payload = JSON.parse(params[:payload])
      puts "Received valid payload for repository #{repo_slug}"
      @build_status = payload['status_message']
      @build_url = payload['build_url']
    end
  end

  def valid_request?
    digest = Digest::SHA2.new.update("#{repo_slug}#{settings.token}")
		puts "Digest"
		puts digest.to_s
    digest.to_s == authorization
  end

  def authorization
		puts "Authorization"
    puts env['HTTP_AUTHORIZATION']
    env['HTTP_AUTHORIZATION']
  end

  def repo_slug
		puts "Repo Slug"
    puts env['HTTP_TRAVIS_REPO_SLUG']
    env['HTTP_TRAVIS_REPO_SLUG']
  end
end
