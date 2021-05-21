# Generate and export public/private key pair
# to key.pem and public.pem
#
# This is the same as running generate.rb
openssl ecparam -name prime256v1 -genkey -noout -out key.pem
openssl ec -in key.pem -pubout -out public.pem
