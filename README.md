# CRStatusBarHUD
一个非常简单易用的状态栏框架（李明杰老师－百思不得姐）

##显示成功信息
```objc
[CRStatusBarHUD showSuccess:@"加载成功！"];
```

##显示失败信息
```objc
[CRStatusBarHUD showFail:@"加载失败！"];
```

##显示正在加载中
```objc
[CRStatusBarHUD showLoading:@"正在加载中...."];
```

##隐藏
```objc
[CRStatusBarHUD hide];
```

##显示自定义信息
```objc
[CRStatusBarHUD showCustomMessage:@"自定义消息" Image:[UIImage imageNamed:@"1"]];
```


