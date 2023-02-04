require 'rails_helper'
describe "Rawg" do
  it 'creator_roles should fetch successful request' do
    request = Rawg::Client.creator_roles
    expect(request[:code]).to eq(200)
    expect(request[:status]).to eq("Success")
  end

  it 'creator_role should fetch invalid request' do
    request = Rawg::Request.call('get', "/creator-role")
    expect(request[:code]).to eq(404)
  end

  it 'creators should fetch successful request' do
    request = Rawg::Client.creators
    expect(request[:code]).to eq(200)
    expect(request[:status]).to eq("Success")
  end

  it 'creator should fetch successful request' do
    request = Rawg::Client.creator(1)
    expect(request[:code]).to eq(200)
    expect(request[:status]).to eq("Success")
  end

  it 'games should fetch successful request' do
    request = Rawg::Client.games
    expect(request[:code]).to eq(200)
    expect(request[:status]).to eq("Success")
  end

  it 'game should fetch successful request' do
    request = Rawg::Client.game(3)
    expect(request[:code]).to eq(200)
    expect(request[:status]).to eq("Success")
  end

  it 'games DLC should fetch successful request' do
    request = Rawg::Client.games_add("god-of-war")
    expect(request[:code]).to eq(200)
    expect(request[:status]).to eq("Success")
  end
end