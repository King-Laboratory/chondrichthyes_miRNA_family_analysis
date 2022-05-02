#!/usr/bin/perl

#blastdbcmd -db cp_shark_fa2.fa -query novel_whitespottedbambooshark_vs_cloudycatshark_nohits.txt > bamboo_shark_novels.fa


$input_fd = open(INPUT,"thornyskate_vs_allsamp_blastn.txt");

$output_fd = open(OUTPUT,">novel_thornyskate_vs_allsamp_nohits.txt");

$flag = 0;
$flagb = 0;

while (<INPUT>) {
	$line = $_;
	chomp($line);
#	print $line,"\n";
	
	if ($line =~ /^Query= (.+)/) {
		$id = $1;
		#print $id,"\n";
		$flag = 1;
		$flagb = 1;
	}
	elsif (($line =~ /^(.+)/) && ($flag == 1)) {
		$rest_of_id = $1;
		$final_id = $id . $rest_of_id;
		#print $final_id,"\n";
		$flag = 0;
	}
	elsif (($line =~ /No hits found/) && ($flagb == 1)) {
		print OUTPUT $final_id, "\n";
		$flagb = 0;
	}

}