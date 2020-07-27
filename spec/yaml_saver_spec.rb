RSpec.describe YamlSaver do
  after(:all) do
    File.delete(YamlSaver::DEFAULT_YAML_FILE_NAME)
  end
  let(:empty_instance) { described_class.new }
  let(:entity) { [1, 2, 2, 3, 4] }

  it 'correct create instance with correct filename' do
    expect(empty_instance.instance_variable_get(:@file_name)).to eq(described_class::DEFAULT_YAML_FILE_NAME)
  end

  it 'correct create instance with correct permitted_classes' do
    expect(empty_instance.instance_variable_get(:@permitted_classes)).to eq([])
  end

  it 'create file with "@file_name" if it not exists' do
    expect(File.exist?(empty_instance.instance_variable_get(:@file_name))).to be_truthy
  end

  it 'do not create file with "@file_name" if it exists' do
    old_time_created = File.new(empty_instance.instance_variable_get(:@file_name)).ctime
    new_instance = described_class.new
    new_time_created = File.open(new_instance.instance_variable_get(:@file_name)).ctime
    expect(old_time_created).to eq(new_time_created)
  end

  it 'store data' do
    empty_instance.store(entity)
    readed_data = File.open(empty_instance.instance_variable_get(:@file_name)) { |file| Psych.safe_load(file) }
    expect(readed_data).to eq(entity)
  end

  it 'load data' do
    empty_instance.store(entity)
    expect(empty_instance.load).to eq(entity)
  end
end
