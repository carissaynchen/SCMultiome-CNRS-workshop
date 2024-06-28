#!/bin/bash

## docker run -e PASSWORD=pushu -e ROOT=TRUE -p 8787:8787 532cb5cec05a
sudo apt-get update
sudo apt-get install libjpeg-dev

## sudo apt-get -y install r-base-dev

## Make a tmp folder and git clone
mkdir /home/gittmp/
git clone https://github.com/carissaynchen/SCMultiome-CNRS-workshop-R /home/gittmp/

## wget all data files from Google Cloud Storage into /home/CPC/
#wget https://storage.googleapis.com/scp_data/data.zip -P /home/gittmp/
# mkdir /home/gittmp/data
# wget https://www.dropbox.com/sh/tr4wq88nd4y2fy6/AABs-4wcFgAr56Qt5DCKWFLza -P --content-disposition /home/gittmp/data
# wget https://www.dropbox.com/sh/tr4wq88nd4y2fy6/AABs-4wcFgAr56Qt5DCKWFLza --content-disposition -P /home/gittmp/
# mkdir /home/gittmp/output
# unzip /home/gittmp/output.zip -d /home/gittmp/output

wget https://cf.10xgenomics.com/samples/cell-arc/1.0.0/pbmc_granulocyte_sorted_3k/pbmc_granulocyte_sorted_3k_filtered_feature_bc_matrix.h5
wget https://cf.10xgenomics.com/samples/cell-arc/1.0.0/pbmc_granulocyte_sorted_3k/pbmc_granulocyte_sorted_3k_atac_fragments.tsv.gz
wget https://cf.10xgenomics.com/samples/cell-arc/1.0.0/pbmc_granulocyte_sorted_3k/pbmc_granulocyte_sorted_3k_atac_fragments.tsv.gz.tbi

wget https://cf.10xgenomics.com/samples/cell-arc/1.0.0/pbmc_granulocyte_sorted_10k/pbmc_granulocyte_sorted_10k_filtered_feature_bc_matrix.h5
wget https://cf.10xgenomics.com/samples/cell-arc/1.0.0/pbmc_granulocyte_sorted_10k/pbmc_granulocyte_sorted_10k_atac_fragments.tsv.gz
wget https://cf.10xgenomics.com/samples/cell-arc/1.0.0/pbmc_granulocyte_sorted_10k/pbmc_granulocyte_sorted_10k_atac_fragments.tsv.gz.tbi
wget --user-agent="Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36" https://atlas.fredhutch.org/data/nygc/multimodal/pbmc_multimodal.h5seurat

wget https://biodata2024.blob.core.windows.net/biodata/pbmc3k.rds
wget https://biodata2024.blob.core.windows.net/biodata/pbmc10k.rds
wget https://biodata2024.blob.core.windows.net/biodata/output.zip
wget https://biodata2024.blob.core.windows.net/biodata/Homo_sapiens.GRCh37.82.gtf


mv pbmc* /home/gittmp/data
mv Homo_sapiens.GRCh37.82.gtf /home/gittmp/data
unzip output.zip -d /home/gittmp/data


ls /home/
ls /home/gittmp/
  
  ## Set up users
  
sudo groupadd trainees

for((userIndex = 1; userIndex <= 25; userIndex++))
  do
{
  userID=user${userIndex}
  sudo useradd -g trainees -d /home/$userID -m -s /bin/bash $userID
  # sudo cp -r /home/gittmp/* /home/$userID/
  echo $userID:2024 | sudo chpasswd
}
done