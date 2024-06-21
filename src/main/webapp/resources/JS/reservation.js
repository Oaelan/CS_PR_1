/**
 * 
 */

    function reservation() {
    // 사용자에게 확인 경고창 띄우기
    if (confirm("예약을 확정하시겠습니까?")) {
        // 확인을 눌렀을 때, 예약을 확정하고 다음 페이지로 이동
        window.location.href = '../JSP/rvcheck.jsp';
    } else {
        // 취소를 눌렀을 때, 아무 동작도 하지 않음
        return;
    	}
    }

    
    function main() {
        window.location.href = '../JSP/hospital.jsp';
    }
    
    const click = document.getElementById('click');
    	click.addEventListener('click', function() {
    	click.style.fontWeight = 'bold';
    	click.style.color = '#429aff';
    	click.style.textDecoration = 'underline';
        click.style.textDecorationColor = '#429aff';
        click.style.textUnderlineOffset = '5px';
    });
    	
    	
    // --------------------------------------------------------------
        
        
    const select = document.getElementById('select');
    const select1 = document.getElementById('select1');


    select.addEventListener('click', function() {

        select.style.backgroundColor = '#2763ba';
        select.style.color = 'white';
        select.style.border = '1px solid #2763ba';


        select1.style.backgroundColor = 'white';
        select1.style.color = 'black';
        select1.style.border = '1px solid black';
    });


    select1.addEventListener('click', function() {
        // select1 버튼 스타일 변경
        select1.style.backgroundColor = '#2763ba';
        select1.style.color = 'white';
        select1.style.border = '1px solid #2763ba';

        // select 버튼 초기화
        select.style.backgroundColor = 'white';
        select.style.color = 'black';
        select.style.border = '1px solid black';
    });
