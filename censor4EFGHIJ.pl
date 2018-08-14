# This script censors (changes to "N") any basepair in a fastq file whose qaulity score does not match one of the characters [EFGHIJ]
# Usage: perl censor4EFGHIJ.pl < SampleWtPlasmid.fastq > censoredSampleWtPlasmid.fastq
#
while (<>){
	$line1 = $_;
	$line2=<>;
	$line3=<>;
	$line4=<>;
	#print "line1 $line1 \n\n line2 $line2 \n\n line3 $line3 \n\n line4 $line4\n\n\n";
	@line2a=split(//,$line2);
	@line4a=split(//,$line4);
	for ($i=0;$i<$#line2a;$i++) {
		#print "i $i $line4a[$i]\n";
		if ($line4a[$i] !~ /[EFGHIJ]/) {
			#print "$line4a[$i]";
			$line2a[$i]="N";
		}
	}
	$newline2=join("",@line2a);
	print "$line1$newline2$line3$line4";
	#print "next\n";
}
