# frozen_string_literal: true
require 'fileutils'

def replace_in_file(file_path, replacements)
  # Read the content of the file
  text = File.read(file_path)
  # Replace each occurrence of the original with its replacement in the file's content
  replacements.each { |original, replacement| text.gsub!(original, replacement) }
  # Write the updated content back to the file
  File.open(file_path, "w") { |file| file.puts text }
end

def traverse_and_replace(start_dir, replacements)
  # Traverse through all files and directories within the specified start directory
  Dir.glob("#{start_dir}/**/*").each do |path|
    if File.file?(path)
      # Replace content in the file and rename the file if necessary
      replace_in_file(path, replacements)
      new_path = path.dup
      replacements.each { |original, replacement| new_path.gsub!(original, replacement) }
      FileUtils.mv(path, new_path) if path != new_path
    elsif File.directory?(path)
      # Rename directories and recurse into them
      new_path = path.dup
      replacements.each { |original, replacement| new_path.gsub!(original, replacement) }
      FileUtils.mv(path, new_path) if path != new_path
      traverse_and_replace(new_path, replacements)
    end
  end
end

def create_replacements(singular, plural)
  {
    '$F$plural_name$' => plural.downcase.gsub(' ', '_'),        # For files/directories in lowercase with underscores
    '$F$singular_name$' => singular.downcase.gsub(' ', '_'),    # For files/directories in lowercase with underscores
    '$plural_name$' => plural.downcase.gsub(' ', '_'),                         # Plural name in text
    '$singular_name$' => singular.downcase.gsub(' ', '_'),                     # Singular name in text
    '$Plural_name$' => plural.split.map(&:capitalize).join,     # Plural name in text with each word capitalized
    '$Singular_name$' => singular.split.map(&:capitalize).join  # Singular name in text with each word capitalized
  }
end

# Example usage:
singular_name = "Example name"
plural_name = "Examples names"
replacements = create_replacements(singular_name, plural_name)
script_directory = File.dirname(__FILE__)
start_directory = File.join(script_directory, 'component')
traverse_and_replace(start_directory, replacements)
print("Componente created with success!")
