#!/bin/bash
END=24
TESTPATH='fcos_center-normbbox-centeronreg-giou_r50_caffe_fpn_gn-head_dcn_4x4_1x_cuhk_reid_1500_stage1_fpncat_dcn_epoch24_multiscale_focal_x4_bg-2_lconv3dcn_sub_triqueue'
for ((i=24;i<=END;i+=2)); do
    echo $i
    ./tools/dist_test.sh ./configs/fcos/${TESTPATH}.py work_dirs/${TESTPATH}_save/epoch_${i}.pth 1 --out work_dirs/${TESTPATH}_save/results_1000.pkl
    echo '------------------------'
    python ./tools/test_results.py
    echo $i
done
