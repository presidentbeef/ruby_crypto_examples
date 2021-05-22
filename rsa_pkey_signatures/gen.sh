# Generate and export public/private key pair
# to key.pem and public.pem
#
# This is the same as running generate.rb
openssl genrsa -out key.pem 4096
openssl rsa -in key.pem -pubout -out public.pem
