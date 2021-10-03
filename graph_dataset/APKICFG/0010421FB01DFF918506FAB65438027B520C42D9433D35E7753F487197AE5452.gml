graph [
  directed 1
  label ""
  node [
    id 0
    label "#L102e68_Lorg/apache/cordova/CordovaActivity;.<init>:()V"
  ]
  node [
    id 1
    label "#L102ea4_Lorg/apache/cordova/CordovaActivity;.onCreate:(Landroid/os/Bundle;)V"
  ]
  node [
    id 2
    label "#L102ebc_Landroid/os/AsyncTask;.execute:([Ljava/lang/Object;)Landroid/os/AsyncTask;"
  ]
  node [
    id 3
    label "#L102ec2_Landroid/os/AsyncTask;.get:()Ljava/lang/Object;"
  ]
  node [
    id 4
    label "#L102ed6_Ljava/lang/StringBuilder;.<init>:()V"
  ]
  node [
    id 5
    label "#L102ee4_Ljava/lang/StringBuilder;.<init>:()V"
  ]
  node [
    id 6
    label "#L102eee_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;"
  ]
  node [
    id 7
    label "#L102ef6_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;"
  ]
  node [
    id 8
    label "#L102efe_Ljava/lang/StringBuilder;.toString:()Ljava/lang/String;"
  ]
  node [
    id 9
    label "#L102f06_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;"
  ]
  node [
    id 10
    label "#L102f12_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;"
  ]
  node [
    id 11
    label "#L102f1a_Ljava/lang/StringBuilder;.toString:()Ljava/lang/String;"
  ]
  node [
    id 12
    label "#L102f22_Lorg/apache/cordova/CordovaActivity;.loadUrl:(Ljava/lang/String;)V"
  ]
  node [
    id 13
    label "#L102f34_Landroid/util/Log;.d:(Ljava/lang/String;Ljava/lang/String;)I"
  ]
  node [
    id 14
    label "#L102f3a_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  node [
    id 15
    label "#L0cc4e4_Landroid/os/AsyncTask;.<init>:()V"
  ]
  node [
    id 16
    label "#L102e8a_Landroid/app/Activity;.moveTaskToBack:(Z)Z"
  ]
  edge [
    source 1
    target 15
    id "#L102ea4_Lorg/apache/cordova/CordovaActivity;.onCreate:(Landroid/os/Bundle;)V-#L0cc4e4_Landroid/os/AsyncTask;.<init>:()V"
  ]
  edge [
    source 2
    target 3
    id "#L102ebc_Landroid/os/AsyncTask;.execute:([Ljava/lang/Object;)Landroid/os/AsyncTask;-#L102ec2_Landroid/os/AsyncTask;.get:()Ljava/lang/Object;"
  ]
  edge [
    source 3
    target 4
    id "#L102ec2_Landroid/os/AsyncTask;.get:()Ljava/lang/Object;-#L102ed6_Ljava/lang/StringBuilder;.<init>:()V"
  ]
  edge [
    source 3
    target 13
    id "#L102ec2_Landroid/os/AsyncTask;.get:()Ljava/lang/Object;-#L102f34_Landroid/util/Log;.d:(Ljava/lang/String;Ljava/lang/String;)I"
  ]
  edge [
    source 4
    target 9
    id "#L102ed6_Ljava/lang/StringBuilder;.<init>:()V-#L102f06_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;"
  ]
  edge [
    source 4
    target 5
    id "#L102ed6_Ljava/lang/StringBuilder;.<init>:()V-#L102ee4_Ljava/lang/StringBuilder;.<init>:()V"
  ]
  edge [
    source 5
    target 6
    id "#L102ee4_Ljava/lang/StringBuilder;.<init>:()V-#L102eee_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;"
  ]
  edge [
    source 6
    target 7
    id "#L102eee_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;-#L102ef6_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;"
  ]
  edge [
    source 7
    target 8
    id "#L102ef6_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;-#L102efe_Ljava/lang/StringBuilder;.toString:()Ljava/lang/String;"
  ]
  edge [
    source 8
    target 9
    id "#L102efe_Ljava/lang/StringBuilder;.toString:()Ljava/lang/String;-#L102f06_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;"
  ]
  edge [
    source 9
    target 10
    id "#L102f06_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;-#L102f12_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;"
  ]
  edge [
    source 10
    target 11
    id "#L102f12_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;-#L102f1a_Ljava/lang/StringBuilder;.toString:()Ljava/lang/String;"
  ]
  edge [
    source 11
    target 12
    id "#L102f1a_Ljava/lang/StringBuilder;.toString:()Ljava/lang/String;-#L102f22_Lorg/apache/cordova/CordovaActivity;.loadUrl:(Ljava/lang/String;)V"
  ]
  edge [
    source 13
    target 14
    id "#L102f34_Landroid/util/Log;.d:(Ljava/lang/String;Ljava/lang/String;)I-#L102f3a_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 14
    target 4
    id "#L102f3a_Ljava/lang/Throwable;.printStackTrace:()V-#L102ed6_Ljava/lang/StringBuilder;.<init>:()V"
  ]
  edge [
    source 14
    target 13
    id "#L102f3a_Ljava/lang/Throwable;.printStackTrace:()V-#L102f34_Landroid/util/Log;.d:(Ljava/lang/String;Ljava/lang/String;)I"
  ]
  edge [
    source 15
    target 2
    id "#L0cc4e4_Landroid/os/AsyncTask;.<init>:()V-#L102ebc_Landroid/os/AsyncTask;.execute:([Ljava/lang/Object;)Landroid/os/AsyncTask;"
  ]
]
