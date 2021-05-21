require 'openssl'
require 'base64'

# Message that was signed
message = File.read('message')

# Base64-encoded signature
signature_b64 = File.read('signature')

# Decode from Base64
signature = Base64.decode64(signature_b64)

# Load public key from a configuration or database value
# This key is NOT sensitive!
public_key_pem = File.read('public.pem')
public_key = OpenSSL::PKey.read(public_key_pem)

begin
  digest = OpenSSL::Digest::SHA256.new

  # Returns true if the signature is correct, false otherwise
  if public_key.verify(digest, signature, message)
    puts 'Signatures matched!'
  else
    puts 'Signatures did not match!'
  end
rescue OpenSSL::PKey::PKeyError => e
  # This error can be raised if the signature
  # is not even a invalid signature
  abort "There was an error: #{e.inspect}"
end
