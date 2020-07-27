RSpec.describe Game::CodeBreaker do
  let(:player) { BeforeGame::RegistrationPlayer.new(name: 'Andrey') }
  let(:variant) { BeforeGame::DifficultChooser::DIFFICULT_VARIANTS[0] }
  let(:difficult) { BeforeGame::DifficultChooser.new(difficult_variant: variant) }
  let(:game) { described_class.new(player: player, difficult: difficult) }
  let(:answered_array) { [true] * Game::CodeMaker::CODE_DIGITS_COUNT }

  it 'return correct answer for code' do
    game.instance_variable_set(:@code, [6, 5, 4, 3])
    expect(game.my_guess(input_value: '5643')).to eq([true, true, false, false])
  end

  it 'return true if input guess is equeal to secret code' do
    expect(game.player_win?(answered_array)).to be_truthy
  end

  it 'return one correct hint value' do
    expect(game.instance_variable_get(:@code)).to include(game.hint)
  end
end
