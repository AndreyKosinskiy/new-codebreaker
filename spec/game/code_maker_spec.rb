RSpec.describe Game::CodeMaker do
  it 'ganerate random code' do
    code_first = described_class.new
    code_second = described_class.new
    expect(code_first.code).not_to eq(code_second.code)
  end
end
