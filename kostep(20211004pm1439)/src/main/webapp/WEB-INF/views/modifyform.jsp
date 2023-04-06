<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>modifyform</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="resources/mypage2/css/modify.css"/>
	</head>
<body>
<div class="wrap wd668">
      <div class="container">
        <div class="form_txtInput">
          <h2 class="sub_tit_txt">회원정보 수정</h2>
          <p class="exTxt">회원정보</p>
          <div class="join_form">
            <table>
              <colgroup>
                <col width="30%"/>
                <col width="auto"/>
              </colgroup>
              <tbody>
                <tr>
                  <th><span>아이디</span></th>
                  <td><input type="text" placeholder="ID 를 입력하세요."></td>
                </tr>
                <tr>
                  <th><span>이름</span></th>
                  <td><input type="text" placeholder="입력하세요"></td>
                </tr>
                <tr>
                  <th><span>비밀번호</span></th>
                  <td><input type="text" placeholder="비밀번호를 입력해주세요."></td>
                </tr>
                <tr class="email">
                  <th><span>이메일</span></th>
                  <td>
                    <input type="text"  class="email" placeholder=""><span class="mar10">@</span>
                    <input type="text"  class="email email2" placeholder="">
                  </td>
                </tr>
                <tr>
                  <th><span>주소</span></th>
                  <td><input type="text" placeholder="주소를 입력하세요"></td>
                </tr>
                <tr>
                  <th><span>휴대폰 번호</span></th>
                  <td><input type="text" placeholder="번호 를 입력하세요."></td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="btn_wrap">
            <a href="mypage2">회원정보 수정</a>   
          </div>
          <div class="btn_wrap">
            <a href="index">회원 탈퇴</a>   
          </div>
        </div> <!-- form_txtInput E -->
      </div><!-- content E-->
    </div> <!-- container E -->
</body>
</html>