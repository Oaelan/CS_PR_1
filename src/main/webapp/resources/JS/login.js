/**
 * 
 */
// 사용자 ID 검증
	let userId = document.getElementById("userId");
	console.log(userId)
	userIdLabel.textContent = ".";
	userIdLabel.style.color = "white";
	userId.addEventListener("blur",()=>{
		var userIdPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,20}$/;
		var userIdLabel = document.getElementById("userIdLabel");
		if (userId.value.match(userIdPattern)) {
			userIdLabel.textContent = "사용 가능한 아이디입니다.";
			userIdLabel.style.color = "green";
		} else {
			userIdLabel.textContent = "사용자 ID는 영문자와 숫자를 조합하여 5-20자여야 합니다.";
			userIdLabel.style.color = "red";
		}
	})
	
	
	// 비밀번호 검증
	
	let password = document.getElementById("pw");
	console.log(password)
	passwordLabel.textContent = ".";
	passwordLabel.style.color = "white";
	password.addEventListener("blur",()=>{
		var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,25}$/;
		var passwordLabel = document.getElementById("passwordLabel");
		if (password.value.match(passwordPattern)) {
			passwordLabel.textContent = "사용 가능한 비밀번호입니다.";
			passwordLabel.style.color = "green";
		} else {
			passwordLabel.textContent = "비밀번호는 영문자, 숫자, 특수문자를 조합하여 8-25자여야 합니다.";
			passwordLabel.style.color = "red";
		}
	})
	
	
	// 비밀번호 확인 함수
	let pwcheck = document.getElementById("pwcheck");
	confirmLabel.textContent = ".";
	confirmLabel.style.color = "white";
	pwcheck.addEventListener("blur", ()=>{
		var password = document.getElementById("pw").value;
		var confirmPassword = document.getElementById("pwcheck").value;
		var confirmLabel = document.getElementById("confirmLabel");
		if (password == confirmPassword) {
			confirmLabel.textContent = "비밀번호가 일치합니다.";
			confirmLabel.style.color = "green";
		} else {
			confirmLabel.textContent = "비밀번호가 일치하지 않습니다.";
			confirmLabel.style.color = "red";
		}
	})


	
	// 이름 검증
	
	let name = document.getElementById("name");
	console.log(name)
	nameLabel.textContent = ".";
	nameLabel.style.color = "white";
	name.addEventListener("blur",()=>{
		var namePattern = /^[가-힣]{2,6}$/;
		var nameLabel = document.getElementById("nameLabel");
		if (name.value.match(namePattern)) {
			nameLabel.textContent = "사용할 수 있는 이름입니다.";
			nameLabel.style.color = "green";
		} else {
			nameLabel.textContent = "이름은 한글만 2-6자여야 합니다.";
			nameLabel.style.color = "red";
		}
	})
	
	// 전화번호 검증
	
	let phone = document.getElementById("phone");
	let phoneLabel = document.getElementById("PhoneLabel");
	
	console.log(phone);
	phoneLabel.textContent = ".";
	phoneLabel.style.color = "white";
	
	phone.addEventListener("blur", () => {
	    var phonePattern = /^01[0|1|6|7|8|9]\d{3,4}\d{4}$/;
	    if (phone.value.match(phonePattern)) {
	        phoneLabel.textContent = "올바른 전화번호 형식입니다.";
	        phoneLabel.style.color = "green";
	    } else {
	        phoneLabel.textContent = "올바른 전화번호 형식이 아닙니다.";
	        phoneLabel.style.color = "red";
	    }
	});

	
	