use 5.14.2;
no strict;
my $file;
open $file, '<', $ARGV[0];
my $N = 20;

my @grid;

while(chomp(my $line = <$file>)) {
    my @row = split / /, $line;
    my $r = \@row;
    push @grid, $r;
}

my $max_prod=0;
foreach $i (0..($N-1)) {
    foreach $j (0..($N-1)) {
	my @prods = ();
	my $prod=1;
#only one $prod variable. will get overwritten if multiple if branches entered
	if ($i <= $N-4) {
 	    foreach (0..3) {
		$prod *= $grid[$i+$_][$j];
	    }
	    push @prods, $prod;	    
	    $prod=1;

	    if($j <= $N-4) {
		foreach (0..3) {
		    $prod *= $grid[$i+$_][$j+$_];
		}
		push @prods, $prod;
		$prod=1;
	    }


	    if($j >= 3) {
		foreach (0..3) {
		    $prod *= $grid[$i+$_][$j-$_];
		}
		push @prods, $prod;
		$prod=1;
	    }
	}
	if($j <=$N-4) {
 	    foreach (0..3) {
		$prod *= $grid[$i][$j+$_];
	    }
	    push @prods, $prod;
	    $prod=1;
	}
	foreach (@prods) {
	    if($_ > $max_prod){
		$max_prod = $_;
	    }
	}
    }
}

say $max_prod;

