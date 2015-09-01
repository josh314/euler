#Implements Dijkstra algorithm on triangular array of edge lengths imported by file.
#!/Users/jdavis/perl5/perlbrew/perls/perl-5.14.2/bin/perl                     
use v5.14.2;
use warnings;
use utf8;
use constant {
    TRUE => 1,
    FALSE => "",
    FILE_FINISH => 1,
};
# usage: Data::Dumper->Dump([array of $refs], [qw(names for $refs])
use Data::Dumper (); 
#use Data::Dump ();
use Data::Printer ();

sub build_graph {

    my @nums = @{$_[0]};

#one vertex for each number read in plus the starting and ending vertices
    my @vertices;
    for (0..2+$#nums) {
	$vertices[$_] = {};
    }

    sub get_index {
	my ($i,$j) = @_;
	$j*($j-1)/2 + $i;	
    }

    sub get_grid_points {
	my $N = shift;
	my $j = 1;
	$j++ until (($j+1)*$j/2 >= $N );
	($N-$j*($j-1)/2, $j);
    }

    sub make_edge {
	my %edge;
#	($edge{destination},$edge{weight}) = @_;
	my $dest = shift;
	$edge{destination} = $dest->{name}; 
	$edge{weight} = shift;
	\%edge;
    }
    
    sub first_vertex() {
	my $vertex = shift;
	$vertex->{distance} = 0;
	$vertex->{parent} = undef;
	my @edges;
	push @edges, make_edge($vertices[1], $nums[0]);
	$vertex->{edges} = \@edges;
    }
    sub middle_vertex() {
	my $vertex = shift;
	my $N = $vertex->{name};
	my ($i,$j) = get_grid_points($N);
	my $N1 = get_index($i, $j+1);
	my $N2 = get_index($i+1, $j+1);
	my @edges;
	push @edges, make_edge($vertices[$N1], $nums[$N1-1]);
	push @edges, make_edge($vertices[$N2], $nums[$N2-1]);
	$vertex->{edges} = \@edges;
    }
    sub last_row_vertex() {
	my $vertex = shift;
	my @edges;
	push @edges, make_edge($vertices[$#nums+2], 0);
	$vertex->{edges} = \@edges;
    }
    sub last_vertex() {
	my %vertex;
	$vertex{name} = $#nums + 2;
	\%vertex;
    }

    my $i=0;
    for my $v (@vertices) {
	$v->{name} = $i++;
	$v->{distance} = undef;
    }
    
    my (undef,$last_row_index) = get_grid_points($#vertices-1);
    my $last_row_threshold = get_index($last_row_index-1,$last_row_index-1);
    for my $v (@vertices) {
#	say Data::Dumper->Dump([\@vertices], [qw(*vertices)]);
	given($v->{name}) {
	    when ($v->{name}==0) {&first_vertex($v)}
	    when ($v->{name} == $#vertices) {&last_vertex($v)}
	    when ($v->{name} > $last_row_threshold) {&last_row_vertex($v)}
	    default {&middle_vertex($v)}
	}
#	say "\$v is: $v";
#	say Data::Dumper->Dump([$v], [qw(*v)]);
    }
#    say Data::Dumper->Dump([\@vertices], [qw(*vertices)]);
    return \@vertices;
}

sub main {
## import prob17.data ###
    open(my $fh,'<', shift);
    chomp(my @rows = <$fh>);
    my $num_rows = $#rows+1;
    close($fh);
#    my @nums = map {split(/\s+/,$_)} @rows;
    my @nums = map {100 - $_} map {split(/\s+/,$_)} @rows;
#    for my($i,$row) = each(@rows) {
#	my @entries = map {100 - $_} map {split(/\s+/,$_)} @rows;
#	    for my($j,$entry) = each(@entries) {
#		my $key = $i . ":" . $j;
#		$nums{$key} = $entry;
#	}
#    }


##build graph
    my $graph = build_graph(\@nums);
#    say Data::Dumper->Dump([$graph], [qw(*graph)]);    
## populate queue
    my @queue =  @$graph;
#    say Data::Dumper->Dump([\@queue], [qw(*queue)]);    
#    Data::Printer::p(@queue); 
   
## for the sort in the while loop below
    sub by_distance {
	if(defined($a->{distance})) {
	    return $b->{distance}? $a->{distance}<=>$b->{distance}: -1;
	}
	return $b->{distance}? 1: 0;
    }
    
## perform shortest paths algo
    while (my $v = shift @queue) {
#	say Data::Dumper->Dump([$v->{'edges'}], [qw(*v->edges?)]);
        last if($v == $graph->[-1]);
	my $edges = $v->{edges};
	for my $e (@$edges) {
#	    say Data::Dumper->Dump([$e], [qw(*e)]);
	    my $tmp_weight = $v->{distance} + $e->{weight};
	    my $destination = $graph->[$e->{destination}];
#	    say Data::Dumper->Dump([$destination], [qw(*dest)]);
	    unless(defined($destination->{distance}) && $destination->{distance} < $tmp_weight){
		$destination->{distance} = $tmp_weight;
		$destination->{parent} = $v->{name};
	    }
	}
	@queue = sort by_distance @queue;
#	say "Pause";
    }

    my $path_sum = 100*$num_rows - $graph->[-1]{distance}; 
    say "Path length is $path_sum";
    
#    my $cur = $graph->[-1];
#    while(defined($cur->{parent})) {
#	say $cur->{name};
#	$cur = $graph->[$cur->{parent}];
#    }

}

main(@ARGV);

#### File ends with true statement so it can be evaluated via 'require' ####
TRUE;
