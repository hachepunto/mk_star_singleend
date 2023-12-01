<config.mk

'results/%Aligned.sortedByCoord.out.bam': 'data/%trimmed.fastq.gz'
	DIR=`dirname $target`
	mkdir -p $DIR
	set -x
	STAR \
		--runThreadN $THREADS \
		--genomeDir $GENOMEDIR \
		--sjdbGTFfile $GTF \
		--readFilesCommand $COMPRESS \
		--readFilesIn $prereq \
		--outFileNamePrefix $DIR"/"$stem\
		--outSAMtype BAM SortedByCoordinate \
	&& mv $target'.build' $target


clean:VE:
	rm -rf results/

