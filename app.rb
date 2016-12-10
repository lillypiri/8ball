require 'sinatra'
require 'erb'
require 'yaml/store'

get '/' do
  erb :index
end


get '/answer' do
  'Magic 8 Ball'
  answers = []
  @store = YAML::Store.new 'app.yml'
  @store.transaction do
    @store["answers"].each do |key, value|
      value.times do
        answers << key
      end
    end
  end

  @answer = answers.sample
  erb :answer
end
