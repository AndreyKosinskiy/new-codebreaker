# frozen_string_literal: true

require 'yaml'
# YamlSaver class for store/load entity
class YamlSaver
  DEFAULT_YAML_FILE_NAME = 'data.yaml'

  def initialize(file_name: DEFAULT_YAML_FILE_NAME, permitted_classes: [])
    @file_name = file_name
    @permitted_classes = permitted_classes

    File.new(@file_name, File::CREAT) unless File.exist?(@file_name)
  end

  def store(entity = [])
    File.open(@file_name, 'w') { |f| YAML.dump(entity, f) }
  end

  def load
    options = { permitted_classes: @permitted_classes, aliases: true }
    File.open(@file_name) { |file| YAML.safe_load(file, **options) }
  end
end
