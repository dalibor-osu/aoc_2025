$path = "input.txt";
open(DATA, "<$path") or die "Couldn't open file $path, $!";

$result = 0;
while(<DATA>) {
    $line = "$_";
    $max = 0;
    $len = length($line);
    for ($i = 0; $i < $len - 2; $i = $i + 1) {
        $first = substr($line, $i, 1);
        for ($j = $i + 1; $j < $len - 1; $j = $j + 1) {
            $num = int($first . substr($line, $j, 1));
            if ($num > $max) {
                $max = $num;
            }
        }
    }
    $result = $result + $max;
    $max = 0;
}
print "$result\n"
