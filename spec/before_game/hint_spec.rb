require_relative '../../before_game/hint'

RSpec.describe BeforeGame::Hint do
  it 'should create hint with 3 hint count' do
    expect_hint_count = 3
    hint_obj = BeforeGame::Hint.new(hints_count: expect_hint_count)
    expect(hint_obj.hints_count).to eq(expect_hint_count)
  end

  it 'should generate random number from code' do
    code = [1, 2, 3, 4]
    expect_hint_count = 3
    hint_obj = BeforeGame::Hint.new(hints_count: expect_hint_count)
    hint_obj.generate_hints(code)
    expect(code).to include(*hint_obj.hints_items)
  end

  it 'should generate random uniq number from code' do
    code = [1, 2, 3, 4]
    expect_hint_count = 3
    hint_obj = BeforeGame::Hint.new(hints_count: expect_hint_count)
    hint_obj.generate_hints(code)
    uniq_hint = hint_obj.hints_items.uniq
    expect(uniq_hint.size).to eq(hint_obj.hints_items.size)
  end

  it 'should decrement size of hint_items if call hint by 1' do
    code = [1, 2, 3, 4]
    expect_hint_count = 3
    hint_obj = BeforeGame::Hint.new(hints_count: expect_hint_count)
    hint_obj.generate_hints(code)
    hint_obj.hint
    expect(hint_obj.hints_items.size).to eq(expect_hint_count - 1)
  end

  it 'should don`t decrement hints_items if hints_items empty ' do
    code = [1, 2, 3, 4]
    expect_hint_count = 1
    hint_obj = BeforeGame::Hint.new(hints_count: expect_hint_count)
    hint_obj.generate_hints(code)
    10.times { hint_obj.hint }
    expect(hint_obj.hints_items.size).to eq(0)
  end
end
