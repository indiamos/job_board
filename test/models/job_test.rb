require 'test_helper'
require 'pp'

class JobTest < ActiveSupport::TestCase
  test "job title is titleized" do
    job = Job.create(title: "this is a title", description: "Describe me")
    # assert job.title == "This Is A Title"
    # ^ this just gives you a boolean
    assert_equal job.title, "This Is A Title"
    # ^ this tells you what was expected vs. actual
  end

  test "job requires title and description" do
    job = Job.new(title: 'Hello World', description: "This is a test.")
    assert job.valid?

    job = Job.new(title: 'Broken')
    assert job.invalid?
  end

  test "Should return an error if there's no description" do
    job = Job.new(title: 'Hello World')
    job.valid?

    pp job.errors[:description]
  end
end
