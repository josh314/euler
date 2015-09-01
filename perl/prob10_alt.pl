use 5.14.2;
#no strict;

my $sum = 0;
my $N = $ARGV[0];
foreach my $num (2..$N) {
    my $max = sqrt($num);
    my $num_is_prime = 1;
    foreach (2..$max) {
	if($num % $_ == 0) {
	    $num_is_prime = 0;
	    last;
	}
    }
    if ($num_is_prime) {
	$sum += $num;
    }
}

say $sum;
