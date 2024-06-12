<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="https://st3.depositphotos.com/8950810/17657/v/450/depositphotos_176577870-stock-illustration-cute-smiling-funny-robot-chat.jpg" type="image/x-icon">
  <title>Tư vấn dinh dưỡng</title>
  <link rel="stylesheet" href="{{('public/frontend/index.css')}}">
</head>
<body>
  <section class="msger">
    <header class="msger-header">
      <div class="msger-header-title" style="padding: 5px 0 0 0">
        <i class="fas fa-comment-alt"></i> Chào mừng đến với hệ thống tư vấn dinh dưỡng cho trẻ em
      </div>
      <div class="msger-header-options">
        <form action="{{URL::to('/delete')}}" method="post">
          {{ csrf_field() }}
          <button class="btn-delete cursor: pointer;" style="border: none;background-color: #579ffb; padding: 5px 5px 5px 5px;color:white;border-radius:4px;">Tạo cuộc trò chuyện mới</button>
        </form>
      </div>
    </header>
  
    <main class="msger-chat" id="element">
      <div class="msg left-msg">
        <div
         class="msg-img"
         style="background-image: url(https://st3.depositphotos.com/8950810/17657/v/450/depositphotos_176577870-stock-illustration-cute-smiling-funny-robot-chat.jpg)"
        ></div>
  
        <div class="msg-bubble">
          <div class="msg-info">
            <div class="msg-info-name">Bác sỹ dinh dưỡng AI</div>
            <!-- <div class="msg-info-time" id="realTime"></div> -->
          </div>
  
          <div class="msg-text">
            Xin chào, hãy chọn chủ đề bạn muốn tư vấn và điền vào dấu ... theo mẫu câu bên dưới. 😄
          </div>
        </div>
      </div>
      @foreach($latestMessages as $message)
            @if($message -> sender == 1)
                  <div class="msg left-msg">
                    <div class="msg-img" style="background-image: url(https://st3.depositphotos.com/8950810/17657/v/450/depositphotos_176577870-stock-illustration-cute-smiling-funny-robot-chat.jpg)"></div>
                    <div class="msg-bubble">
                      <div class="msg-info">
                        <div class="msg-info-name">Bác sỹ dinh dưỡng AI</div>
                        <div class="msg-info-time"><?php echo $message->timenow ?></div>
                      </div>

                      <div class="msg-text"><?php echo nl2br($message->content) ?></div>
                    </div>
                  </div>
              @else
                <div class="msg right-msg">
                  <div class="msg-img" style="background-image: url(https://img.freepik.com/premium-vector/anonymous-user-circle-icon-vector-illustration-flat-style-with-long-shadow_520826-1931.jpg)"></div>
                    <div class="msg-bubble">
                      <div class="msg-info">
                        <div class="msg-info-name">Person</div>
                        <div class="msg-info-time"><?php echo $message->timenow ?></div>
                      </div>

                      <div class="msg-text"><?php echo nl2br($message->content) ?></div>
                    </div>
                </div>
              @endif
        @endforeach
    </main>
    <button onclick="setScenario(1)" class="kb">Hỏi về chế độ ăn hàng ngày</button>
    <button onclick="setScenario(2)" class="kb">Hỏi về chế độ dinh dưỡng cho các hiện tượng</button>
    <button onclick="setScenario(3)" class="kb">Hỏi về vai trò và nhu cầu của chất dinh dưỡng</button>
    <form class="msger-inputarea" method="post" action="{{URL::to('/submit')}}">
      {{ csrf_field() }}
      <input type="hidden" id="current-time-input" name="timenow">
      <input type="text" class="msger-input" placeholder="Enter your message..." id="textInput" name="msg" readonly>
      <button type="submit" class="msger-send-btn" id="btn">Send</button>
    </form>
  </section>
</body>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>

  var element = document.querySelector('#element');

  element.scrollTop = element.scrollHeight;

</script>
<script>
  function setScenario(scenario) {
      var inputElement = document.getElementById("textInput");

      // Tùy thuộc vào kịch bản được chọn, hiển thị văn bản tương ứng
      switch (scenario) {
          case 1:
              inputElement.value = "Chào bác sỹ, tôi muốn hỏi chế độ ăn cho cháu có chiều cao ... cm, cân nặng ... kg, giới tính ..., ... tuổi";
              break;
          case 2:
              inputElement.value = "Chào bác sỹ, cháu nhà tôi có hiện tượng ... thì chế độ dinh dưỡng như thế nào để khắc phục ạ ?";
              break;
          case 3:
              inputElement.value = "Chào bác sỹ, tôi cần biết thêm thông tin về ... cho trẻ ... tuổi";
              break;
          default:
              inputElement.value = "";
      }

      // Hủy thuộc tính readonly khi nút được nhấn
      inputElement.removeAttribute("readonly");
  }
</script>

<!-- ----------real time -->

<script>
  function displayCurrentTime() {
      var currentTime = new Date();
      var hours = currentTime.getHours();
      var minutes = currentTime.getMinutes();
      var seconds = currentTime.getSeconds();

      // Định dạng thời gian để có định dạng "HH:mm"
      var formattedTime = padNumber(hours) + ":" + padNumber(minutes);

      // Gán giá trị thời gian vào phần tử HTML
      document.getElementById("realTime").innerText = formattedTime;
  }

  // Hàm để thêm số 0 phía trước nếu số nhỏ hơn 10
  function padNumber(num) {
      return (num < 10 ? "0" : "") + num;
  }

  // Gọi hàm để hiển thị thời gian lúc ban đầu
  displayCurrentTime();
</script>
<script>
  // Hàm để lấy giờ hiện tại và gán vào thẻ input
  function setCurrentTime() {
    var currentTime = new Date();
    var hours = currentTime.getHours();
    var minutes = currentTime.getMinutes();

    // Định dạng giờ và phút để hiển thị
    var formattedTime = padNumber(hours) + ":" + padNumber(minutes);

    // Lấy thẻ input theo ID và gán giá trị
    document.getElementById("current-time-input").value = formattedTime;
  }

  // Hàm để thêm số 0 phía trước nếu số nhỏ hơn 10
  function padNumber(num) {
    return (num < 10 ? "0" : "") + num;
  }

  // Gọi hàm để thiết lập giờ hiện tại
  setCurrentTime();
</script>
</html>