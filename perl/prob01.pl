#!/Users/jdavis/perl5/perlbrew/perls/perl-5.14.2/bin/perl5.14.2

use 5.14.2;
no strict;

$sum = 0;

for (1..999) {
    if (($_ % 3==0) || ($_ % 5==0)) {
	$sum += $_;
    }
}

say $sum;
