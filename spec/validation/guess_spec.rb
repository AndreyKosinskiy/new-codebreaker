RSpec.describe Validation::Guess do
  let(:err_msg) { 'Guess - number, required, length - 4 digits, each digit is a number in the range 1-6' }
  let(:invalid_value) { 'a1234ljds' }
  it 'raise error when enter invalid guess mesage mask' do
    expect { described_class.validation(input_value: invalid_value) }.to raise_error(ArgumentError, err_msg)
  end
end
