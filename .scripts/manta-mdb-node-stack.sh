OUTPUT=$(echo $MANTA_OUTPUT_BASE | sed -e s#$MANTA_JOB_ID.*#$MANTA_JOB_ID/#)
echo "::load v8"
echo "::walk jsframe | ::eval '::jsframe -v;::echo -----------------------------' ! mpipe ${OUTPUT}jsstack.txt > /dev/null"
echo "::walk jsframe | ::jsframe -vn0 ! egrep 'arg[0-9]+:' | awk '{ print $2 }' > /tmp/jsstackargs-ref.txt"
echo "::cat /tmp/jsstackargs-ref.txt | ::eval '::jsprint -ad0;::jsprint -d3;::echo -----------------------' ! mpipe ${OUTPUT}jsstackargs.txt > /dev/null"
