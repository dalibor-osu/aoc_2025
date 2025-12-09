$path = "input.txt";
open(DATA, "<$path") or die "Couldn't open file $path, $!";

$result = 0;
while(my $line = <DATA>) {
    $max = 0;
    $len = length($line);
    for ($i = 0; $i < $len - 2; $i = $i + 1) {
        for ($j = $i + 1; $j < $len - 1; $j = $j + 1) {
            $num = int(substr($line, $i, 1) . substr($line, $j, 1));
            $max = $num > $max ? $num : $max;
        }
    }
    $result = $result + $max;
}
print "$result\n"
