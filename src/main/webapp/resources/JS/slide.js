/**
 * 
 */

	let currentSlide = 0;
	const slides = document.querySelectorAll('.slide'); // 모든 슬라이드 요소를 가져옴
	const totalSlides = slides.length;
	
	function showNextSlide() {
	    slides.forEach(slide => {
	        slide.style.display = 'none'; // 모든 슬라이드를 숨김
	    });
	    currentSlide = (currentSlide + 1) % totalSlides;
	    slides[currentSlide].style.display = 'block'; // 현재 슬라이드만 보이게 함
	}
	
	// 매 3초마다 자동 슬라이드
	setInterval(showNextSlide, 3000);
	
	
