#!/usr/bin/bash
sbatch --array=${1}-${2} <<EOT
#!/usr/bin/env bash
#SBATCH -p standard
#SBATCH --output=result_%a_${3}.out
#SBATCH -c 1
#SBATCH -t 16:30:00
#SBATCH -A spinquest

module purge
module load anaconda/2019.10-py3.7
module load singularity/3.5.2
module load tensorflow/2.1.0-py37

singularity run --nv /home/atz6cq/tensorflow-2.1.0-py37.sif Method2epochs.py ${SLURM_ARRAY_TASK_ID} ${3}
EOT