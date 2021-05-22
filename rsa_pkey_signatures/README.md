# RSA Digital Signature 

Here are some examples of generating / exporting an RSA key pair,
then using that key pair to sign a message and then verify the signature.

## Examples

* `generate.rb` - Generate and export public/private keys
* `gen.sh` - Generate and export public/private keys, but via `openssl`
* `sign.rb` - Sign a message and output Base64-encoded signature using the private key
* `verify.rb` - Verify the Base64-encoded signature using the public key

## How to Run These Examples

The example code will:

* Generate and export an RSA key pair to `key.pem` and `public.pem`
* Sign a message in a file named `message` using the private key
* Store the signature in a file named `signature`
* Verify the signature in `signature` for `message` using the public key

To just try it all out:

1. Run `ruby generate.rb` or `sh gen.sh`
1. Run `ruby sign.rb`
1. Run `ruby verify.rb`

Things to test:

* Change the `message` file to whatever message you'd like!
* Change the `signature` file after signing - does verification fail?
* Change the `message` file after signing - does verification fail?
