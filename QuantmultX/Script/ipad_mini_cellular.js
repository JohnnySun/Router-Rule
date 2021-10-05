 const url = "https://www.apple.com.cn/shop/buy-ipad/ipad-pro";
 const method = "POST";
 
 const myRequest = {
     url: url,
     method: method, // Optional, default GET.
 };
 
 $task.fetch(myRequest).then(response => {
     // response.statusCode, response.headers, response.body
     const word = '无线局域网 + 蜂窝网络机型将在获得批准后发售';
     var has_released = !response.body.include(word);
     console.log(response.body);
     $notify("iPad Mini 发售状态", "还未发售", "还未发售"); 
     $done();
 }, reason => {
     // reason.error
     $notify("iPad Mini 发售状态", "网络请求失败", "网络请求失败"); 
     $done();
 });
 