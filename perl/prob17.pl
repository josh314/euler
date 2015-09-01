#!/Users/jdavis/perl5/perlbrew/perls/perl-5.14.2/bin/perl
use v5.14.2;
use warnings;
use utf8;
use constant {
    TRUE => 1,
    FALSE => "",
};
# usage: Data::Dumper->Dump([array of $refs], [qw(labels for $refs)])
use Data::Dumper (); 

#length of "ones" words like "one", "two", ... "nine"
#note that zero isn't explicitly stated, i.e. has no length
my @ones_letters = (0,3,3,5,4,4,3,5,5,4);
my $ones_total = 0;
$ones_total+=$ones_letters[$_] for (1..9);
$ones_total*=90;
#words "one" .. "nine" each appear 90 times in the ones place betweeen 1..1000

#length of "teens" words like "ten", "eleven" ... "nineteen"
my @teens_letters = (3,6,6,8,8,7,7,9,8,8);
my $teens_total = 0;
$teens_total+=$teens_letters[$_] for (0..9);
$teens_total*=100;
#words "ten" .. "nineteen" each appear 100 times betweeen 1..1000

#length of "tens" words like "twenty", "thirty", ... "ninety"
#note that the 0 and 1 indices are empty
my @tens_letters = (0,0,6,6,5,5,5,7,6,6);
my $tens_total = 0;
$tens_total+=$tens_letters[$_] for (2..9);
$tens_total*=10;
#words "twenty" .. "ninety" each appear 10 times betweeen 1..1000

#letters in phrase "hundred and" 
my $hundreds_letters = 10;
my $hundreds_total = 0;
$hundreds_total+=$ones_letters[$_]+$hundreds_letters for (1..9);
$hundreds_total*=100;
#each phrase "One hundred and" appears 100 times.


#letters in "one thousand"
my $thousands_letters = 11;

my $total = $ones_total + $teens_total + $tens_total + $hundreds_total + $thousands_letters;

say "Total number of letters: ", $total;

 
