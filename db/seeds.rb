# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'csv'

csv_to_db_column = {
  "sbd" => "reg_num",
  "toan" => "math",
  "ngu_van" => "literature",
  "ngoai_ngu" => "f_language",
  "vat_li" => "physic",
  "hoa_hoc" => "chem",
  "sinh_hoc" => "biology",
  "lich_su" => "history",
  "dia_li" => "geo",
  "gdcd" => "ce",
  "ma_ngoai_ngu" => "f_language_id"
}

csv_file = File.join(Rails.root, 'db', 'data', 'scores.csv')

if File.exist?(csv_file)
  begin
    CSV.foreach(csv_file, headers: true) do |row|
      original_data = row.to_hash
      mapped_data = {}

      csv_to_db_column.each do |csv_col, db_col|
        value = original_data[csv_col]
        mapped_data[db_col] = value.present? ? value : 13
      end

      Score.create!(mapped_data)
    end

    puts "Success"
  rescue StandardError => e
    puts "Failed: #{e.message}"
  end
else
  puts "Not found at #{csv_file}"
end
