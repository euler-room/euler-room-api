####################################################################################################
#   Problem 59
#   XOR decryption
#
#   Each character on a computer is assigned a unique code and the preferred standard
#   is ASCII (American Standard Code for Information Interchange). For example,
#   uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.
#
#   A modern encryption method is to take a text file, convert the bytes to ASCII,
#   then XOR each byte with a given value, taken from a secret key. The advantage
#   with the XOR function is that using the same encryption key on the cipher text,
#   restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.
#
#   For unbreakable encryption, the key is the same length as the plain text message,
#   and the key is made up of random bytes. The user would keep the encrypted message
#   and the encryption key in different locations, and without both "halves", it is
#   impossible to decrypt the message.
#
#   Unfortunately, this method is impractical for most users, so the modified method
#   is to use a password as a key. If the password is shorter than the message, which
#   is likely, the key is repeated cyclically throughout the message. The balance for
#   this method is using a sufficiently long password key for security, but short
#   enough to be memorable.
#
#   Your task has been made easy, as the encryption key consists of three lower case
#   characters. Using p059_cipher.txt (right click and 'Save Link/Target As...'), a
#   file containing the encrypted ASCII codes, and the knowledge that the plain text
#   must contain common English words, decrypt the message and find the sum of the
#   ASCII values in the original text.
#
####################################################################################################


{
  80=>107,
  69=>86,
  88=>77,
  0=>75,
  17=>73,
  29=>70,
  21=>65,
  12=>65,
  4=>61,
  22=>56,
  10=>52,
  23=>46,
  11=>43,
  25=>42,
  16=>38,
  3=>36,
  13=>33,
  2=>31,
  30=>26,
  28=>25,
  8=>25,
  31=>24,
  20=>22,
  19=>21,
  24=>21,
  9=>20,
  1=>19,
  18=>11,
  84=>16,
  5=>15,
  27=>10,
  6=>11,







  66=>2,
  7=>9,
  71=>1,
  60=>1,
  82=>2,
  35=>2,
  63=>1,
  65=>9,
  87=>9,
  83=>8,
  73=>7,
  26=>7,
  70=>7,
  92=>6,
  67=>5,
  75=>5,
  94=>4,
  81=>4,
  72=>3,
  78=>3,
  64=>3,
  77=>3,
  49=>3,
  86=>4,
  68=>3,
  91=>2,
  74=>2,
  36=>2,
  15=>2,
  76=>2,
  44=>2,
  14=>2,
  95=>2,
  57=>1,
  45=>1,
  62=>1,
  61=>1,
  54=>1,
  89=>1}

, , ,

file_name = "p059_cipher.txt"
cipher_arr = []
IO.foreach("/Users/not.gregory.buchanan/Desktop/#{file_name}") do |ascii|
  cipher_arr << ascii.split(",").map{ |val| val.to_i }
end
cipher_arr.flatten!

msg_arr = []
key = 'exp'
msg_sum = 0
cipher_arr.each_with_index do |cipher_ascii, i|
  decrypted_val = (key[i%3].bytes[0] ^ cipher_ascii)
  msg_sum += decrypted_val
end
puts "SUM: #{msg_sum}"

[*('exa'..'exz')].each do |key|
  msg_arr = []

  cipher_arr.each_with_index do |cipher_ascii, i|
    decrypted_char = (key[i%3].bytes[0] ^ cipher_ascii).chr
    # if ["~", "@", "#", "$", "%", "^", "*", "-", "_", "+", "=", "[", "]", "{", "}", ";", "`", '\\' ":", "/", ">", "<"].include?(decrypted_char)
    #   msg_arr = []
    #   break
    # end
    msg_arr << decrypted_char
  end
  puts "#{key}: #{msg_arr.join()}" if msg_arr.join().length > 0
end
