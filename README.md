# IngvarrRnD_infra
IngvarrRnD Infra repository

# ДЗ 4

testapp_IP = 51.250.95.118
testapp_port = 9292

yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata-from-file user-data=custom-userdata.yml \
  --metadata serial-port-enable=1
  
