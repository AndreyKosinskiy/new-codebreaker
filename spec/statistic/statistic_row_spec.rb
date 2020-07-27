RSpec.describe Statistic::StatisticRow do
  let(:player) { instance_double(BeforeGame::RegistrationPlayer, name: 'Andrey') }
  let(:hint) { instance_double(BeforeGame::Hint, hints_count: 2) }
  let(:difficult) { instance_double(BeforeGame::DifficultChooser, name: 'easy', attempts_count: 15, hint: hint) }
  let(:row) { described_class.new(player: player, difficult_init: difficult) }

  it 'get init value for row from player obj' do
    expect(row.player_name).to eq(player.name)
  end

  it 'get init value for row from diff obj, diff name' do
    expect(row.difficult_name).to eq(difficult.name)
  end

  it 'get init value for row from diff obj, attemps count' do
    expect(row.init_attempts_count).to eq(difficult.attempts_count)
  end

  it 'get init value for row from diff obj, hint count' do
    expect(row.init_hints_count).to eq(difficult.hint.hints_count)
  end
end
