
cd /var/lib/jenkins/workspace/spock-lizard-docker-html/target
ls *.jar | sed -e s/[^0-9]//g > /home/prathmesh/projects/shell/semi/dashboard/input/inputversion.txt
stat spock-lizard*  | awk '{print $2"|"$3}' | grep "^2021"

stat spock-lizard*  | awk '{print $2"|"$3}' | grep "^2021" | sed -n 2p > /home/prathmesh/projects/shell/semi/dashboard/input/time.txt

cd /home/prathmesh/projects/shell/semi/dashboard/input
tail -n 1 inputversion.txt > ok.txt


awk 'NR==FNR{a[++i]=$1;next}{$2=a[++k]; print}' time.txt ok.txt > i.txt

cat i.txt input.txt > new.txt

awk 'NR==FNR{a[++i]=$1" | "$2;next}{$2=a[++k]; print}' new.txt input.txt > semi.txt

 sed -e 's/|//g' semi.txt > k.txt

rm -rf final.txt
sed '1 i Environment War_Version TimeStamp' k.txt >> final.txt











#cat ok.txt  | awk '{print "     " $0}' ok.txt > tmpout
