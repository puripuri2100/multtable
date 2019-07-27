# seq `初期値` `間隔` `最大値`
for i in `seq 2 1 200`
do
stack exec multtable-exe $i
done
