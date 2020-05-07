# frozen_string_literal: true

def caesar_cipher_string(input_string = 'ERROR', shift_amount = 0)
  lowercase_char_codes = ('a'..'z').to_a.map { |letter| letter.codepoints.join }
  uppercase_char_codes = ('A'..'Z').to_a.map { |letter| letter.codepoints.join }
  integer_char_codes = ('0'..'9').to_a.map { |letter| letter.codepoints.join }
  shifted_string = ''
  initial_shift_amount = shift_amount.to_int
  shift_sign = shift_amount[shift_amount.size * 8 - 1] == 1 ? -1 : 1
  input_string.each_char do |current_char|
    current_char_array = find_char_code_type(current_char,
                                             lowercase_char_codes,
                                             uppercase_char_codes,
                                             integer_char_codes)
    if current_char_array == []
      shifted_string += current_char
    else
      local_shift_amount = (initial_shift_amount.abs % current_char_array.length) * shift_sign
      if shift_amount.negative?
        #local_shift_amount = current_char_array.length - local_shift_amount - current_char_array.index(current_char.codepoints.join)
      end
      if local_shift_amount > current_char_array.length - current_char_array.index(current_char.codepoints.join) - 1
        #shifted_string += current_char_array[shift_sign * ((-1 * shift_sign) + local_shift_amount - current_char_array.length - current_char_array.index(current_char.codepoints.join))].to_i.chr
        shifted_string += current_char_array[local_shift_amount - (current_char_array.length - current_char_array.index(current_char.codepoints.join))].to_i.chr
      else
        shifted_string += current_char_array[(current_char_array.index(current_char.codepoints.join) + local_shift_amount)].to_i.chr
      end
    end
  end
  return shifted_string
end

def find_char_code_type(input_char = 'A', lowercase_char_codes = [],
                        uppercase_char_codes = [], integer_char_codes = [])
  char_code = input_char.codepoints.join
  return lowercase_char_codes if lowercase_char_codes.include?(char_code)
  return uppercase_char_codes if uppercase_char_codes.include?(char_code)
  return integer_char_codes if integer_char_codes.include?(char_code)

  return []
end


print caesar_cipher_string('a b c',  -25)