echo "Beagle:"
echo "For R2 of exactly 0:"
awk '$1 -gt 0{c++} END{print c+0}' beagle_r2.txt >> beagle_final_r2.txt

for i in 0 0.01 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 0.99; do
  echo $i
  #echo "awk '$1 > $i{c++} END{print c+0}' impute2_info.txt"
  awk "\$1 > $i{c++} END{print c+0}" beagle_r2.txt >> beagle_final_r2.txt
done

echo "Michigan Imputation:"
echo "For R2 of exactly 0:"
awk '$1 -gt 0{c++} END{print c+0}' michigan_r2.txt >> michigan_final_r2.txt

for i in 0 0.01 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 0.99; do
  echo $i
  #echo "awk '$1 > $i{c++} END{print c+0}' michigan_r2.txt"
  awk "\$1 > $i{c++} END{print c+0}" michigan_r2.txt >> michigan_final_r2.txt
done

echo "Impute2:"
echo "For R2 of exactly 0:"
awk '$1 -gt 0{c++} END{print c+0}' impute2_info.txt >> impute2_final_r2.txt

for i in 0 0.01 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 0.99; do
  echo $i
  #echo "awk '$1 > $i{c++} END{print c+0}' impute2_info.txt"
  awk "\$1 > $i{c++} END{print c+0}" impute2_info.txt >> impute2_final_r2.txt
done