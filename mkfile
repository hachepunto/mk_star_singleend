<config.mk

'results/%Aligned.sortedByCoord.out.bam': 'data/%trimmed.fastq.gz'
	set -x
	DIR=`dirname $target`
	mkdir -p $DIR
	STAR \
		--runThreadN $THREADS \
		--genomeDir $GENOMEDIR \
		--sjdbGTFfile $GTF \
		--readFilesCommand $COMPRESS \
		--readFilesIn $prereq \
		--outFileNamePrefix $DIR"/build_"$stem\
		--outSAMtype BAM SortedByCoordinate \
	&& rename 's#build_##' $DIR"/build_"$stem*


clean:VE:
	rm -rf results/

