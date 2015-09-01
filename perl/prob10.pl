use 5.14.2;
#no strict;

my @primes = (2);


my $N = $ARGV[0];
foreach my $num (3..$N) {
    my $max = sqrt($num);
    foreach my $p (@primes) {
	if ($p > $max) {
	    push @primes, $num;
	    last;
	} 
	elsif ($num % $p == 0) {
	    last;
	}
    }
}

my $sum = 0;
foreach my $p (@primes) {
    $sum += $p;
}

say $sum;
