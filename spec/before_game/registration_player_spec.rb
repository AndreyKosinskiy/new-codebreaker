RSpec.describe BeforeGame::RegistrationPlayer do
  let(:err_msg) { 'Name - string, required, min length - 3 symbols, max length - 20' }

  it 'create user' do
    expect_name = 'First player'
    player = described_class.new(name: expect_name)
    expect(player.name).to eq(expect_name)
  end

  it 'raise validation error in initialization, when name size < 3' do
    expect_invalid_name = 'Yo'
    expect { described_class.new(name: expect_invalid_name) }.to raise_error(ArgumentError, err_msg)
  end

  it 'raise validation error in initialization, when name size > 20' do
    expect_invalid_name = 'YoYoYoYoYoYoYoYoYoYoY'
    expect { described_class.new(name: expect_invalid_name) }.to raise_error(ArgumentError, err_msg)
  end
end
