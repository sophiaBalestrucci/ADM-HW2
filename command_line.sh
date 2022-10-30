
awk -F"\t" 'length($8)>100 {print length($8) "\t" $4}' instagram_posts.csv >output.csv
sort -nr -k 1 output.csv | head > output2.csv
cut -f 2,3,4,7 instagram_profiles.csv > profiles2.csv
cut -f 2 output2.csv > output3.csv
while read utente;
do
        if [[ $utente == "" ]]
        then
                var="User not found!"
        else
                var=$(grep $utente profiles2.csv || echo "User not found!")
        fi
        echo $var
done <output3.csv


