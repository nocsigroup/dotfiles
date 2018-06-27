OUTPUT=$(echo $MANTA_OUTPUT_BASE | sed -e s#$MANTA_JOB_ID.*#$MANTA_JOB_ID/#)
echo "::load v8"
echo "::walk jsframe | ::eval '::jsframe -v;::echo -delimiter-' ! mpipe ${OUTPUT}jsstack.txt > /dev/null"
echo "::findjsobjects -va ! mpipe ${OUTPUT}findjsobjects.txt > /dev/null"
echo "::findjsobjects -l | ::findjsobjects | ::eval '::jsprint -ad1;::echo -delimiter-' ! mpipe ${OUTPUT}objects.txt > /dev/null"
echo "::findjsobjects -c Module | ::findjsobjects | ::eval '::echo module;::jsprint id;::echo parent;::jsprint parent.id;::echo -delimiter-' ! mpipe ${OUTPUT}modules.txt > /dev/null"