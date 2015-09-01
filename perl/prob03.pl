use 5.14.2;

sub largest_prime_factor {
    my $num = $_[0];
    if($num <=2) { return 2;}
    for (2..int($num/2)){
	if($num % $_ == 0) {
	    return &largest_prime_factor(int($num/$_));
	}
    } 
    return $num;
}

say &largest_prime_factor($ARGV[0]);
