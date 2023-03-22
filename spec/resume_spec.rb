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
end