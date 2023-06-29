./plink --vcf SNP.vcf.gz --make-bed --out your_output --double-id --allow-extra-chr
# ./plink --bfile your_output --ld-window-r2 0 --ld-window-kb 100 --r2 --out ld_results --allow-extra-chr

./plink --bfile your_output --chr NC_000009.12 --make-bed --out subset_output --double-id --allow-extra-chr
./plink --bfile subset_output --ld-window-r2 0 --ld-window-kb 100 --r2 --out ld_results --allow-extra-chr
cat snp-thin.ld | sed 1,1d | awk -F " " 'function abs(v) {return v < 0 ? -v : v}BEGIN{OFS="\t"}{print abs($5-$2),$7}' | sort -k1,1n > snp-thin.ld.summary

# ./LDBlockShow -InVCF /home/bio/projects/GWAS_analysis/variants/SNP_p001.vcf -OutPut  out   -Region  NC_000001.11:1:44200000  -OutPng -SeleVar 1
# ../../bin/ShowLDSVG    -InPreFix       out     -OutPut out     -InGWAS gwas.pvalue -Cutline  7  -ShowNum -PointSize 3 -OutPng

 
