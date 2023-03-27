require 'rails_helper'

RSpec.describe Resume, type: :model do
  it 'has all the data in table' do
    columns = Resume.column_names
    expect(columns).to include('name')
    expect(columns).to include('email')
    expect(columns).to include('tel')
    expect(columns).to include('skill')
    expect(columns).to include('intro')
    expect(columns).to include('city')
    expect(columns).to include('education')
    expect(columns).to include('experience')
    expect(columns).to include('portfolio')
  end

  it 'validate name' do
    expect(Resume.new(name: '', email: '123@gmail.com', tel: '0988777666')).not_to be_valid
    expect(Resume.new(name: 'aaa', email: '123@gmail.com', tel: '0988777666')).to be_valid
  end

  it 'validate email' do
    expect(Resume.new(name: 'aa', email: '', tel: '0988777666')).not_to be_valid
    expect(Resume.new(name: 'aaa', email: '123@gmail.com', tel: '0988777666')).to be_valid
  end

  it 'validate tel' do
    expect(Resume.new(name: '', email: '123@gmail.com', tel: '')).not_to be_valid
    expect(Resume.new(name: 'aaa', email: '123@gmail.com', tel: '0988777666')).to be_valid
  end
end