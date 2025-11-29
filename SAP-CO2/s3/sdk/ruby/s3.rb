require 'aws-sdk-s3'     # Load the AWS SDK for Ruby S3 client
require 'pry'            # Load pry for debugging (optional)
require 'securerandom'   # Load SecureRandom to generate random content

bucket_name = ENV['BUCKET_NAME']   # Get the bucket name from environment variable
region = ENV['AWS_REGION'] || 'us-east-1'

client = Aws::S3::Client.new(region: region)     # Initialize a new S3 client

# Create a new S3 bucket with the given name and region
resp = client.create_bucket({
  bucket: bucket_name, 
  create_bucket_configuration: {
    #location_constraint: region,   # Specify the region (variable 'region' should be defined)
  }
})

#binding.pry

# Generate a random number of files between 1 and 6
number_of_files = 1+rand(6)
puts "number_of_files: ${number_of_files}"   # Print the number of files to be created (string interpolation)

# Loop over the number of files
number_of_files.times.each do |i|
    puts "i: #{i}"                       # Print the current file index
    filename = "file_#{i}.txt"          # Generate a filename for the file
    output_path = "/tmp/#{filename}"    # Define the full path where the file will be created

    # Create a local file with random UUID content
    File.open(output_path, "w") do |file|
        file.write SecureRandom.uuid
    end

    # Open the generated file and upload it to S3
    File.open(output_path, 'rb') do |f|
        client.put_object(
            bucket: bucket_name,    # Specify the bucket name (variable 'bucket-name' should exist)
            key: filename,          # Use the filename as the S3 object key
            body: f                 # Upload the file content
        )
    end
end
