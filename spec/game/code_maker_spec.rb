require_relative '../../game/code_maker'

RSpec.describe Game::CodeMaker do
  it 'should ganerate random code' do
    code_first = Game::CodeMaker.new
    code_second = Game::CodeMaker.new
    expect(code_first.code).not_to eq(code_second.code)
  end
end