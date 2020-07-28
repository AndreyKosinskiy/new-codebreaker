RSpec.describe Game::CodeMaker do
  let(:code_first) { described_class.new }
  let(:code_second) { described_class.new }
  it 'ganerate random code' do
    expect(code_first.code).not_to eq(code_second.code)
  end
end
