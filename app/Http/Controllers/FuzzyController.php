<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\chieuCaoCanNang;
use App\Models\message;
use App\Models\nhuCauNangLuong;
use App\Models\thucPhamChuyenDoi;
use App\Models\tiLeDinhDuong;
use Illuminate\Support\Facades\Redirect;
class TinhTrangSucKhoe
{
    public $gayCap1;
    public $gayCap2;
    public $binhThuong;
    public $beoCap1;
    public $beoCap2;
}

class FuzzyController extends Controller{
    public $cHeight = [0, 0, 0, 0, 0];
    public $cWeight = [0, 0, 0, 0, 0];
    public $cTableStatus;

    public function __construct() {
        $string = "1 2 3 4 5 1 2 3 4 5 1 2 3 4 4 1 2 2 3 4 1 1 2 3 4";
        $numbers = explode(' ', $string);
        $this->cTableStatus = array_chunk($numbers, 5);
    }

    public function find($sex, $tuoi)
    {
        $datas = chieuCaoCanNang::orderBy('id', 'asc')->get();
        foreach ($datas as $data) {
            // Chuẩn hóa chuỗi cần so sánh
            $normalized_sex = mb_strtolower($data->gioi_tinh, 'UTF-8');
            $normalized_sex = iconv('UTF-8', 'ASCII//TRANSLIT', $normalized_sex);

            $normalized_user_sex = mb_strtolower($sex, 'UTF-8');
            $normalized_user_sex = iconv('UTF-8', 'ASCII//TRANSLIT', $normalized_user_sex);

            if ($normalized_sex == $normalized_user_sex){
                if( $tuoi == $data->tuoi) {
                    $chieuCaoCanNang = new chieuCaoCanNang();
                    $chieuCaoCanNang->gioi_tinh = $data->gioi_tinh;
                    $chieuCaoCanNang->tuoi = $data->tuoi;
                    $chieuCaoCanNang->chieu_cao_toi_thieu = $data->chieu_cao_toi_thieu;
                    $chieuCaoCanNang->chieu_cao_toi_da = $data->chieu_cao_toi_da;
                    $chieuCaoCanNang->can_nang_toi_thieu = $data->can_nang_toi_thieu;
                    $chieuCaoCanNang->can_nang_toi_da = $data->can_nang_toi_da;
                    return $chieuCaoCanNang;
                }
            }
        }
        return $this->findFuzzy($sex, $tuoi);
    }

    public function findFuzzy($sex, $tuoi)
    {
        $datas2 = chieuCaoCanNang::orderBy('id', 'asc')->get(); 
        $smin = null;
        $smax = null;

        for($i = 0; $i < count($datas2) - 2; $i++) {
            $chieuCaoCanNang = $datas2[$i];
            $chieuCaoCanNang1 = $datas2[$i + 2]; 

            if ($sex == $chieuCaoCanNang->gioi_tinh && $tuoi > $chieuCaoCanNang->tuoi && $tuoi < $chieuCaoCanNang1->tuoi) {
                $smin = $chieuCaoCanNang;
                $smax = $chieuCaoCanNang1;
                break;
            }
        }
        $chieu_cao_toi_thieu = $smin->chieu_cao_toi_thieu + ($smax->chieu_cao_toi_thieu - $smin->chieu_cao_toi_thieu) * 
                                                                    ($tuoi - $smin->tuoi) / ($smax->tuoi - $smin->tuoi);
        $chieu_cao_toi_da = $smin->chieu_cao_toi_da + ($smax->chieu_cao_toi_da - $smin->chieu_cao_toi_da) * ($tuoi - $smin->tuoi) / 
                                                                    ($smax->tuoi - $smin->tuoi);
        $can_nang_toi_thieu = $smin->can_nang_toi_thieu + ($smax->can_nang_toi_thieu - $smin->can_nang_toi_thieu) * 
                                                                    ($tuoi - $smin->tuoi) / ($smax->tuoi - $smin->tuoi);
        $can_nang_toi_da = $smin->can_nang_toi_da + ($smax->can_nang_toi_da - $smin->can_nang_toi_da) * ($tuoi - $smin->tuoi) / 
                                                                    ($smax->tuoi - $smin->tuoi);

        $chieuCaoCanNangFinal = new ChieuCaoCanNang();
        $chieuCaoCanNangFinal->gioi_tinh = $sex;
        $chieuCaoCanNangFinal->tuoi = $tuoi;
        $chieuCaoCanNangFinal->chieu_cao_toi_thieu = $chieu_cao_toi_thieu;
        $chieuCaoCanNangFinal->chieu_cao_toi_da = $chieu_cao_toi_da;
        $chieuCaoCanNangFinal->can_nang_toi_thieu = $can_nang_toi_thieu;
        $chieuCaoCanNangFinal->can_nang_toi_da = $can_nang_toi_da;

        return $chieuCaoCanNangFinal;
    }

    public function tinhXacSuat($sex, $tuoi, $weight, $height)
    {
        $chieuCaoCanNang = new chieuCaoCanNang();
        $chieuCaoCanNang = $this->find($sex, $tuoi);
        $heightVeryShort = $chieuCaoCanNang->chieu_cao_toi_thieu;
        $heightVeryTall = $chieuCaoCanNang->chieu_cao_toi_da;
        $heightMedium = ($heightVeryShort + $heightVeryTall) / 2;
        $heightShort = ($heightVeryShort + $heightMedium) / 2;
        $heightTall = ($heightVeryTall + $heightMedium) / 2;



        if ($height <= $heightVeryShort) {
            $this->cHeight[0] = 1;
        } 
        elseif ($height > $heightVeryShort && $height <= $heightShort) {
            $this->cHeight[1] = ($height - $heightVeryShort) / ($heightShort - $heightVeryShort);
            $this->cHeight[0] = 1 - $this->cHeight[1];
        } 
        elseif ($height > $heightShort && $height <= $heightMedium) {
            $this->cHeight[2] = ($height - $heightShort) / ($heightMedium - $heightShort);
            $this->cHeight[1] = 1 - $this->cHeight[2];
        }
        elseif ($height > $heightMedium && $height <= $heightTall) {
            $this->cHeight[3] = ($height - $heightMedium) / ($heightTall - $heightMedium);
            $this->cHeight[2] = 1 - $this->cHeight[3];
        }
        elseif ($height > $heightTall && $height <= $heightVeryTall) {
            $this->cHeight[4] = ($height - $heightTall) / ($heightVeryTall - $heightTall);
            $this->cHeight[3] = 1 - $this->cHeight[4];
        }
        elseif ($height > $heightVeryTall) {
            $this->cHeight[4] = 1;
        }

        $weightVerySlim = $chieuCaoCanNang->can_nang_toi_thieu;
        $weightVeryHeavy = $chieuCaoCanNang->can_nang_toi_da;
        $weightMedium = ($weightVerySlim + $weightVeryHeavy)/2;
        $weightSlim = ($weightVerySlim + $weightMedium)/2;
        $weightHeavy = ($weightVeryHeavy + $weightMedium)/2;

        if ($weight <= $weightVerySlim) {
            $this->cWeight[0] = 1;
        } 
        elseif ($weight > $weightVerySlim && $weight <= $weightSlim) {
            $this->cWeight[1] = ($weight - $weightVerySlim) / ($weightSlim - $weightVerySlim);
            $this->cWeight[0] = 1 - $this->cWeight[1];
        } 
        elseif ($weight > $weightSlim && $weight <= $weightMedium) {
            $this->cWeight[2] = ($weight - $weightSlim) / ($weightMedium - $weightSlim);
            $this->cWeight[1] = 1 - $this->cWeight[2];
        }
        elseif ($weight > $weightMedium && $weight <= $weightHeavy) {
            $this->cWeight[3] = ($weight - $weightMedium) / ($weightHeavy - $weightMedium);
            $this->cWeight[2] = 1 - $this->cWeight[3];
        }
        elseif ($weight > $weightHeavy && $weight <= $weightVeryHeavy) {
            $this->cWeight[4] = ($weight - $weightHeavy) / ($weightVeryHeavy - $weightHeavy);
            $this->cWeight[3] = 1 - $this->cWeight[4];
        }
        elseif ($weight > $weightVeryHeavy) {
            $this->cWeight[4] = 1;
        }
        // return  $weightVerySlim . " " . $weight . " " . $weightVeryHeavy;
    }

    public function result($sex, $tuoi, $weight, $height)
    {
        $this->tinhXacSuat($sex, $tuoi, $weight, $height);
        $maxValueHeight = max($this->cHeight);
        $maxPositionHeight = array_search($maxValueHeight, $this->cHeight);

        $maxValueWeight = max($this->cWeight);
        $maxPositionWeight = array_search($maxValueWeight, $this->cWeight);


        $final = $this -> cTableStatus[$maxPositionHeight][$maxPositionWeight];
        if ($final == 1) {
            return "Suy dinh dưỡng cấp 2";
        } elseif ($final == 2) {
            return "Suy dinh dưỡng cấp 1";
        } elseif ($final == 3) {
            return "Bình thường";
        } elseif ($final == 4) {
            return "Thừa cân";
        } else {
            return "Béo phì";
        }
    }
}

