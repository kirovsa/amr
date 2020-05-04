use Bio::SeqIO;
my $sio=new Bio::SeqIO(-file=>shift,-format=>'genbank');
my $i=1;
while (my $s=$sio->next_seq) {
	$i++;
	my $taxon="Unknown";
	for my $feat ($s->get_SeqFeatures) {
		if ($feat->primary_tag eq 'source') {
			for my $tag ($feat->get_all_tags) {
				if ($tag eq 'db_xref') {
					for my $value ($feat->get_tag_values($tag)) {
						$value=~s/\D+//g;
						$taxon=$value;
						last;
					}
				}
			}
		}
	}
	print $s->id."\t$taxon\n";
}
