## AOP用語

Advice ... AOPで実行する処理のこと
Pointcut ... 処理を実行する場所(クラスやメソッド)のこと
JoinPoint...処理を実行するタイミングのこと


## AOP実行タイミング(JoinPoint)
Before メソッドが実行される前
After メソッドが実行された後
AfterReturning メソッドが正常終了した時だけ、AOPの処理を実行します
Around メソッド実行の前後に、AOPの処理を実行します
AfterThrowing メソッドが異常終了した場合だけ、AOPの処理を実行

