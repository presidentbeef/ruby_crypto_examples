require 'minitest'
require 'minitest/autorun'

class TestECSignature < Minitest::Test
  def setup
    File.open('message', 'w') do |file|
      file.write "Random message #{rand}"
    end
  end

  def teardown 
    ['signature',
     'message',
     'key.pem',
     'public.pem'
    ].each do |file_name|
      File.delete file_name if File.exist? file_name 
    end
  end

  def load_file path
    load File.join(__dir__, '..', 'ec_pkey_signatures', path)
  end

  def test_generate
    assert_output(/BEGIN EC PRIVATE KEY.*BEGIN PUBLIC KEY/m) do
      load_file 'generate.rb'
    end

    assert File.exist? 'key.pem'
    assert File.exist? 'public.pem'
  end

  def test_sign
    test_generate

    assert_output(/Wrote signature to/) do
      load_file 'sign.rb'
    end

    assert File.exist? 'signature'
  end

  def test_verify
    test_generate
    test_sign

    assert_output(/Signatures matched!/) do
      load_file 'verify.rb'
    end
  end

  def test_invalid_signature
    test_generate

    File.open('signature', 'w') do |file|
      file.write "garbage #{rand}"
    end

    assert_output('', /There was an error/) do
      assert_raises SystemExit do
        load_file 'verify.rb'
      end
    end
  end

  def test_tampered_message
    test_generate
    test_sign

    File.open('message', 'a') do |file|
      file.write "garbage #{rand}"
    end

    assert_output(/Signatures did not match!/) do
      load_file 'verify.rb'
    end
  end
end
