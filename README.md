# Methods for Comparison of Different Imputation Pipelines

## Data

The 23andMe file used for the comparison can be downloaded from: https://opensnp.org/data/8589.23andme.6953

## Extracting the R2 values
The first step is to extract the R2 values from the output from each of the imputation pipelines.

### Beagle
Beagle (the fast imputation module on Deploit) supplies the R2 value within the FORMAT field of the output VCF file

```bash
grep -v '#' 8589.23andme.6953.vcf > test.vcf
awk '{print $8}' test.vcf > dr2.txt
grep -Poo DR2=[0-9]\.[0-9]+ dr2.txt | grep -oE '[0-9]\.[0-9]+' > beagle_r2.txt
```

### Michigan Imputation Server
The Michigan Imputation Server supplies the R2 value within the FORMAT field of the output VCF file
```bash
awk '{print $7}' michigan_imputed.vcf > michigan_r2.txt
```

### Impute2
For Impute2 the equivalent values of the R2 values (the `info` values) were extracted. To do this the `_info` files generated per chromosome were first merged by making the following [changes](https://github.com/PhilPalmer/docker-impute2-1/commit/98c4dddc56bf1732458d821445e1bd9f54776c30) to the pipeline. Then the following could be run
```
awk '{print $7}' merged_impute2_info.txt > impute2_info.txt
```

## Calculating the number of SNPs at different R2 value thresholds
Once the R2 values are extracted the number of SNPs can be counted at different thresholds using the [`calc_r2_freq.sh`](https://github.com/lifebit-ai/imputation-comparison/blob/master/calc_r2_freq.sh) script. You can run `./calc_r2_freq.sh` with the file containing the R2 values (generated from the previous step) in the current directory. This should produce three new files with the total number of SNPs at the different R2 thresholds, for each of the different imputation pipelines. This can then be plotted (see example [here](https://docs.google.com/spreadsheets/d/1MdUg0htWwDYTksn1QJ_RPZvFk0vpGv1yg6muOtz7xP8/edit?usp=sharing))