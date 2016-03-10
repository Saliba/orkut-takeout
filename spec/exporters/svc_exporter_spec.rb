require 'rspec'

describe CSVExporter do

  let(:exporter) { CSVExporter.new }

  it 'should should return a header on the first line of the file' do
    result = exporter.export_friends
    expect(result).to start_with 'my_name,my_email,friend_name,friend_email'
  end

  context 'content' do
    it 'should include a line containing my email and my name' do

    end
  end
end