use 5.14.2;
no strict;

sub get_triplet {   
    my $N = shift;
    my @triplet;
    for $a (1..($N-2)) {
	for $b (1..($N-1-$a)) {
	    $c = $N - $b - $a;
	    $triplet[0] = $a; $triplet[1] = $b; $triplet[2] = $c;
	    @triplet = sort @triplet; 
	    if ($triplet[0]**2 + $triplet[1]**2 == $triplet[2]**2) {
		return @triplet;
	    }
	}
    }
    return undef;
}

my @triplet = get_triplet(shift);

if (@triplet) {
    say "Pythagorean triplet:";
    say for (@triplet);
    say "Product of triplet:";
    $prod = 1;
    for (@triplet) {
	$prod *= $_;
    }
    say $prod;
}
else {
    say "We ain't found shit!";
}
    
