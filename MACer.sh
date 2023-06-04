#! /bin/bash


#echo "This will generate list of possible MAC address used"

key=00000000000000000000000000000000

end_key=`./endian.sh $key`
#echo $end_key


#message=00112233445566778899aabbccddeeff
#end_message=`./endian.sh $message`
#end_message=`./endian.sh $1`


iv=00000000000000000000000000000000


#echo "key is: $key and end_key: $end_key"
#echo "message is: $message and end_message: $end_message"

prand=$1

end_message=$(printf "%032x" $prand)
#end_message=`./endian.sh $end_message`
#echo $end_message


var=`echo -n $end_message | xxd -r -p | openssl aes-128-cbc -nopad -e -K $end_key -iv $iv -nosalt | xxd -p`
#echo $var

#var=`./endian.sh $var`
#echo $var


second_part=$(echo $var | tail -c 7)
first_part=$(echo $end_message | tail -c 7)

echo $first_part$second_part
