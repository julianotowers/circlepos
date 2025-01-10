ISBN-13 Check Digit Calculator

This Ruby service calculates the check digit for a 12-digit ISBN-13 prefix based on the ISBN-13 algorithm. It validates the input, computes the check digit, and returns the complete 13-digit ISBN.

Features

- Calculates the check digit for a given 12-digit ISBN-13 prefix.
- Validates input to ensure it's a string of exactly 12 numeric characters.
- Raises a meaningful error for invalid input.

How It Works

1. Each digit of the input is multiplied alternately by 1 and 3.
2. The results are summed.
3. The modulo 10 of the sum is subtracted from 10.
4. If the result is 10, the check digit is 0.

Example

For the input 978014300723:
1. Calculate the sum;
2. Compute the modulo;
3. Subtract from 10;
The resulted ISBN-13 is 9780143007234.# circlepos
