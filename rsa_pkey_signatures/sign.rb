require 'openssl'
require 'base64'

# Read in message to be signed
message = File.read('message')

# Load private key from PEM
private_key_pem = File.read('key.pem')
private_key = OpenSSL::PKey.read(private_key_pem)

# Generate signature for a message
# For some reason you have to pass in an empty
# hash digest
digest = OpenSSL::Digest::SHA256.new
signature = private_key.sign(digest, message)

# Encode as Base64 since it's binary otherwise
# This is useful if the signature is being sent in
# an HTTP request
signature_b64 = Base64.strict_encode64(signature)

# Write out signature to a file for later use
File.open('signature', 'w') do |file|
  file.puts signature_b64
end

puts 'Wrote signature to `signature`'
puts
puts signature_b64
