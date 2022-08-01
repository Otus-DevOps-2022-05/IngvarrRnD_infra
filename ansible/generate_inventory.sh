#!/bin/bash

if [[ $1 == "--host" ]]; then
    echo "{}"
fi

if [[ $1 == "--list" ]]; then

#получим данные по ВМ из облака Яндекс
resp=$(curl -s 'https://compute.api.cloud.yandex.net/compute/v1/instances?folderId=b1g952eluomosq274hif&instances.name' -H 'Authorization: Bearer ***' | jq -r ' .instances[] | select(.networkInterfaces[].primaryV4Address.oneToOneNat.address != null) | [.name, .networkInterfaces[].primaryV4Address.oneToOneNat.address] | join(";")')

count_machines=$(tr -dc ';' <<<"$resp" | awk '{ print length; }')

#начало генерации json
echo "{"
echo "    \"_meta\": {"
echo "        \"hostvars\": { "

#генерим hostvars
counter=0
IFS=
while IFS=";" read -r hostname pub_ip
do
    (( counter += 1 ))
    hostname=$(echo $hostname | sed -e 's/\"//g')
    pub_ip=$(echo $pub_ip | sed -e 's/\"//g')

    echo "            \"${pub_ip}\": {"
    echo "                \"hostname\": ["
    echo "                   \"${hostname}\""
    echo "                ]"
    if [[ "$counter" -eq "$count_machines" ]]; then
        echo "        }"
    else
        echo "        },"
    fi
done < <(echo $resp)

echo "        }"
echo "    },"
echo "    \"all\": {"
echo "        \"children\": ["
echo "            \"ungrouped\""
echo "        ]"
echo "    },"
echo "    \"ungrouped\": {"
echo "        \"hosts\": ["

#генерим IP, чтобы можно было сходить на ВМ
counter=0
IFS=
while IFS=";" read -r hostname pub_ip
do
    (( counter += 1 ))
    pub_ip=$(echo $pub_ip | sed -e 's/\"//g')
    if [[ "$counter" -eq "$count_machines" ]]; then
        echo "            \"${pub_ip}\""
    else
        echo "            \"${pub_ip}\","
    fi
done < <(echo $resp)
echo "        ]"
echo "    }"
echo "}"

fi

