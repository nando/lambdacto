# Copyright 2016 The Cocktail Experience, S.L.
require "minitest/autorun"
require "json"

# Remove files in ./tmp before running the tests again
FileUtils.rm_rf Dir.glob("tmp/*")

class LambdaTest
  LAMBDA_NAME = "TheCocktailNewContact"

  def self.invoke_lambda(payload_file, output_file)
    params = "--function-name #{LAMBDA_NAME} " <<
             "--payload file://#{payload_file} #{output_file}"

    `aws lambda invoke #{params}`
  end

  def self.invoke_events_in_directory(event_response)
    Dir["test/events/#{event_response}/*.json"].each do |json_file|
      filename = File.basename(json_file)
      printf "> #{filename}... "
      output_file = "tmp/#{filename}.output"
      invoke_lambda json_file, output_file
      yield filename, File.read(output_file)
    end
  end
end

describe "The Coctail new contact lambda" do
  it "returns 0 when the payload has the right params" do
    puts "\nTesting success scenarios:"
    LambdaTest.invoke_events_in_directory("succeeded") do |filename, output|
      expect(output.to_i).must_equal 0
      puts "OK!"
    end
  end

  it "returns the right error for each wrong payload" do
    puts "\nTesting failure scenarios:"
    LambdaTest.invoke_events_in_directory("failed") do |filename, output|
      error_words = JSON.parse(output)["errorMessage"].scan(/(\w+)/)
      expect(error_words.join("_").+(".json")).must_equal filename
      puts "OK!"
    end
  end
end
