require 'csv'
require 'awesome_print'

students = {}

CSV.foreach('data/gschool_commute_data.csv') do |row|
  students[row[0]] = {
      :week => row[1],
      :day => row[2],
      :mode => row[3],
      :inbound => row[4],
      :outbound => row[5],
      :distance => row[6]
  }
end
p '='*40
ap students