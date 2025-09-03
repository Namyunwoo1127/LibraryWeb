<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기 - 도서관</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
        }
        
        .header {
            border: 2px solid #333;
            padding: 20px;
            text-align: center;
        }
        
        .logo {
            border: 1px solid #666;
            padding: 10px 20px;
            font-weight: bold;
            display: inline-block;
        }
        
        .main-content {
            padding: 50px 30px;
            text-align: center;
        }
        
        .page-title {
            border: 2px solid #333;
            padding: 20px;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 30px;
        }
        
        .form-container {
            border: 2px solid #333;
            padding: 30px;
            text-align: left;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            border: 1px solid #ccc;
            padding: 8px;
            background-color: #f9f9f9;
        }
        
        .form-group input {
            width: 100%;
            padding: 12px;
            border: 2px solid #666;
            font-size: 14px;
        }
        
        .btn-group {
            text-align: center;
            margin-top: 30px;
            display: flex;
            gap: 15px;
            justify-content: center;
        }
        
        .btn {
            padding: 12px 25px;
            border: 2px solid #333;
            background-color: white;
            cursor: pointer;
            font-weight: bold;
        }
        
        .footer {
            border: 2px solid #333;
            padding: 20px;
            text-align: center;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="logo">도서관 로고</div>
        </div>
        
        <div class="main-content">
            <div class="page-title">비밀번호 찾기</div>
            
            <div class="form-container">
                <form>
                    <div class="form-group">
                        <label>아이디</label>
                        <input type="text" placeholder="가입시 입력한 아이디를 입력하세요">
                    </div>
                    
                    <div class="form-group">
                        <label>이메일</label>
                        <input type="email" placeholder="가입시 입력한 이메일을 입력하세요">
                    </div>
                    
                    <div class="btn-group">
                        <button type="submit" class="btn">비밀번호 찾기</button>
                        <button type="button" class="btn">취소</button>
                    </div>
                </form>
            </div>
        </div>
        
        <div class="footer">
            <div>도서관 정보 | 이용약관 | 개인정보처리방침 | 문의사항</div>
        </div>
    </div>
</body>
</html>