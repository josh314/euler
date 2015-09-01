#!/Users/jdavis/perl5/perlbrew/perls/perl-5.14.2/bin/perl                     
use v5.14.2;
use warnings;
use utf8;
use constant {
    TRUE => 1,
    FALSE => "",
    FILE_FINISH => 1,
};

use bigint;
my $freakin_huge_number = 2 ** 1000;# . "";
my $sum = 0;
for my $digit (split(//, $freakin_huge_number)) {
    $sum += $digit;
}
say $sum;

#### File ends with true statement so it can be evaluated via 'require' ####
TRUE;
