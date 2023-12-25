
```
function _number_format($number) {
    $bn = array("১", "২", "৩", "৪", "৫", "৬", "৭", "৮", "৯", "০");
    $en = array("1", "2", "3", "4", "5", "6", "7", "8", "9", "0");
    $num = \NumberFormatter::create('bn_BD', \NumberFormatter::DECIMAL);
    $num->setAttribute(NumberFormatter::FRACTION_DIGITS, 2);
    $numbers = $num->format($number);
    return str_replace($bn, $en, $numbers);
}
echo _number_format(1234567.469);
```
