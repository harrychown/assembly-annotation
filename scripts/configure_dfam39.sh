# first, change directory to the famdb library location
cd ~/anaconda3/envs/earlgrey/share/RepeatMasker/Libraries/famdb/

# download the partitions you require from Dfam 3.9. In the below, change the numbers or range inside the square brackets to choose your subsets.
# e.g. to download partitions 0 to 10: [0-10]; or to download partitions 3,5, and 7: [3,5,7]; [0-16] is ALL PARTITIONS
curl -o 'dfam39_full.16.h5.gz' 'https://dfam.org/releases/current/families/FamDB/dfam39_full.16.h5.gz'
curl -o 'dfam39_full.0.h5.gz' 'https://dfam.org/releases/current/families/FamDB/dfam39_full.0.h5.gz'

# decompress Dfam 3.9 paritions
gunzip *.gz

# move up to RepeatMasker main directory
cd ~/anaconda3/envs/earlgrey/share/RepeatMasker/

# save the min_init partition as a backup, just in case!
mv ~/anaconda3/envs/earlgrey/share/RepeatMasker/Libraries/famdb/min_init.0.h5 ~/anaconda3/envs/earlgrey/share/RepeatMasker/Libraries/famdb/min_init.0.h5.bak

# Rerun RepeatMasker configuration
perl ./configure -libdir ~/anaconda3/envs/earlgrey/share/RepeatMasker/Libraries/ -trf_prgm ~/anaconda3/envs/earlgrey/bin/trf -rmblast_dir ~/anaconda3/envs/earlgrey/bin -hmmer_dir ~/anaconda3/envs/earlgrey/bin -abblast_dir ~/anaconda3/envs/earlgrey/bin -crossmatch_dir ~/anaconda3/envs/earlgrey/bin -default_search_engine rmblast

