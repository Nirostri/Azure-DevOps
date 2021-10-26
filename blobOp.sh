az login

az storage container create \
    --account-name no1storageaccount \
    --name blobcontainer \
    --connection-string "DefaultEndpointsProtocol=https;AccountName=no1storageaccount;AccountKey=zhe2UK2oXJAHM7XRIhtkGK16k79EmykzGo6Pn9P3bi0NdCCjoYT9TNUY5arXhkumuxcIpHTkuSXpzSZzYH3v/Q==;EndpointSuffix=core.windows.net"

for ((i = 0 ; i < 100 ; i++)); do
echo "blob number $i" > blob$i
az storage blob upload \
    --account-name no1storageaccount \
    --container-name blobcontainer \
    --name blob$i \
    --file blob$i \
    --connection-string "DefaultEndpointsProtocol=https;AccountName=no1storageaccount;AccountKey=zhe2UK2oXJAHM7XRIhtkGK16k79EmykzGo6Pn9P3bi0NdCCjoYT9TNUY5arXhkumuxcIpHTkuSXpzSZzYH3v/Q==;EndpointSuffix=core.windows.net"
done

azcopy copy 'https://no1storageaccount.blob.core.windows.net/blobcontainer/?sv=2020-08-04&ss=b&srt=co&sp=rwdlacitfx&se=2021-11-23T21:42:13Z&st=2021-10-23T12:42:13Z&spr=https&sig=kScI2AqGI%2BV8dQnTUe6D%2B1ZPNnAdeg5yA8OzAtS8p6w%3D' 'https://no2storageaccount.blob.core.windows.net/blobcontainer/?sv=2020-08-04&ss=b&srt=co&sp=rwdlacitfx&se=2021-11-23T21:43:43Z&st=2021-10-23T12:43:43Z&spr=https&sig=gmZq9%2FZVm7%2Bee5mRHMm75AEXWb60%2BC3a%2FShxhCOlccY%3D' --recursive