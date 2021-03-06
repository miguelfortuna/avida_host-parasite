#!/bin/bash

################################################################################
### getting a merely viable organism by sampling the genotype space randomly ###
################################################################################
n_seq=0
rand_seq=""
while [ "$rand_seq" = "" ]
do
	n_seq=$(($n_seq+1))
	echo $n_seq
	echo "PURGE_BATCH" > analyze.cfg
	rand_alf=$(shuf -ez a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E G) # instruction F (Inject) is excluded
	n_rand_seq_at_once=10000		
	genome_length=100
	./random_genotypes $n_rand_seq_at_once $genome_length $RANDOM $rand_alf >> analyze.cfg
	echo "RECALCULATE" >> analyze.cfg
	echo "DETAIL output.txt viable sequence task.8:binary task.7:binary task.6:binary task.5:binary task.4:binary task.3:binary task.2:binary task.1:binary task.0:binary" >> analyze.cfg
	# run avida in analyze mode
	./avida -a -set COPY_MUT_PROB 0 -set DIVIDE_INS_PROB 0 -set DIVIDE_DEL_PROB 0 -set OFFSPRING_SIZE_RANGE 1 -set MIN_COPIED_LINES 0 -set MIN_EXE_LINES 0 -set REQUIRE_EXACT_COPY 1 -set STERILIZE_UNSTABLE 1 -set DEATH_METHOD 0 -set TEST_CPU_TIME_MOD 30 -set HARDWARE_TYPE 2 > /dev/null 2>&1
	rand_seq=$(awk '{if(NR>=17 && $1==1 && $3==0 && $4==0 && $5==0 && $6==0 && $7==0 && $8==0 && $9==0 && $10==0 && $11==0) print $2}' data/output.txt | head -n 1)
done
echo $id $n_seq $rand_seq
echo $rand_seq > merely_viable_sequences.txt
