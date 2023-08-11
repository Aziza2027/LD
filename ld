
# grep -v "^#" out.test.vcf | cut -f 1 | sort | uniq
# LDBlockShow -InVCF in/SNP.vcf -OutPut  out/outD   -Region  NC_000001.11:0:300000000  -OutPng -SeleVar 1 -NoShowLDist 1000000000
# LDBlockShow -InVCF in/SNP.vcf -OutPut  out/outR   -Region  NC_000001.11:0:300000000  -OutPng -SeleVar 2 -NoShowLDist 1000000000 # -InGWAS 
# ../../bin/ShowLDSVG    -InPreFix       out     -OutPut out     -InGWAS gwas.pvalue -Cutline  7  -ShowNum -PointSize 3 -OutPng

#!/bin/bash

# Extract unique values from the CHR column
# chr_names=$(grep -v "^#" in/SNP.vcf | cut -f1 | sort | uniq)

# # Iterate over each CHR_NAME
# while IFS= read -r chr_name
# do
#     # Replace "CHR_NAME" in the command with the current CHR_NAME value
#     command="LDBlockShow -InVCF in/SNP.vcf -OutPut out/${chr_name}_outD -Region ${chr_name}:0:300000000 -OutPng -SeleVar 1 -NoShowLDist 1000000000"
#     $command
#     command="LDBlockShow -InVCF in/SNP.vcf -OutPut out/${chr_name}_outR -Region ${chr_name}:0:300000000 -OutPng -SeleVar 2 -NoShowLDist 1000000000"
#     $command
# done <<< "$chr_names"

# awk -F'\t' 'BEGIN {OFS="\t"} {if (substr($1, 1, 1) == "#") {print $0} else {print "all_chromosome", NR-1, substr($0, index($0, $3))}}' ./in/SNP.vcf  > ./in/SNP_all.vcf

# LDBlockShow -InVCF in/SNP_all.vcf -OutPut  out/outD   -Region  all_chromosome:0:300000000  -OutPng -SeleVar 1 -NoShowLDist 1000000000
# LDBlockShow -InVCF in/SNP_all.vcf -OutPut  out/outR   -Region  all_chromosome:0:300000000  -OutPng -SeleVar 2 -NoShowLDist 1000000000 # -InGWAS 

awk -F"\t" '{print $1"    "$2"    "$3}' in/SNP.vcf > in/in.snp

# LDBlockShow -InVCF in/SNP.vcf -OutPut  out/bbb   -Region  NC_000006.12:0:21490506 -OutPng -SeleVar 1 -NoShowLDist 1000000000 -SpeSNPName in/in
LDBlockShow -InVCF in/SNP.vcf -OutPut  out/bbb   -Region  NC_000006.12:0:21490506 -OutPng -SeleVar 1


# -InGWAS The statistics file (e.g., association statistics, but other values such as
# Tajima’s D can also be accepted) for generate plot together with the
# LD plot. File formatted as: [chr position Pvalue]
# -NoLogP By default, the P value from the –InGWAS file will be –log10 transformed,
# with this option, the P value will not be transformed.
# -Cutline The significance cutline of the –InGWAS file.
# -TopSite Default is the most significant SNP, can be changed with chr:pos. Using
# this option, this SNP will be shown in diamond, and the LD between
# other sites and it will be shown in different colors. Please see Figure 9.
# -PointSize Users can use this option (any number over 0) to set the point size.