 const url = "https://www.apple.com.cn/shop/buy-ipad/ipad-mini";
 const method = "GET";
 
 const myRequest = {
     url: url,
     method: method, // Optional, default GET.
 };
 
 $task.fetch(myRequest).then(response => {
     // response.statusCode, response.headers, response.body
     const word = '无线局域网 + 蜂窝网络机型将在获得批准后发售';
     var has_released = !response.body.includes(word);
     if (has_released) {
        $notify("iPad Mini 蜂窝版发售状态", "蜂窝版已经发售", "蜂窝版已经发售");
     } else {
        $notify("iPad Mini 蜂窝版发售状态", "蜂窝版还未发售", "蜂窝版还未发售");
     }
      
     $done();
 }, reason => {
     // reason.error
     $notify("iPad Mini 蜂窝版发售状态", "网络请求失败", "网络请求失败"); 
     $done();
 });
 