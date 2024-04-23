     // 콤마 변환함수 (1,234)
    function numberWithCommas(num) {
      return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");  
    }