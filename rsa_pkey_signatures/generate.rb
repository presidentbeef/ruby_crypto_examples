require 'openssl'

# Pick a key size 
key_size = 4096

# Generate a random key pair
key_pair = OpenSSL::PKey::RSA.generate(key_size)

# Export private key as PEM
private_key_pem = key_pair.to_pem

# Export public key as PEM
public_key_pem = key_pair.public_key.to_pem

# Output keys for your convenience
File.open('key.pem', 'w') do |file|
  file.puts private_key_pem
end

File.open('public.pem', 'w') do |file|
  file.puts public_key_pem
end

puts 'Wrote private key to `key.pem`'
puts 'Wrote public key to `public.pem`'
puts
puts private_key_pem
puts
puts public_key_pem
