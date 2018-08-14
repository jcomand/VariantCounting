# This script counts the number of matches of each regular expression in "probelist.txt" in the file(s) specified as arguments. Output is to STDOUT.
my @inputfiles=@ARGV;
my $regexps='probelist.txt'; #hardcoded filename
open REGEXPS, $regexps or die "FILE $regexps NOT FOUND - $!\n";
my @regexp = <REGEXPS>;
foreach (@ARGV) {
	$infile = $_;
	chomp $infile;
	$output = ` sed -n '2~4p' $infile > stripped$infile `; #relies on fastq to have seq on ev 4th line st w 3rd. also should use tmpfilename
	#print "processing $infile\n";
	#$count  = `grep -c 'GACGATGAGGCCTCTGCTAC\\|GTAGCAGAGGCCTCATCGTC' $infile`;
	for my $i (0 .. $#regexp) {                
		chomp $regexp[$i];
		$count[$i]  = `grep -c '$regexp[$i]' stripped$infile`;
                chomp $count[$i];
		print "$infile\t$regexps\t$i\t$regexp[$i]\t$count[$i]\n";
	}
	

}
#print @count;

