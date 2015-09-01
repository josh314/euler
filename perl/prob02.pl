use 5.14.2;

my $max=$ARGV[0];   #4*1000*1000;
my $sum=0;

my @fib;

$fib[0]=1;
$fib[1]=1;

my $idx = 1;
my $cur = $fib[1];
while ($cur < $max) {
    if($cur % 2 == 0) {
	$sum += $cur;
    }
    $idx++;
    $fib[$idx] = $fib[$idx-1] + $fib[$idx-2];
    $cur = $fib[$idx];
}

say $sum;
