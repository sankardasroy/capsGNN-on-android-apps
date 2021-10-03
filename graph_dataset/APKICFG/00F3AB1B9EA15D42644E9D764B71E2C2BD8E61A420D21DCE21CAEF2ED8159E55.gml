graph [
  directed 1
  label ""
  node [
    id 0
    label "#L003aee_Ljava/lang/Class;.getName:()Ljava/lang/String;"
  ]
  node [
    id 1
    label "#L003af6_Ljava/lang/ClassLoader;.loadClass:(Ljava/lang/String;)Ljava/lang/Class;"
  ]
  node [
    id 2
    label "#L003afe_Ljava/lang/Class;.newInstance:()Ljava/lang/Object;"
  ]
  node [
    id 3
    label "#L003b2c_Landroid/content/BroadcastReceiver;.onReceive:(Landroid/content/Context;Landroid/content/Intent;)V"
  ]
  node [
    id 4
    label "#L003b48_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  node [
    id 5
    label "#L0043ac_Ljava/lang/Object;.<init>:()V"
  ]
  node [
    id 6
    label "#L003aac_Landroid/content/BroadcastReceiver;.<init>:()V"
  ]
  node [
    id 7
    label "#L003ff4_Landroid/content/ContentProvider?;.getClass:()Ljava/lang/Class;"
  ]
  node [
    id 8
    label "#L004000_Ljava/lang/Class;.getMethod:(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;"
  ]
  node [
    id 9
    label "#L004022_Ljava/lang/reflect/Method;.invoke:(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;"
  ]
  node [
    id 10
    label "#L003ec8_Landroid/content/ContentProvider;.getType:(Landroid/net/Uri;)Ljava/lang/String;"
  ]
  node [
    id 11
    label "#L003f6c_Landroid/content/ContentProvider?;.getClass:()Ljava/lang/Class;"
  ]
  node [
    id 12
    label "#L003f78_Ljava/lang/Class;.getMethod:(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;"
  ]
  node [
    id 13
    label "#L003f9a_Ljava/lang/reflect/Method;.invoke:(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;"
  ]
  node [
    id 14
    label "#L004086_Landroid/content/ContentProvider?;.getClass:()Ljava/lang/Class;"
  ]
  node [
    id 15
    label "#L004092_Ljava/lang/Class;.getMethod:(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;"
  ]
  node [
    id 16
    label "#L0040ba_Ljava/lang/reflect/Method;.invoke:(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;"
  ]
  node [
    id 17
    label "#L003ef4_Landroid/content/ContentProvider;.insert:(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;"
  ]
  node [
    id 18
    label "#L003de4_Landroid/content/ContentProvider;.<init>:()V"
  ]
  node [
    id 19
    label "#L003e58_Landroid/content/ContentProvider?;.getClass:()Ljava/lang/Class;"
  ]
  node [
    id 20
    label "#L003e64_Ljava/lang/Class;.getMethod:(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;"
  ]
  node [
    id 21
    label "#L003e86_Ljava/lang/reflect/Method;.invoke:(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;"
  ]
  node [
    id 22
    label "#L00412c_Landroid/content/ContentProvider;.update:(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I"
  ]
  node [
    id 23
    label "#L004102_Landroid/content/ContentProvider;.query:(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;"
  ]
  node [
    id 24
    label "#L003f20_Landroid/content/ContentProvider;.onCreate:()Z"
  ]
  node [
    id 25
    label "#L003e10_Landroid/content/ContentProvider;.delete:(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I"
  ]
  node [
    id 26
    label "#L00418e_Ljava/lang/Class;.getName:()Ljava/lang/String;"
  ]
  node [
    id 27
    label "#L004196_Ljava/lang/ClassLoader;.loadClass:(Ljava/lang/String;)Ljava/lang/Class;"
  ]
  node [
    id 28
    label "#L00419e_Ljava/lang/Class;.newInstance:()Ljava/lang/Object;"
  ]
  node [
    id 29
    label "#L0041cc_Landroid/content/BroadcastReceiver;.onReceive:(Landroid/content/Context;Landroid/content/Intent;)V"
  ]
  node [
    id 30
    label "#L0041e8_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  node [
    id 31
    label "#L00414c_Landroid/content/BroadcastReceiver;.<init>:()V"
  ]
  edge [
    source 0
    target 1
    id "#L003aee_Ljava/lang/Class;.getName:()Ljava/lang/String;-#L003af6_Ljava/lang/ClassLoader;.loadClass:(Ljava/lang/String;)Ljava/lang/Class;"
  ]
  edge [
    source 0
    target 4
    id "#L003aee_Ljava/lang/Class;.getName:()Ljava/lang/String;-#L003b48_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 1
    target 2
    id "#L003af6_Ljava/lang/ClassLoader;.loadClass:(Ljava/lang/String;)Ljava/lang/Class;-#L003afe_Ljava/lang/Class;.newInstance:()Ljava/lang/Object;"
  ]
  edge [
    source 1
    target 4
    id "#L003af6_Ljava/lang/ClassLoader;.loadClass:(Ljava/lang/String;)Ljava/lang/Class;-#L003b48_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 2
    target 4
    id "#L003afe_Ljava/lang/Class;.newInstance:()Ljava/lang/Object;-#L003b48_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 2
    target 3
    id "#L003afe_Ljava/lang/Class;.newInstance:()Ljava/lang/Object;-#L003b2c_Landroid/content/BroadcastReceiver;.onReceive:(Landroid/content/Context;Landroid/content/Intent;)V"
  ]
  edge [
    source 2
    target 5
    id "#L003afe_Ljava/lang/Class;.newInstance:()Ljava/lang/Object;-#L0043ac_Ljava/lang/Object;.<init>:()V"
  ]
  edge [
    source 3
    target 5
    id "#L003b2c_Landroid/content/BroadcastReceiver;.onReceive:(Landroid/content/Context;Landroid/content/Intent;)V-#L0043ac_Ljava/lang/Object;.<init>:()V"
  ]
  edge [
    source 4
    target 4
    id "#L003b48_Ljava/lang/Throwable;.printStackTrace:()V-#L003b48_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 4
    target 3
    id "#L003b48_Ljava/lang/Throwable;.printStackTrace:()V-#L003b2c_Landroid/content/BroadcastReceiver;.onReceive:(Landroid/content/Context;Landroid/content/Intent;)V"
  ]
  edge [
    source 4
    target 5
    id "#L003b48_Ljava/lang/Throwable;.printStackTrace:()V-#L0043ac_Ljava/lang/Object;.<init>:()V"
  ]
  edge [
    source 5
    target 3
    id "#L0043ac_Ljava/lang/Object;.<init>:()V-#L003b2c_Landroid/content/BroadcastReceiver;.onReceive:(Landroid/content/Context;Landroid/content/Intent;)V"
  ]
  edge [
    source 5
    target 29
    id "#L0043ac_Ljava/lang/Object;.<init>:()V-#L0041cc_Landroid/content/BroadcastReceiver;.onReceive:(Landroid/content/Context;Landroid/content/Intent;)V"
  ]
  edge [
    source 7
    target 8
    id "#L003ff4_Landroid/content/ContentProvider?;.getClass:()Ljava/lang/Class;-#L004000_Ljava/lang/Class;.getMethod:(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;"
  ]
  edge [
    source 8
    target 9
    id "#L004000_Ljava/lang/Class;.getMethod:(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;-#L004022_Ljava/lang/reflect/Method;.invoke:(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;"
  ]
  edge [
    source 11
    target 12
    id "#L003f6c_Landroid/content/ContentProvider?;.getClass:()Ljava/lang/Class;-#L003f78_Ljava/lang/Class;.getMethod:(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;"
  ]
  edge [
    source 12
    target 13
    id "#L003f78_Ljava/lang/Class;.getMethod:(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;-#L003f9a_Ljava/lang/reflect/Method;.invoke:(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;"
  ]
  edge [
    source 14
    target 15
    id "#L004086_Landroid/content/ContentProvider?;.getClass:()Ljava/lang/Class;-#L004092_Ljava/lang/Class;.getMethod:(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;"
  ]
  edge [
    source 15
    target 16
    id "#L004092_Ljava/lang/Class;.getMethod:(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;-#L0040ba_Ljava/lang/reflect/Method;.invoke:(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;"
  ]
  edge [
    source 19
    target 20
    id "#L003e58_Landroid/content/ContentProvider?;.getClass:()Ljava/lang/Class;-#L003e64_Ljava/lang/Class;.getMethod:(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;"
  ]
  edge [
    source 20
    target 21
    id "#L003e64_Ljava/lang/Class;.getMethod:(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;-#L003e86_Ljava/lang/reflect/Method;.invoke:(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;"
  ]
  edge [
    source 26
    target 27
    id "#L00418e_Ljava/lang/Class;.getName:()Ljava/lang/String;-#L004196_Ljava/lang/ClassLoader;.loadClass:(Ljava/lang/String;)Ljava/lang/Class;"
  ]
  edge [
    source 26
    target 30
    id "#L00418e_Ljava/lang/Class;.getName:()Ljava/lang/String;-#L0041e8_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 27
    target 28
    id "#L004196_Ljava/lang/ClassLoader;.loadClass:(Ljava/lang/String;)Ljava/lang/Class;-#L00419e_Ljava/lang/Class;.newInstance:()Ljava/lang/Object;"
  ]
  edge [
    source 27
    target 30
    id "#L004196_Ljava/lang/ClassLoader;.loadClass:(Ljava/lang/String;)Ljava/lang/Class;-#L0041e8_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 28
    target 30
    id "#L00419e_Ljava/lang/Class;.newInstance:()Ljava/lang/Object;-#L0041e8_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 28
    target 5
    id "#L00419e_Ljava/lang/Class;.newInstance:()Ljava/lang/Object;-#L0043ac_Ljava/lang/Object;.<init>:()V"
  ]
  edge [
    source 28
    target 29
    id "#L00419e_Ljava/lang/Class;.newInstance:()Ljava/lang/Object;-#L0041cc_Landroid/content/BroadcastReceiver;.onReceive:(Landroid/content/Context;Landroid/content/Intent;)V"
  ]
  edge [
    source 29
    target 5
    id "#L0041cc_Landroid/content/BroadcastReceiver;.onReceive:(Landroid/content/Context;Landroid/content/Intent;)V-#L0043ac_Ljava/lang/Object;.<init>:()V"
  ]
  edge [
    source 30
    target 5
    id "#L0041e8_Ljava/lang/Throwable;.printStackTrace:()V-#L0043ac_Ljava/lang/Object;.<init>:()V"
  ]
  edge [
    source 30
    target 30
    id "#L0041e8_Ljava/lang/Throwable;.printStackTrace:()V-#L0041e8_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 30
    target 29
    id "#L0041e8_Ljava/lang/Throwable;.printStackTrace:()V-#L0041cc_Landroid/content/BroadcastReceiver;.onReceive:(Landroid/content/Context;Landroid/content/Intent;)V"
  ]
]
