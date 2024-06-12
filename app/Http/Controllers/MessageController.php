<?php
//final
namespace App\Http\Controllers;
  
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Redirect;
use App\Models\message;
use App\Models\vaiTro;
use App\Models\dinhDuong;
use App\Models\hienTuong;
use App\Models\giaiPhap;
use App\Models\nhuCauVitamin;
use App\Models\nhuCauChatKhoang;
use App\Models\nhuCauProtein;
use App\Models\nhuCauLipid;
use App\Models\nhuCauGlucid;
use App\Models\nhuCauNuoc;
use App\Http\Controllers\ThucDonController;
session_start();
class MessageController extends Controller
{

    //-----------Lấy tin nhắn từ cơ sở dữ liệu in ra màn hình chính----------

    public function index(){
        $latestMessages = Message::orderBy('id_message', 'asc')->get();
        return view('welcome', compact('latestMessages'));
    }

    //-----------Tạo cuộc trò chuyện mới----------

    public function delete(){
        message::truncate();
        return Redirect::to('home');
    }

    //------------Xử lý input--------------

    public function submitForm(Request $request)
    {
        
        $data = $request->all();
        $message = new message();
        $message->content = $data['msg'];
        $message->sender = 0;
        $message->timenow = $data['timenow'];
        $message->save();
        if (strpos($data['msg'], "Chào bác sỹ, tôi muốn hỏi chế độ ăn cho cháu có") !== false
            && strpos($data['msg'], "chiều cao") !== false && strpos($data['msg'], "cân nặng") !== false
            && strpos($data['msg'], "giới tính") !== false && strpos($data['msg'], " tuổi") !== false) {
            return $this->tuVanKhauPhanAn($data['msg']);
        }

        if (strpos($data['msg'], "Chào bác sỹ, cháu nhà tôi có hiện tượng") !== false
            && strpos($data['msg'], "thì chế độ dinh dưỡng như thế nào để khắc phục ạ") !== false) {
                return $this->tuVanVanDeDinhDuong($data['msg']);
        }

        if (strpos($data['msg'], "Chào bác sỹ, tôi cần biết thêm thông tin về") !== false
            && strpos($data['msg'], " tuổi") !== false) { 
                return $this->tuVanVaiTroDinhDuong($data['msg']);
        }
        $message2 = new message();
        $message2->content = 'Không thể nhận dạng thông tin tư vấn';
        $message2->sender = 1;
        $message2->timenow="";
        $message2->save();
        return Redirect::to('home');
    }

    //------------Kịch bản 1--------------

    private function tuVanKhauPhanAn($messagex)
    {
        $height = 0;
        $weight = 0;
        $tuoi = 0;
        $sex = "";
    
        // Sử dụng biểu thức chính quy để tìm các giá trị số
        preg_match('/chiều cao (\d+(\.\d+)?) cm/', $messagex, $matches);
        if (!empty($matches)) {
            $height = (double)$matches[1];
        }
    
        preg_match('/cân nặng (\d+(\.\d+)?) kg/', $messagex, $matches);
        if (!empty($matches)) {
            $weight = (double)$matches[1];
        }
    
        preg_match('/giới tính (\p{L}+)/u', $messagex, $matches);
        if (!empty($matches)) {
            $sex = trim($matches[1]);
        }
        $x = "nu";
        $y = "nam";
        $normalized_user_sex = mb_strtolower($sex, 'UTF-8');
        $normalized_user_sex = iconv('UTF-8', 'ASCII//TRANSLIT', $normalized_user_sex);
        if($normalized_user_sex != $x && $normalized_user_sex != $y){
            $message2 = new message();
            $message2->content = 'Không thể nhận dạng thông tin tư vấn.';
            $message2->sender = 1;
            $message2->timenow="";
            $message2->save();
            return Redirect::to('home');
        }
        preg_match('/(\d+(\.\d+)?) tuổi/', $messagex, $matches);
        if (!empty($matches)) {
            $tuoi = (double)$matches[1];
        }
    
        if ($height <= 0 || $weight <= 0 || $tuoi <= 0) {
            $message2 = new message();
            $message2->content = 'Không thể nhận dạng thông tin tư vấn';
            $message2->sender = 1;
            $message2->timenow="";
            $message2->save();
            return Redirect::to('home');
        }
        // Lưu các giá trị vào session và chuyển hướng
        Session()->put('height', $height);
        Session()->put('weight', $weight);
        Session()->put('sex', $sex);
        Session()->put('tuoi', $tuoi);
        return Redirect::to("thucdon/$sex/$tuoi/$weight/$height");
    }
    
    //------------Kịch bản 2--------------

    private function tuVanVanDeDinhDuong($message)
    {
        $removeMessage = ["Chào bác sỹ, cháu nhà tôi có hiện tượng ", " thì chế độ dinh dưỡng như thế nào để khắc phục ạ ?"];
        $message = str_replace($removeMessage, '', $message);
        $cacHienTuong = explode(";", $message);
        $cacHienTuong = array_map('trim', $cacHienTuong);
        $vanDeFinal = "null";
        $mucDoPhuHop = 0;

        foreach ($cacHienTuong as $hienTuong) {
            $hienTuongi = HienTuong::where(function ($query) use ($hienTuong) {
                $keywords = explode(', ', $hienTuong);
                foreach ($keywords as $keyword) {
                    $query->orWhereRaw("LOWER(bieu_hien) LIKE LOWER(?)", ['%' . $keyword . '%']);
                }
            })->get();
            $mucDoPhuHopi = 0;
            $vanDei = "";
            foreach ($hienTuongi as $hienTuongj) {
                $mucDoPhuHopi += $hienTuongj->muc_do_phu_hop;
                $vanDei = $hienTuongj->van_de;
            }

            if ($mucDoPhuHopi > $mucDoPhuHop) {
                $vanDeFinal = $vanDei;
                $mucDoPhuHop = $mucDoPhuHopi;
            }
        }
        if ($vanDeFinal == "null") {
            $message2 = new message();
            $message2->content = "Không thể chẩn đoán vấn đề gặp phải dựa trên các hiện tượng đã cho ☹️";
            $message2->sender = 1;
            $message2->timenow="";
            $message2->save();
            return Redirect::to('home');
        }

        $result = "Từ hiện tượng, có thể cháu đang gặp vấn đề " . strtolower($vanDeFinal) . ", giải pháp cho vấn đề này là";
        $giaiPhapList = giaiPhap::where('van_de', $vanDeFinal)->get();

        foreach ($giaiPhapList as $giaiPhap) {
            $result .= "<br>- " . $giaiPhap->giai_phap;
        }
        $message2 = new message();
        $message2->content = $result;
        $message2->sender = 1;
        $message2->timenow="";
        $message2->save();
        return Redirect::to('home');
    }

    //------------Kịch bản 3--------------

    private function tuVanVaiTroDinhDuong($message)
    {
        $chat = "";
        $tuoi = 0;

        // Sử dụng biểu thức chính quy để tìm các giá trị số
        preg_match('/(\d+) tuổi/', $message, $matches);
        if (!empty($matches)) {
            $tuoi = (double)$matches[1];
        }
        preg_match('/về (.*?) cho/u', $message, $matches);
        if (!empty($matches)) {
            $chat = trim($matches[1]);
            $chat = mb_strtolower($chat, 'UTF-8');
            $chat = iconv('UTF-8', 'ASCII//TRANSLIT', $chat);
        }
        // return $chat . " " . ;
        $dinhDuong = dinhDuong::where('ten', $chat)->first();
        if(!$dinhDuong){
            $message3 = new message();
            $message3->content = "Không thể nhận dạng thông tin tư vấn.";
            $message3->sender = 1;
            $message3->timenow="";
            $message3->save();
            return Redirect::to('home');
        }
        $dinhDuongId = $dinhDuong->id;
        $dinhDuongNhom = $dinhDuong->nhom;
        $vaitro = "";
        $dinhduong = "";
        $nhuCauVitaminFinal = new nhuCauVitamin();
        $nhuCauChatKhoangFinal = new nhuCauChatKhoang();
        $nhuCauProteinFinal = new nhuCauProtein();
        $nhuCauNuocFinal = new nhuCauNuoc();
        $nhuCauLipidFinal = new nhuCauLipid();
        $nhuCauGlucidFinal = new nhuCauGlucid();
        $vaiTroListFinal = vaiTro::where('dinh_duong_id', $dinhDuongId)->get();
        foreach($vaiTroListFinal as $vaiTrox){
            $vaitro .=  "- ". $vaiTrox->vai_tro . "<br>";
        }
        if ($chat == "vitamin"){
            $nhuCauVitamin = nhuCauVitamin::orderby('id', 'asc')->get();
            foreach($nhuCauVitamin as $nhuCauVitaminx){
                if($nhuCauVitaminx-> tuoi_toi_thieu <= $tuoi && $nhuCauVitaminx->tuoi_toi_da >= $tuoi){
                    $nhuCauVitaminFinal = $nhuCauVitaminx;
                    break;
                }
            }
            $dinhduong ="- Vitamin A: ". $nhuCauVitaminFinal->vitamin_a . "(mcg/ngày)<br>".
                        "- Vitamin B1: ". $nhuCauVitaminFinal->vitamin_b1 . "(mcg/ngày)<br>".
                        "- Vitamin B2: ". $nhuCauVitaminFinal->vitamin_b2 . "(mcg/ngày)<br>".
                        "- Vitamin B3: ". $nhuCauVitaminFinal->vitamin_b3 . "(mcg/ngày)<br>".
                        "- Vitamin B6: ". $nhuCauVitaminFinal->vitamin_b6 . "(mcg/ngày)<br>".
                        "- Vitamin B9: ". $nhuCauVitaminFinal->vitamin_b9 . "(mcg/ngày)<br>".
                        "- Vitamin B12: ". $nhuCauVitaminFinal->vitamin_b12 . "(mcg/ngày)<br>".
                        "- Vitamin C: ". $nhuCauVitaminFinal->vitamin_c . "(mcg/ngày)<br>".
                        "- Vitamin D: ". $nhuCauVitaminFinal->vitamin_d . "(mcg/ngày)<br>".
                        "- Vitamin E: ". $nhuCauVitaminFinal->vitamin_e . "(mcg/ngày)<br>".
                        "- Vitamin K: ". $nhuCauVitaminFinal->vitamin_k . "(mcg/ngày)<br>";

        }else if ($chat == "khoang chat"){
            $nhuCauChatKhoang = nhuCauChatKhoang::orderby('id', 'asc')->get();
            foreach($nhuCauChatKhoang as $nhuCauChatKhoangx){
                if($nhuCauChatKhoangx-> tuoi_toi_thieu <= $tuoi && $nhuCauChatKhoangx->tuoi_toi_da >= $tuoi){
                    $nhuCauChatKhoangFinal = $nhuCauChatKhoangx;
                    break;
                }
            }
            $dinhduong ="- Canxi: ". $nhuCauChatKhoangFinal->canxi . "(10^-3g/ngày)<br>".
                        "- Đồng: ". $nhuCauChatKhoangFinal->dong . "(10^-6g/ngày)<br>".
                        "- Iot: ". $nhuCauChatKhoangFinal->iot . "(10^-6g/ngày)<br>".
                        "- Kẽm ". $nhuCauChatKhoangFinal->kem . "(10^-3g/ngày)<br>".
                        "- Magie: ". $nhuCauChatKhoangFinal->maggie . "(10^-3g/ngày)<br>".
                        "- Photpho: ". $nhuCauChatKhoangFinal->phospho . "(10^-3g/ngày)<br>".
                        "- Sắt: ". $nhuCauChatKhoangFinal->sat . "(10^-3g/ngày)<br>".
                        "- Seleni: ". $nhuCauChatKhoangFinal->seleni . "(10^-6g/ngày)<br>";

        }else if ($chat == "protein"){
            $nhuCauProtein = nhuCauProtein::orderby('id', 'asc')->get();
            foreach($nhuCauProtein as $nhuCauProteinx){
                if($nhuCauProteinx-> tuoi_toi_thieu <= $tuoi && $nhuCauProteinx->tuoi_toi_da >= $tuoi){
                    $nhuCauProteinFinal = $nhuCauProteinx;
                    break;
                }
            }
            $dinhduong = "- Protein ". $nhuCauProteinFinal->khoi_luong . "(g/kg/ngày)<br>";
        }
        else if ($chat == "glucid"){
            $nhuCauGlucid = nhuCauGlucid::orderby('id', 'asc')->get();
            foreach($nhuCauGlucid as $nhuCauGlucidx){
                if($nhuCauGlucidx-> tuoi_toi_thieu <= $tuoi && $nhuCauGlucidx->tuoi_toi_da >= $tuoi){
                    $nhuCauGlucidFinal = $nhuCauGlucidx;
                    break;
                }
            }
            $dinhduong = "- Glucid ". $nhuCauGlucidFinal->khoi_luong . "(g/ngày)<br>";
        }
        else if ($chat == "lipid"){
            $nhuCauLipid = nhuCauLipid::orderby('id', 'asc')->get();
            foreach($nhuCauLipid as $nhuCauLipidx){
                if($nhuCauLipidx-> tuoi_toi_thieu <= $tuoi && $nhuCauLipidx->tuoi_toi_da >= $tuoi){
                    $nhuCauLipidFinal = $nhuCauLipidx;
                    break;
                }
            }
            $dinhduong = "- Lipid ". $nhuCauLipidFinal->khoi_luong . "(g/ngày)<br>";
        }
        else if ($chat == "nuoc"){
            $nhuCauNuoc = nhuCauNuoc::orderby('id', 'asc')->get();
            foreach($nhuCauNuoc as $nhuCauNuocx){
                if($nhuCauNuocx->tuoi >= $tuoi){
                    $nhuCauNuocFinal = $nhuCauNuocx;
                    break;
                }
            }
            $dinhduong = "- Nước tối đa: ". $nhuCauNuocFinal->dung_luong_toi_da . "(ml/ngày)<br>" .
                        "- Nước tối thiểu: " . $nhuCauNuocFinal->dung_luong_toi_thieu . "(ml/ngày)";
        }
        $result = "";
        if (empty($vaitro)) {
            $result .= "Chất chưa tồn tại trong hệ thống";
        }else{
            $result .= "Vai trò của ". $chat ." là: " . $dinhDuongNhom . "<br>".
                        $vaitro . "<br>".
                        "Nhu cầu đối với trẻ là:<br>".
                        $dinhduong;
        }
        $message3 = new message();
        $message3->content = $result;
        $message3->sender = 1;
        $message3->timenow="";
        $message3->save();
        return Redirect::to('home');
    }
}
