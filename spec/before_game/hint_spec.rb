RSpec.describe BeforeGame::Hint do
  let(:expect_hint_count) { 3 }
  let(:code) { [1, 2, 3, 4] }

  it 'create hint with 3 hint count' do
    hint_obj = described_class.new(hints_count: expect_hint_count)
    expect(hint_obj.hints_count).to eq(expect_hint_count)
  end

  it 'generate random number from code' do
    hint_obj = described_class.new(hints_count: expect_hint_count)
    hint_obj.generate_hints(code)
    expect(code).to include(*hint_obj.hints_items)
  end

  it 'generate random uniq number from code' do
    hint_obj = described_class.new(hints_count: expect_hint_count)
    hint_obj.generate_hints(code)
    uniq_hint = hint_obj.hints_items.uniq
    expect(uniq_hint.size).to eq(hint_obj.hints_items.size)
  end

  it 'decrement size of hint_items if call hint by 1' do
    hint_obj = described_class.new(hints_count: expect_hint_count)
    hint_obj.generate_hints(code)
    hint_obj.hint
    expect(hint_obj.hints_items.size).to eq(expect_hint_count - 1)
  end

  it 'don`t decrement hints_items if hints_items empty ' do
    expect_hint_count = 1
    hint_obj = described_class.new(hints_count: expect_hint_count)
    hint_obj.generate_hints(code)
    10.times { hint_obj.hint }
    expect(hint_obj.hints_items.size).to eq(0)
  end
end
