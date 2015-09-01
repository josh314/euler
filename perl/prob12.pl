use 5.14.2;


my $N = $ARGV[0]; #target number of divisors;

my $num_div = 0;
my $n = 1;#counter
while ($num_div <= $N) { #fails when $num_div greater than target
    my $num1 = 0;
    my $num2 = 0;
    if($n % 2) {
	$num1 = $n;
	$num2 = ($n+1)/2;
    }
    else {
	$num1 = $n/2;
	$num2 = $n+1;
    }

    my $num_div1 = 2; #Never test for 1 or $num1
    my $num_div2 = 2;

    for (2..($num1/2)) {
	if($num1 % $_ == 0) {
	    $num_div1+=1;
	}
    }
    for (2..($num2/2)) {
	if($num2 % $_ == 0) {
	    $num_div2+=1;
	}
    }

    $num_div = $num_div1 * $num_div2; 
    $n+=1;
}
$n--;
say "T_$n = ", $n*($n+1)/2;
