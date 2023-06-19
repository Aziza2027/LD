LDBlockShow   -InVCF /home/cat/projects/GWAS_analysis/variants/out_p001.vcf.gz   -OutPut  out3 -Region $1 -SeleVar 2 --NoShowLDist 2000000
ShowLDSVG    -InPreFix       out     -OutPut out2 -ShowNum  # -SpeSNPName Spe.snp -ShowGWASSpeSNP
eog out.svg
