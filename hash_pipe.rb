require 'csv'
require 'awesome_print'

students = {}


def day_of_week(day)
  if day == "Monday"
    0
  elsif day == "Tuesday"
    1
  elsif day =="Wednesday"
    2
  elsif day == "Thursday"
    3
  elsif day =="Friday"
    4
  elsif day == "Saturday"
    5
  elsif day =="Sunday"
    6
  end
end

CSV.foreach('data/gschool_commute_data.csv') do |row|
  if students.has_key?(row[0])

    students[row[0]].push({
                              :week => row[1],
                              :day => row[2],
                              :mode => row[3],
                              :inbound => row[4],
                              :outbound => row[5],
                              :distance => row[6]
                          })


  else

    students[row[0]] = Array.new(1)
    students[row[0]][0] = {
        :week => row[1],
        :day => row[2],
        :mode => row[3],
        :inbound => row[4],
        :outbound => row[5],
        :distance => row[6]
    }

  end
end

students.each do |student|
  student[1].sort_by! { |k| [k[:week], day_of_week(k[:day])] }
end

p '='*40
ap students
