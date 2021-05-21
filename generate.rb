require 'openssl'

# Output possible options for EC groups
# puts OpenSSL::PKey::EC.builtin_curves

# Pick a curve group
curve_group = 'prime256v1'

# Generate a random key pair
key_pair = OpenSSL::PKey::EC.generate(curve_group)

# Export private key as PEM
# This is a very sensitive secret value!
private_key_pem = key_pair.to_pem

# Do a dance to export just the public key
# This is not sensitive!
public_key_holder = OpenSSL::PKey::EC.new(key_pair.group)
public_key_holder.public_key = key_pair.public_key
public_key_pem = public_key_holder.to_pem

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
