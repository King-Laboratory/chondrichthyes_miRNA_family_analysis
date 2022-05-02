#!/usr/bin/perl

# Open input file
$brownbandedbambooshark_vscloudycatshark_bed_fd = open(SAMPLE,"<novel_brownbandedbambooshark_vs_cloudycatshark_blastn_tab.tsv");

# Open output file
$output_fd = open(OUTPUT,">brownbandedbambooshark_filtered_cloudycatshark_mirna_hits.tsv");

# Parameters
$THRESHOLD = 50;


# Read in file and filter
while (<SAMPLE>) {
    # Save current line
    $line = $_;
    # Remove any whitespace characters from end of line
    chomp($line);

    # Split current line by tabs
    @fields = split("\t",$line);

    # Save items of interest
    $queryID = $fields[0];
    $hitID = $fields[1];
    $percID = $fields[2];
    $alignlen = $fields[3];

    # Filter "hits" to be those with a score > $THRESHOLD
    if ($alignlen >= $THRESHOLD) {
    # Save hit only if it is the first found for a queryID->hitID pair
    if ($forward_hits{$queryID}) {
        # Do nothing
        $a = 1;
    }
    else {
        # Save this hit as it is the first found for the queryID->hitID pair
        $forward_hits{$queryID} = $hitID;
    }
    }

}

# Filter out multiple query ids
foreach $queryID (keys %forward_hits) {
    # Keep the first hit of multiple matched query IDs
    if ($queryID eq $queryID) {
    print OUTPUT $queryID,"\t",$forward_hits{$queryID},"\n";

    }

}
