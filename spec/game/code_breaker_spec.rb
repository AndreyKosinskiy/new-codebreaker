# frozen_string_literal: true

require_relative '../../before_game/registration_player'
require_relative '../../before_game/difficult_chooser'
require_relative '../../statistic/statistic_row'
require_relative '../../game/code_breaker'

RSpec.describe Game::CodeBreaker do
  let(:player) { BeforeGame::RegistrationPlayer.new(name: 'Andrey') }
  let(:variant) { BeforeGame::DifficultChooser::DIFFICULT_VARIANTS[0] }
  let(:difficult) { BeforeGame::DifficultChooser.new(difficult_variant: variant) }
  let(:game) { Game::CodeBreaker.new(player: player, difficult: difficult) }

  it 'should return correct answer for code' do
    game.instance_variable_set(:@code, [6, 5, 4, 3])
    expect(game.my_guess(input_value: '5643')).to eq([true, true, false, false])
  end
end
