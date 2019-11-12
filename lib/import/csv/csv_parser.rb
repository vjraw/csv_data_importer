# generic parser
module Import
  module Csv
    class CsvParser
      require 'csv'

      def initialize(type)
        @object = Object.const_get type
      end

      def parse(file_path:)
        CSV.foreach(file_path, headers: true) do |row|
          process(row)
        end
      end

      #ToDO: Make this as a abstract class
      def process(row)
        if row['Affiliations'].present?
          name = parse_name(row['Name'])
          person = @object.create!(
                    first_name: name[:first_name],
                    last_name: name[:last_name],
                    species: row['Species'],
                    gender: row['Gender'],
                    weapon: row['Weapon'],
                    vehicle: row['Vehicle']
                  )

          row['Location'].split(',').each do |loc|
            person.locations.create!(name: loc.strip)
          end if row['Location'].present?

          row['Affiliations'].split(',').each do |aff|
            person.affiliations.create!(name: aff.strip)
          end

        end
      end

      def parse_name(full_name)
        name_hash = {}
        name_hash[:first_name] = full_name.split(' ').first
        full_name.sub!(name_hash[:first_name], "").strip!
        name_hash[:last_name] = full_name.split(' ').last if full_name.present?
        name_hash
      end

    end
  end
end
