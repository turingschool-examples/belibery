fan = Fan.new(name: 'Steve', email: "seeing_is_beliebing@example.com")
puts "Created #{fan.name}." if fan.save

fan = Fan.new(name: 'Josh', email: "belieb_me333@example.com")
puts "Created #{fan.name}." if fan.save

fan = Fan.new(name: 'Rachel', email: "yosoybelieber@example.com")
puts "Created #{fan.name}." if fan.save
