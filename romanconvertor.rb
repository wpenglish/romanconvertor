def fromRoman(romanNumber)
    specialValues = {
        1 => "I",
        5 => "V",
        10 => "X",
        50 => "L",
        100 => "C",
        500 => "D",
        1000 => "M"
    }

    index = 0
    sumOfRomanNumber = 0

    arrayOfRomanNumber = romanNumber.split(%r{\s*})
    lengthOfRomanNumber = arrayOfRomanNumber.length()

    while index < lengthOfRomanNumber

        if specialValues.has_value?(arrayOfRomanNumber[index]) != true
            raise TypeError
        end

        arabicOfIndex = specialValues.key(arrayOfRomanNumber[index])
        if index != lengthOfRomanNumber - 1
            if arabicOfIndex < specialValues.key(arrayOfRomanNumber[index + 1])
                arabicOfIndex = arabicOfIndex * -1
            end
        end

        sumOfRomanNumber = sumOfRomanNumber + arabicOfIndex
        index = index + 1
    end

    return sumOfRomanNumber
end



def toRoman(arabicNumber)
    specialValues = {
        1 => "I",
        4 => "IV",
        5 => "V",
        9 => "IX",
        10 => "X",
        40 => "XL",
        50 => "L",
        90 => "XC",
        100 => "C",
        400 => "CD",
        500 => "D",
        900 => "CM",
        1000 => "M"
    }

    if 0 >= arabicNumber or arabicNumber >= 4000
        raise RangeError
    end

    index = 12
    stringOfConvertedArabic = ''

    while arabicNumber > 0
        quotient = (arabicNumber / specialValues.keys[index]).floor
        arabicNumber = arabicNumber.modulo(specialValues.keys[index])

        while quotient > 0
            stringOfConvertedArabic = stringOfConvertedArabic + specialValues.values[index]
            quotient = quotient - 1
        end

        index = index - 1
    end

    return stringOfConvertedArabic
end