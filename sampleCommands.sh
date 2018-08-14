perl censor4EFGHIJ.pl < SampleWtPlasmid.fastq > censoredSampleWtPlasmid.fastq
perl censor4EFGHIJ.pl < SamplePooledLibrary.fastq > censoredSamplePooledLibrary.fastq
perl countscriptInputarray.pl censoredSampleWtPlasmid.fastq >> countall.out
perl countscriptInputarray.pl censoredSamplePooledLibrary.fastq >> countall.out
