1.upto(10) do |i|
  Question.seed(id: i, title: "Question: #{i}", description: "Description #{i}", sequence: i)
end
