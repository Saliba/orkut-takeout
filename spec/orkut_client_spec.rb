require 'rspec'

describe OrkutClient do

  let(:sign_in_response){
    sign_in_response = double()
    allow(sign_in_response).to receive(:body).and_return('my token')
    sign_in_response
  }

  it 'should sign_in to Orkut Server' do
    orkut_client = OrkutClient.new
    expect(RestClient).to receive(:post)
    .with(/login/,
      hash_including(
          username: 'lucasaliba@gmail.com',
          password: '123456'
        )
      ).and_return(sign_in_response)

    orkut_client.sign_in('lucasaliba@gmail.com', '123456')
  end

  it 'should sign_out from Orkut Server' do
    orkut_client = OrkutClient.new
    allow(RestClient).to receive(:post).and_return(sign_in_response)
    orkut_client.sign_in('my_user', 'my_password')
    orkut_client.sign_out
    expect(Authorizable).to_not be_signed_in
  end

  xit 'shoud throw an exception' do
    orkut_client = OrkutClient.new
    expect(orkut_client.get_current_user_info).to raise_error
  end
end