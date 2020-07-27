RSpec.describe BeforeGame::DifficultChooser do
  it 'create instance with according variant' do
    variant = { name: 'easy', attempts: 15, hints: 2 }
    diff = described_class.new(difficult_variant: variant)
    instance_argument = { name: diff.name, attempts: diff.attempts_count, hints: diff.hint.hints_count }
    expect(instance_argument).to eq(variant)
  end
end
