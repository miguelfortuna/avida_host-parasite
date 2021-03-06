#!/bin/bash

#####################################################################################
### getting a viable organism capable of performing ony the NOT Boolean operation ###
#####################################################################################

while read $rand_seq
do
	for z in $(seq 0 $((${#rand_seq}-1))) # convert the random sequence previously obtained ("rand_seq") into an array
	do
		sequence[$z]=${rand_seq:$z:1}
	done
	letters=( a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E G ) #instruction set (32 letters out of 33: "F" Inject is excluded)
	length_alphabet=${#letters[*]}
	seq_viable_phenotype_not=""
	while [ "$seq_viable_phenotype_not" = "" ]
	do
		i=$(shuf -i 0-$((${#sequence[*]}-1)) -n 1) # random position in the genome
		j=$(shuf -i 0-$((${#letters[*]}-1)) -n 1) # random letter from the alphabet
		letter_new=${letters[$j]} # mutation
		letter_previous=${sequence[$i]} # save previous letter to restore the sequence
		sequence[$i]=$letter_new # replace the letter by the mutation
		genome=$(echo ${sequence[*]} | sed 's/ //g') # new sequence as string
		echo "PURGE_BATCH" > analyze.cfg
		echo "LOAD_SEQUENCE" $genome >> analyze.cfg # print the new sequence
		echo "RECALCULATE" >> analyze.cfg
		echo "DETAIL output.txt viable sequence task.8:binary task.7:binary task.6:binary task.5:binary task.4:binary task.3:binary task.2:binary task.1:binary task.0:binary" >> analyze.cfg
		# run avida in analyze mode
		./avida -a -set COPY_MUT_PROB 0 -set DIVIDE_INS_PROB 0 -set DIVIDE_DEL_PROB 0 -set OFFSPRING_SIZE_RANGE 1 -set MIN_COPIED_LINES 0 -set MIN_EXE_LINES 0 -set REQUIRE_EXACT_COPY 1 -set STERILIZE_UNSTABLE 1 -set DEATH_METHOD 0 -set TEST_CPU_TIME_MOD 30 -set HARDWARE_TYPE 2 > /dev/null 2>&1
		seq_no_viable=$(awk '{if(NR==17 && $1==0) print $2}' data/output.txt)
		seq_viable_same_phenotype=$(awk '{if(NR==17 && $1==1 && $3==0 && $4==0 && $5==0 && $6==0 && $7==0 && $8==0 && $9==0 && $10==0 && $11==0) print $2}' data/output.txt)
		seq_viable_phenotype_not=$(awk '{if(NR==17 && $1==1 && $3==0 && $4==0 && $5==0 && $6==0 && $7==0 && $8==0 && $9==0 && $10==0 && $11==1) print $2}' data/output.txt)
		if [ "$seq_no_viable" != "" ] # non-viable organism
		then
			sequence[$i]=$letter_previous # revert the mutation j
		else # viable organism
			if [ "$seq_viable_same_phenotype" == "" ] && [ "$seq_viable_phenotype_not" = "" ] # distinct phenotype but != NOT
			then
				sequence[$i]=$letter_previous # revert the mutation j	
			fi
		fi
	done
	echo $seq_viable_phenotype_not >> NOT_mutationally-robust_sequences.txt
done < merely_viable_sequences.txt
