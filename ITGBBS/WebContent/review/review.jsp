<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        * { margin:0px; padding:0px; }
        /* Animation Canvas */
        .animation_canvas  {
            overflow:hidden;
            position:relative;           
            width:900px; height:400px;
        }
         .firstLeader  {
            overflow:hidden;
            position:relative;           
            width:900px; height:400px;
        }
        .first_image
        {
            width:900px; height:400px;
        }
        /* Slider Panel */
        .slider_panel { width:2700px; position:relative; }
        .slider_image { float:left; width:300px; height:200px; }
    
        /* Slider Text Panel */
        .slider_text_panel { position:absolute; top:200px; left:50px; }
        .slider_text { position:absolute; width:250px; height:150px; }
    
        /* Control Panel */
        .control_panel  {
            position:absolute; top:350px; 
            left:400px; height:13px; 
            overflow:hidden; 
        }

        .control_button {
            width:12px; height:46px;
            position:relative; 
    
            float:left; cursor:pointer;  
            background:url('point_button.png');
        }
        .control_button:hover { top:-16px; }
        .control_button.active { top:-31px; }
    </style>
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script>
        $(document).ready(function () {
            // 슬라이더를 움직여주는 함수
            function moveSlider(index) {
                // 슬라이더를 이동합니다.
                var willMoveLeft = -(index * 900);
                $('.slider_panel').animate({ left: willMoveLeft }, 'slow');
                $('.slider_text_panel').animate({ left: willMoveLeft }, 'slow');
                // control_button에 active클래스를 부여/제거합니다.
                $('.control_button[data-index=' + index + ']').addClass('active');
                $('.control_button[data-index!=' + index + ']').removeClass('active');
            }

            // 초기 텍스트 위치 지정 및 data-index 할당
            $('.slider_text').each(function (index) {
                $(this).attr('data-index', index).css('left', index*300);
            });

            // 컨트롤 버튼의 클릭 핸들러 지정 및 data-index 할당
            $('.control_button').each(function (index) {
                $(this).attr('data-index', index);
            }).click(function () {
                var index = $(this).attr('data-index');
                moveSlider(index);
            });

            // 초기 슬라이더 위치 지정
            var randomNumber = Math.round(Math.random() * 3);
            moveSlider(randomNumber);
        });
    </script>
</head>
<body>
    <center>
        <div class="firstLeader">
        <img src="Desert.jpg" class="first_image"/>
        </div>
        <div class="animation_canvas">
            <div class="slider_panel">
                <img src="Desert.jpg" class="slider_image"/>
                <img src="Hydrangeas.jpg" class="slider_image"/>
                <img src="Jellyfish.jpg" class="slider_image"/>
                <img src="Koala.jpg" class="slider_image"/>
                <img src="Lighthouse.jpg" class="slider_image"/>
                <img src="Desert.jpg" class="slider_image"/>
                <img src="Hydrangeas.jpg" class="slider_image"/>
                <img src="Jellyfish.jpg" class="slider_image"/>
                <img src="Koala.jpg" class="slider_image"/>
            </div>
            <div class="slider_text_panel">
                <div class="slider_text">
                    <h1>Lorem ipsum</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </div>
                <div class="slider_text">
                    <h1>Nulla eget</h1>
                    <p>Nulla eget sapien mauris, ornare elementum elit.</p>
                </div>
                <div class="slider_text">
                    <h1>Quisque eleifend</h1>
                    <p>Quisque eleifend augue nec lacus lobortis porta.</p>
                </div>
                <div class="slider_text">
                    <h1>Donec</h1>
                    <p>Donec a ligula lectus, eu iaculis justo.</p>
                </div>
                <div class="slider_text">
                    <h1>Vivamus scelerisque</h1>
                    <p>Vivamus scelerisque mauris id nunc dictum sit amet.</p>
                </div>
                 <div class="slider_text">
                    <h1>Lorem ipsum</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                </div>
                <div class="slider_text">
                    <h1>Nulla eget</h1>
                    <p>Nulla eget sapien mauris, ornare elementum elit.</p>
                </div>
                <div class="slider_text">
                    <h1>Quisque eleifend</h1>
                    <p>Quisque eleifend augue nec lacus lobortis porta.</p>
                </div>
                <div class="slider_text">
                    <h1>Donec</h1>
                    <p>Donec a ligula lectus, eu iaculis justo.</p>
                </div>
            </div>
            <div class="control_panel">
                <div class="control_button"></div>
                <div class="control_button"></div>
                <div class="control_button"></div>
            </div>
        </div>
        <h1>Test Header</h1>
    </center>
</body>
</html>