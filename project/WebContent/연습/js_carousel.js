/**
 * const
 * let
 * var
 */

(function (){
	const slideList = document.querySelector('.slide_list'); 
	// Slide parent DOM  단일 Element객체를 반환  선택자가 선택하는 요소의 첫번째 요소를 반환
	//getElementById로 가져올 수도 있을까??
	const slideContents = document.querySelectAll('.slide_content'); //모든 Element객체를 반환
	const slideBtnNext = document.querySelector('.slide_btn_next');
	const slideBtnPrev = document.querySelector('.slide_btn_prev');
	const pagination = document.querySelector('.slide_pagination');
	const slideLen = slideContents.length;
	const slideWidth = 400;
	const slideSpeed = 300;
	const slideNum = 0;
	
	slideList.style.width = slideWidth * (slideLen +2) + "px";
	//무슨 의미?? 슬라이드리스트의 넓이를 설정해 준 것! : 400 * [(5)컨텐츠 개수!+2(왜? : 1번 앞과 5번 뒤에 복사존을 넣어 줄거야)]
	//+2를 뺴고도 한 번 시도해 보고 무슨 차이가 있는지 눈으로 확인할 것!!
	
	let firstChild = slideList.fisrtElementChild;
	let lastChild = slideList.lastElementChild;
	let clonedFirst = firstChild.cloneNode(true);
	let clonedLast = lastChild.cloneNode(true);
	//cloneNode()는 뭐임? : dom을 복제하는 메소드!!
	
	//복제한 슬라이드를 붙임
	slideList.appendChild(clonedFirst); 
	//슬라이드 마지막에 복제한 첫 슬라이드를 붙임 
	slideList.insertBefore(clonedLast, slideList.firstElementChild); 
	//첫 슬라이드 앞에  복제한 마지막 슬라이드 붙임 
	

    // Add pagination dynamically
    let pageChild = '';
    for (var i = 0; i < slideLen; i++) {
      pageChild += '<li class="dot';
      pageChild += (i === startNum) ? ' dot_active' : '';
      pageChild += '" data-index="' + i + '"><a href="#"></a></li>';
    }
    pagination.innerHTML = pageChild;
    const pageDots = document.querySelectorAll('.dot'); // each dot from pagination

    slideList.style.transform = "translate3d(-" + (slideWidth * (startNum + 1)) + "px, 0px, 0px)";
	
	
	let curIndex = startNum; //current slide index (복제한 슬라이드 제외)
	let curSlide = slideContents[curIndex]; //current slide DOM
	curSlide.classList.add('slide_active');
	//classList는 뭐야??
	
	///Next Button Event
	//슬라이드 앞 뒤에 각각 1개씩 복사본을 붙였기 때문에 최초로 코드를 실행할 때, 
	//slideList의 위치를 translate3d(-400px, 0px, 0px)으로 잡아줘야한다.

	slideBtnNext.addEventListener('click', function(){
		if(curIndex <= slideLen -1){
			slideList.style.transition = slideSpeed + "ms";
			slideList.style.transform = "translate3d(-"+(slideWidth*(curIndex+2))+"px, 0px, 0px)"
			//translate3d의 사용법을 알아봐야 해!
			//(slideWidth*(curIndex+1) : 이 만큼 x축을 움직이는 거야!
		}if(curIndex === slideLen -1){
			setTimeout(function(){
			 slideList.style.transition = "0ms";
			 slideList.style.transform = "translate3d(-"+slideWidth+"px, 0px, 0px)";}, slideSpeed);
			curIndex= -1;
		} 
		//여기서 문제 발생!! : 맨 마지막까지 이동한 다음에 다시 처음으로 이동하게 하려면 어떻게 하지? : 복제 트릭!!
		curSlide.classList.remove('slide_active');
		pageDots[(curIndex === -1) ? slideLen -1 : curIndex].classList.remove('dot_active');
		curSlide = slideContents[++curIndex];//그다음에 curIndex를 1씩 증가
		curslide.classList.add('slide_active');
		pageDots[curIndex].classList.add('dot_active');
		});
	
	   //Prev Button Event
	   slideBtnPrev.addEventListener('click', function(){
		  if(curIndex >= 0){
			  slideList.style.transition = slideSpeed + "ms";
			  slideList.style.transform = "translate3d(-"+(slideWidth * curIndex)+"px, 0px, 0px)";
		  } if (curIndex === 0) {
          setTimeout(function() {
            slideList.style.transition = "0ms";
            slideList.style.transform = "translate3d(-" + (slideWidth * slideLen) + "px, 0px, 0px)";
          }, slideSpeed);
          curIndex = slideLen;
        }
        curSlide.classList.remove('slide_active');
        pageDots[(curIndex === slideLen) ? 0 : curIndex].classList.remove('dot_active');
        curSlide = slideContents[--curIndex];
        curSlide.classList.add('slide_active');
        pageDots[curIndex].classList.add('dot_active');
      });

      /** Pagination Button Event */
      let curDot;
      Array.prototype.forEach.call(pageDots, function (dot, i) {
        dot.addEventListener('click', function (e) {
          e.preventDefault();
          curDot = document.querySelector('.dot_active');
          curDot.classList.remove('dot_active');
          
          curDot = this;
          this.classList.add('dot_active');

          curSlide.classList.remove('slide_active');
          curIndex = Number(this.getAttribute('data-index'));
          curSlide = slideContents[curIndex];
          curSlide.classList.add('slide_active');
          slideList.style.transition = slideSpeed + "ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 1)) + "px, 0px, 0px)";
        });
      });
    })();