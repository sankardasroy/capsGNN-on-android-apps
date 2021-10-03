graph [
  directed 1
  label ""
  node [
    id 0
    label "#L005332_Ljava/lang/Class;.getName:()Ljava/lang/String;"
  ]
  node [
    id 1
    label "#L00533a_Ljava/lang/ClassLoader;.loadClass:(Ljava/lang/String;)Ljava/lang/Class;"
  ]
  node [
    id 2
    label "#L005342_Ljava/lang/Class?;.newInstance:()Ljava/lang/Object;"
  ]
  node [
    id 3
    label "#L005370_Landroid/content/BroadcastReceiver;.onReceive:(Landroid/content/Context;Landroid/content/Intent;)V"
  ]
  node [
    id 4
    label "#L00538c_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  node [
    id 5
    label "#L0037e8_Ljava/lang/Object;.<init>:()V"
  ]
  node [
    id 6
    label "#L0052f0_Landroid/content/BroadcastReceiver;.<init>:()V"
  ]
  edge [
    source 0
    target 1
    id "#L005332_Ljava/lang/Class;.getName:()Ljava/lang/String;-#L00533a_Ljava/lang/ClassLoader;.loadClass:(Ljava/lang/String;)Ljava/lang/Class;"
  ]
  edge [
    source 0
    target 4
    id "#L005332_Ljava/lang/Class;.getName:()Ljava/lang/String;-#L00538c_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 1
    target 4
    id "#L00533a_Ljava/lang/ClassLoader;.loadClass:(Ljava/lang/String;)Ljava/lang/Class;-#L00538c_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 1
    target 2
    id "#L00533a_Ljava/lang/ClassLoader;.loadClass:(Ljava/lang/String;)Ljava/lang/Class;-#L005342_Ljava/lang/Class?;.newInstance:()Ljava/lang/Object;"
  ]
  edge [
    source 2
    target 4
    id "#L005342_Ljava/lang/Class?;.newInstance:()Ljava/lang/Object;-#L00538c_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 2
    target 5
    id "#L005342_Ljava/lang/Class?;.newInstance:()Ljava/lang/Object;-#L0037e8_Ljava/lang/Object;.<init>:()V"
  ]
  edge [
    source 2
    target 3
    id "#L005342_Ljava/lang/Class?;.newInstance:()Ljava/lang/Object;-#L005370_Landroid/content/BroadcastReceiver;.onReceive:(Landroid/content/Context;Landroid/content/Intent;)V"
  ]
  edge [
    source 3
    target 5
    id "#L005370_Landroid/content/BroadcastReceiver;.onReceive:(Landroid/content/Context;Landroid/content/Intent;)V-#L0037e8_Ljava/lang/Object;.<init>:()V"
  ]
  edge [
    source 4
    target 4
    id "#L00538c_Ljava/lang/Throwable;.printStackTrace:()V-#L00538c_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 4
    target 5
    id "#L00538c_Ljava/lang/Throwable;.printStackTrace:()V-#L0037e8_Ljava/lang/Object;.<init>:()V"
  ]
  edge [
    source 4
    target 3
    id "#L00538c_Ljava/lang/Throwable;.printStackTrace:()V-#L005370_Landroid/content/BroadcastReceiver;.onReceive:(Landroid/content/Context;Landroid/content/Intent;)V"
  ]
  edge [
    source 5
    target 3
    id "#L0037e8_Ljava/lang/Object;.<init>:()V-#L005370_Landroid/content/BroadcastReceiver;.onReceive:(Landroid/content/Context;Landroid/content/Intent;)V"
  ]
]
