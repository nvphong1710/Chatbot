<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\message;
use App\Models\nhuCauNangLuong;
use App\Models\thucPhamChuyenDoi;
use App\Models\tiLeDinhDuong;
use App\Models\chieuCaoCanNang;
use App\Http\Controllers\FuzzyController;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Redirect;
class ThucDonController extends Controller
{   

    public function result(Request $request, $sex, $tuoi, $weight, $height)
    {
        return $this->thucDonDinhDuong($sex, $tuoi, $weight, $height);
    }
    public function thucDonDinhDuong($sex, $tuoi, $weight, $height)
    {
        $fuzzyController = new FuzzyController();
        $tinhTrang = $fuzzyController->result($sex, $tuoi, $weight, $height);
        $kcall = 0;
        $kcal = 0;
        $nhuCau = nhuCauNangLuong::orderBy('id', 'asc')->get();
        foreach($nhuCau as $nhuCauN){
            if($nhuCauN->tuoi_toi_thieu <= $tuoi && $nhuCauN->tuoi_toi_da >= $tuoi){
                $kcall = $nhuCauN->nang_luong;
                break;
            }
        }
        $kcal = $kcall;
        if ($tinhTrang === "Suy dinh dưỡng cấp 1") {
            $kcal = $kcall * 1.1;
        } elseif ($tinhTrang === "Suy dinh dưỡng cấp 2") {
            $kcal = $kcall * 1.2;
        } elseif ($tinhTrang === "Thừa cân") {
            $kcal = $kcall * 0.9;
        } elseif ($tinhTrang === "Béo phì") { 
            $kcal = $kcall * 0.8;
        }
        // return $kcal;
        $tiLeDinhDuong = tiLeDinhDuong::where('tong_kcal', $kcall)->first();
        $tinhBot = $kcal * ($tiLeDinhDuong->tinh_bot / 100);
        $chatBeo = $kcal * ($tiLeDinhDuong->chat_beo / 100);
        $protein = $kcal * ($tiLeDinhDuong->protein / 100);

        $tb = $this->randomThucPham("Nhiều tinh bột", 3);
        $cb = $this->randomThucPham("Nhiều chất béo", 3);
        $pr = $this->randomThucPham("Nhiều protein", 3);
        
        $message3 = new message();
        $message3->content = "Thể trạng hiện tại của cháu là:" . $tinhTrang . "<br>" .
                    "Khẩu phần ăn phù hợp cho cháu là khoảng: " . $kcal . " kcal<br>" .
                    "Thực đơn ví dụ như:<br>" .
                    "- " . $tinhBot . " kcal từ " . $tb . "<br>" .
                    "- " . $chatBeo . " kcal từ " . $cb . "<br>" .
                    "- " . $protein . " kcal từ " . $pr ;
        $message3->sender = 1;
        $message3->timenow="";
        $message3->save();

        return Redirect::to('home');
    }

    public function randomThucPham($nhom, $quantity)
    {
        $listThucPham = thucPhamChuyenDoi::where('nhom', $nhom)->inRandomOrder()->take($quantity)->get();
        $result = "";
        foreach ($listThucPham as $thucPham) {
            $result .= $thucPham->ten . ',';
        }
        return $result;
    }
}
