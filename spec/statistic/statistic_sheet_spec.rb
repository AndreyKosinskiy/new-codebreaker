RSpec.describe Statistic::StatisticSheet do
  after(:all) do
    File.delete(YamlSaver::DEFAULT_YAML_FILE_NAME)
  end
  let(:player) { instance_double(BeforeGame::RegistrationPlayer, name: 'Andrey') }
  let(:hint) { instance_double(BeforeGame::Hint, hints_count: 2) }
  let(:difficult) { instance_double(BeforeGame::DifficultChooser, name: 'easy', attempts_count: 15, hint: hint) }
  let(:row) { Statistic::StatisticRow.new(player: player, difficult_init: difficult) }
  let(:instance_sheet) do
    described_class.new(storage: YamlSaver.new(permitted_classes: [Statistic::StatisticRow]),
                        row: nil)
  end

  it 'init correct storage' do
    expect(instance_sheet.instance_variable_get(:@storage)).to be_a(YamlSaver)
  end

  it 'init correct rows' do
    expect(instance_sheet.instance_variable_get(:@rows)).to eq(nil)
  end

  it 'init correct new_row' do
    expect(instance_sheet.instance_variable_get(:@new_row)).to eq(nil)
  end

  it 'load data' do
    instance_sheet.instance_variable_set(:@new_row, row)
    instance_sheet.store
    expect(instance_sheet.load[0]).to be_a(Statistic::StatisticRow)
  end
end
