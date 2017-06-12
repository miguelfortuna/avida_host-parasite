# <a href="https://github.com/miguelfortuna/avida_host-parasite/blob/master/Non-adaptive%20origins%20of%20evolutionary%20innovations%20increase%20network%20complexity%20in%20interacting%20digital%20organisms.pdf" target="_blank">Non-adaptive origins of evolutionary innovations increase network complexity in interacting digital organisms.</a>

# Configuration files and data set used in this study: 

## <a href="https://github.com/devosoft/avida" target="_blank">Avida version 2.14.0</a>  

Configuration files required
- avida.cfg (the Avida default file was used and the configuration options for sampling genotype space, testing coexistence in a purely ecological scenario, and for both coevolutionary scenarios (i.e., when traits had adaptive and non-adaptive origins, and when they had only adaptive origins) were modified when Avida was executed in standard an analyze mode).
- events.cfg (events file used for sampling genotype space).
- events_purifying_selection.cfg (events file used for the purifying selection process).
- events_eco.cfg (events file used for testing coexistence in a purely ecological scenario).
- events_coevo.cfg (events file used in both coevolutionary scenarios).
- environment.cfg (environmental file used for sampling genotype space and for the purifying selection process).
- environment_eco.cfg (environmental file used for testing coexistence in a purely ecological scenario).
- environment_coevo.cfg (environmental file used in both coevolutionary scenarios).
- instset-transsmt.cfg (33-instruction set).
- instruction-set.pdf (description of the 33 instructions).
- avida (executable: compiled for amd64).

## Sampling genotype space to find merely-viable organisms ###
### files provided:
- random_genotypes.c (source file).
- random_genotypes (compiled for amd64 from the source file).
- sampling_merely-viable_organisms.sh (to find the genotype of one merely-viable organism by randomly sampling genotype space; genome size = 100 instructions).
- instructions.txt (it maps the letters from a genotype to the instructions specified in the instruction set file "instset-transsmt.cfg").
- convert_seq_into_merely-viable_org.sh (translates the genotype of a merely-viable organism into its corresponding organism's file).
- 50_merely_viable_organisms (folder containing 50 merely viable organisms resulting from the random exploration of genotype space).
### execution:
```
./sampling_merely-viable_organisms.sh
```

## Sampling genotype space to find viable organisms capable of performing only the NOT Boolean function ###
### files provided:
- sampling_viable_NOT_organisms.sh (to find the genotype of one viable organism capable of performing only the NOT Boolean function by carrying out a random walk initiated from a merely-viable organism).
- instructions.txt (it maps the letters from a genotype to the instructions specified in the instruction set file "instset-transsmt.cfg").
- convert_seq_into_viable_NOT_org.sh (translates the genotype of a viable organism capable of performing only the NOT Boolean function into its corresponding organism's file).
- 50_NOT_organisms (folder containing 50 viable organisms capable of performing only the Boolean function NOT).
### execution:
```
./sampling_viable_NOT_organisms.sh
```

## Purifying selection process that moved the genotype of the viable organisms capable of performing only the NOT Boolean function away from the merely-viable set of genotypes ###
### files provided:
- events_purifying_selection.cfg
- 50_NOT_mutationally-robust_organisms (folder containing 50 viable organisms capable of performing only the Boolean function NOT after a purifying selection process that moved organisms away from the merely-viable set of genotypes).
### execution:
```
./avida -set EVENT_FILE events_purifying_selection.cfg -set WORLD_X 100 -set WORLD_Y 100 -set COPY_MUT_PROB 0 -set DIVIDE_INS_PROB 0 -set DIVIDE_DEL_PROB 0 -set DIVIDE_MUT_PROB 1 -set OFFSPRING_SIZE_RANGE 1 -set MIN_COPIED_LINES 0 -set MIN_EXE_LINES 0 -set REQUIRE_EXACT_COPY 1 -set STERILIZE_UNSTABLE 1 -set HARDWARE_TYPE 2 -set BASE_MERIT_METHOD 2 -set DEATH_METHOD 0 -set REQUIRED_REACTION 0 > /dev/null 2>&1
```

## Coexistence in a purely ecological scenario ###
### files provided:
- events_eco.cfg (events file used for testing coexistence in a purely ecological scenario).
- hosts # 30 organisms stored in the folder "hosts"
- parasites # 15 organisms stored in the folder "parasites"
- host-parasite_pairs.txt # 216 host-parasite pairs used as ancestors for each evolutionary process (the ones that coexisted, out of 30x15=450, in a purely ecological scenario)
### execution:
```
./avida -set ENVIRONMENT_FILE environment_eco.cfg -set EVENT_FILE events_eco.cfg -set WORLD_X 100 -set WORLD_Y 100 -set COPY_MUT_PROB 0 -set DIVIDE_INS_PROB 0 -set DIVIDE_DEL_PROB 0 -set OFFSPRING_SIZE_RANGE 1 -set MIN_COPIED_LINES 0 -set MIN_EXE_LINES 0 -set REQUIRE_EXACT_COPY 1 -set STERILIZE_UNSTABLE 1 -set HARDWARE_TYPE 2 -set BASE_MERIT_METHOD 2 -set DEATH_METHOD 1 -set AGE_LIMIT 3000 -set MAX_CPU_THREADS 2 -set PARASITE_VIRULENCE 0.9 -set PARASITE_NO_COPY_MUT 1 -set INJECT_METHOD 1 -set INJECT_IS_TASK_SPECIFIC 1 -set REQUIRE_SINGLE_REACTION 1 -set DIVIDE_MUT_PROB 0 -set INJECT_MUT_PROB 0 > /dev/null 2>&1
```

## Coevolution when host resistance traits had adaptive and non-adaptive origins ###
### files provided:
- hosts # 30 organisms stored in the folder "hosts"
- parasites # 15 organisms stored in the folder "parasites"
- host-parasite_pairs.txt # 216 host-parasite pairs used as ancestors for each evolutionary process (the ones that coexisted, out of 30x15=450, in a purely ecological scenario)
### execution:
```
./avida -set ENVIRONMENT_FILE environment_coevo.cfg -set EVENT_FILE events_coevo.cfg -set WORLD_X 100 -set WORLD_Y 100 -set COPY_MUT_PROB 0 -set DIVIDE_INS_PROB 0 -set DIVIDE_DEL_PROB 0 -set OFFSPRING_SIZE_RANGE 1 -set MIN_COPIED_LINES 0 -set MIN_EXE_LINES 0 -set REQUIRE_EXACT_COPY 1 -set STERILIZE_UNSTABLE 1 -set HARDWARE_TYPE 2 -set BASE_MERIT_METHOD 2 -set DEATH_METHOD 1 -set AGE_LIMIT 3000 -set MAX_CPU_THREADS 2 -set PARASITE_VIRULENCE 0.9 -set PARASITE_NO_COPY_MUT 1 -set INJECT_METHOD 1 -set INJECT_IS_TASK_SPECIFIC 1 -set REQUIRE_SINGLE_REACTION 1 -set DIVIDE_MUT_PROB 0.025 -set INJECT_MUT_PROB 0.01 > /dev/null 2>&1
```

## Coevolution when host resistance traits had only adaptive origins ###
### files provided:
- hosts # 30 organisms stored in the folder "hosts"
- parasites # 15 organisms stored in the folder "parasites"
- host-parasite_pairs.txt # 216 host-parasite pairs used as ancestors for each evolutionary process (the ones that coexisted, out of 30x15=450, in a purely ecological scenario)
### execution:
```
./avida -set ENVIRONMENT_FILE environment_coevo.cfg -set EVENT_FILE events_coevo.cfg -set WORLD_X 100 -set WORLD_Y 100 -set COPY_MUT_PROB 0 -set DIVIDE_INS_PROB 0 -set DIVIDE_DEL_PROB 0 -set OFFSPRING_SIZE_RANGE 1 -set MIN_COPIED_LINES 0 -set MIN_EXE_LINES 0 -set REQUIRE_EXACT_COPY 1 -set STERILIZE_UNSTABLE 1 -set HARDWARE_TYPE 2 -set BASE_MERIT_METHOD 2 -set DEATH_METHOD 1 -set AGE_LIMIT 3000 -set MAX_CPU_THREADS 2 -set PARASITE_VIRULENCE 0.9 -set PARASITE_NO_COPY_MUT 1 -set INJECT_METHOD 1 -set INJECT_IS_TASK_SPECIFIC 1 -set REQUIRE_SINGLE_REACTION 1 -set DIVIDE_MUT_PROB 0.025 -set INJECT_MUT_PROB 0.01 -set MAX_UNIQUE_TASK_COUNT 1 > /dev/null 2>&1
```
