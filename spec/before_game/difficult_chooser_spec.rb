require_relative '../../before_game/difficult_chooser'

RSpec.describe BeforeGame::DifficultChooser do
  it 'should create instance with according variant' do
    variant = { name: 'easy', attempts: 15, hints: 2 }
    diff = BeforeGame::DifficultChooser.new(difficult_variant: variant)
    instance_argument = { name: diff.name, attempts: diff.attempts_count, hints: diff.hint.hints_count }
    puts instance_argument
    expect(instance_argument).to eq(variant)
  end
end
