# will rename the files to not contain prohibited symbols

endtimes=( 1.0 0.1 0.01 0.001 )
proper_endtimes=( "1p0" "0p1" "0p01" "0p001" )
timesteps=( 0.0001 0.001 0.01 )                         # e-4, e-3, e-2, e-1
proper_timesteps=( "0p0001" "0p001" "0p01" )          
tolerances=( 0.0000001 0.00001 0.001 0.1 )                 # e-7, e-5, e-3, e-1
proper_tolerances=( "0p0000001" "0p00001" "0p001" "0p1" ) 

name=$1                                                     # e.g "ry", "K" etc.

# main
for i in $(seq 0 1 `expr ${#timesteps[@]} - 1`)
do
    for j in $(seq 0 1 `expr ${#endtimes[@]} - 1`)
    do
        old_dt=${timesteps[$i]}
        old_endtime=${endtimes[$j]}
        new_dt=${proper_timesteps[$i]}
        new_endtime=${proper_endtimes[$j]}
        old_name="dt_${old_dt}_${name}_vs_sampleTime_endtime_${old_endtime}.png"   
        new_name="dt_${new_dt}_${name}_vs_sampleTime_endtime_${new_endtime}.png"   
        mv ${old_name} ${new_name}
    done
done
