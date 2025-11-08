#!/usr/bin/env ruby
# frozen_string_literal: true

require 'yaml'
require 'time'
require 'set'

METRICS_PATH = File.expand_path('../_data/metrics.yml', __dir__)
COLLECTIONS_DIR = File.expand_path('../collections', __dir__)

def load_front_matter(path)
  content = File.read(path)
  return {} unless content.start_with?('---')

  _leading, front_matter, _rest = content.split('---', 3)
  YAML.safe_load(front_matter, aliases: true) || {}
rescue StandardError
  {}
end

def book_files
  Dir[File.join(COLLECTIONS_DIR, '**', 'books', '**', 'index.md')]
end

def collection_directories
  Dir.children(COLLECTIONS_DIR).map { |entry| File.join(COLLECTIONS_DIR, entry) }
                    .select { |path| File.directory?(path) }
end

books = book_files.map { |path| load_front_matter(path) }
collections = collection_directories

language_counts = books.map { |book| book['language'].to_s.strip }.reject(&:empty?).tally
unique_tags = books.flat_map { |book| Array(book['tags']) }.compact.map(&:to_s).reject(&:empty?).to_set
unique_authors = books.map { |book| book['author'].to_s.strip }.reject(&:empty?).to_set

metrics = {
  'generated_at' => Time.now.utc.iso8601,
  'books' => books.size,
  'collections' => collections.size,
  'language_total' => language_counts.keys.size,
  'languages' => language_counts,
  'tags' => unique_tags.size,
  'authors' => unique_authors.size
}

if File.exist?(METRICS_PATH)
  existing = YAML.load_file(METRICS_PATH) || {}
  metrics['visits'] = existing['visits'] if existing.key?('visits')
  metrics['visits_display'] = existing['visits_display'] if existing.key?('visits_display')
end

if ENV['VISITS_COUNT']
  metrics['visits'] = ENV['VISITS_COUNT'].to_i
end

if ENV['VISITS_DISPLAY']
  metrics['visits_display'] = ENV['VISITS_DISPLAY']
end

File.write(METRICS_PATH, metrics.to_yaml)
puts "Metrics updated in #{METRICS_PATH}"
