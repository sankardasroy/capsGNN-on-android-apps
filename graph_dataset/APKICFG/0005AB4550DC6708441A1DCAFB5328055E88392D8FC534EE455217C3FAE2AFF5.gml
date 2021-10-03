graph [
  directed 1
  label ""
  node [
    id 0
    label "#L3ce564_Landroid/net/Uri;.getEncodedPath:()Ljava/lang/String;"
  ]
  node [
    id 1
    label "#L3ce570_Ljava/lang/String;.startsWith:(Ljava/lang/String;)Z"
  ]
  node [
    id 2
    label "#L3ce57e_Ljava/lang/String;.substring:(I)Ljava/lang/String;"
  ]
  node [
    id 3
    label "#L3ce44e_Ljava/lang/String;.split:(Ljava/lang/String;)[Ljava/lang/String;"
  ]
  node [
    id 4
    label "#L3ce46c_Ljava/lang/Long;.parseLong:(Ljava/lang/String;)J"
  ]
  node [
    id 5
    label "#L3ce47e_Ljava/lang/Long;.parseLong:(Ljava/lang/String;)J"
  ]
  node [
    id 6
    label "#L3ce49c_Ljava/lang/StringBuilder;.<init>:()V"
  ]
  node [
    id 7
    label "#L3ce4a2_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;"
  ]
  node [
    id 8
    label "#L3ce4ae_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;"
  ]
  node [
    id 9
    label "#L3ce4ba_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;"
  ]
  node [
    id 10
    label "#L3ce4c2_Ljava/lang/StringBuilder;.toString:()Ljava/lang/String;"
  ]
  node [
    id 11
    label "#L3ce4d4_Ljava/io/File;.<init>:(Ljava/lang/String;)V"
  ]
  node [
    id 12
    label "#L3ce4de_Landroid/os/ParcelFileDescriptor;.open:(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;"
  ]
  node [
    id 13
    label "#L3ce4ea_Landroid/content/res/AssetFileDescriptor;.<init>:(Landroid/os/ParcelFileDescriptor;JJ)V"
  ]
  node [
    id 14
    label "#L3ce4fa_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  node [
    id 15
    label "#L3ce5ac_Landroid/content/res/AssetFileDescriptor;.getParcelFileDescriptor:()Landroid/os/ParcelFileDescriptor;"
  ]
  node [
    id 16
    label "#L3ce564_Landroid/net/Uri?;.getEncodedPath:()Ljava/lang/String;"
  ]
  node [
    id 17
    label "#L3ce41c_Landroid/content/ContentProvider;.<init>:()V"
  ]
  node [
    id 18
    label "#L3ce3d8_Ljava/lang/StringBuilder;.<init>:()V"
  ]
  node [
    id 19
    label "#L3ce3e2_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;"
  ]
  node [
    id 20
    label "#L3ce3ee_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;"
  ]
  node [
    id 21
    label "#L3ce3f6_Ljava/lang/StringBuilder;.toString:()Ljava/lang/String;"
  ]
  node [
    id 22
    label "#L3ce3fe_Landroid/net/Uri;.parse:(Ljava/lang/String;)Landroid/net/Uri;"
  ]
  edge [
    source 0
    target 1
    id "#L3ce564_Landroid/net/Uri;.getEncodedPath:()Ljava/lang/String;-#L3ce570_Ljava/lang/String;.startsWith:(Ljava/lang/String;)Z"
  ]
  edge [
    source 1
    target 2
    id "#L3ce570_Ljava/lang/String;.startsWith:(Ljava/lang/String;)Z-#L3ce57e_Ljava/lang/String;.substring:(I)Ljava/lang/String;"
  ]
  edge [
    source 1
    target 3
    id "#L3ce570_Ljava/lang/String;.startsWith:(Ljava/lang/String;)Z-#L3ce44e_Ljava/lang/String;.split:(Ljava/lang/String;)[Ljava/lang/String;"
  ]
  edge [
    source 2
    target 3
    id "#L3ce57e_Ljava/lang/String;.substring:(I)Ljava/lang/String;-#L3ce44e_Ljava/lang/String;.split:(Ljava/lang/String;)[Ljava/lang/String;"
  ]
  edge [
    source 3
    target 14
    id "#L3ce44e_Ljava/lang/String;.split:(Ljava/lang/String;)[Ljava/lang/String;-#L3ce4fa_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 3
    target 4
    id "#L3ce44e_Ljava/lang/String;.split:(Ljava/lang/String;)[Ljava/lang/String;-#L3ce46c_Ljava/lang/Long;.parseLong:(Ljava/lang/String;)J"
  ]
  edge [
    source 3
    target 15
    id "#L3ce44e_Ljava/lang/String;.split:(Ljava/lang/String;)[Ljava/lang/String;-#L3ce5ac_Landroid/content/res/AssetFileDescriptor;.getParcelFileDescriptor:()Landroid/os/ParcelFileDescriptor;"
  ]
  edge [
    source 4
    target 14
    id "#L3ce46c_Ljava/lang/Long;.parseLong:(Ljava/lang/String;)J-#L3ce4fa_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 4
    target 5
    id "#L3ce46c_Ljava/lang/Long;.parseLong:(Ljava/lang/String;)J-#L3ce47e_Ljava/lang/Long;.parseLong:(Ljava/lang/String;)J"
  ]
  edge [
    source 4
    target 15
    id "#L3ce46c_Ljava/lang/Long;.parseLong:(Ljava/lang/String;)J-#L3ce5ac_Landroid/content/res/AssetFileDescriptor;.getParcelFileDescriptor:()Landroid/os/ParcelFileDescriptor;"
  ]
  edge [
    source 5
    target 14
    id "#L3ce47e_Ljava/lang/Long;.parseLong:(Ljava/lang/String;)J-#L3ce4fa_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 5
    target 15
    id "#L3ce47e_Ljava/lang/Long;.parseLong:(Ljava/lang/String;)J-#L3ce5ac_Landroid/content/res/AssetFileDescriptor;.getParcelFileDescriptor:()Landroid/os/ParcelFileDescriptor;"
  ]
  edge [
    source 5
    target 11
    id "#L3ce47e_Ljava/lang/Long;.parseLong:(Ljava/lang/String;)J-#L3ce4d4_Ljava/io/File;.<init>:(Ljava/lang/String;)V"
  ]
  edge [
    source 5
    target 6
    id "#L3ce47e_Ljava/lang/Long;.parseLong:(Ljava/lang/String;)J-#L3ce49c_Ljava/lang/StringBuilder;.<init>:()V"
  ]
  edge [
    source 6
    target 7
    id "#L3ce49c_Ljava/lang/StringBuilder;.<init>:()V-#L3ce4a2_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;"
  ]
  edge [
    source 6
    target 14
    id "#L3ce49c_Ljava/lang/StringBuilder;.<init>:()V-#L3ce4fa_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 6
    target 15
    id "#L3ce49c_Ljava/lang/StringBuilder;.<init>:()V-#L3ce5ac_Landroid/content/res/AssetFileDescriptor;.getParcelFileDescriptor:()Landroid/os/ParcelFileDescriptor;"
  ]
  edge [
    source 7
    target 14
    id "#L3ce4a2_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;-#L3ce4fa_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 7
    target 8
    id "#L3ce4a2_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;-#L3ce4ae_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;"
  ]
  edge [
    source 7
    target 15
    id "#L3ce4a2_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;-#L3ce5ac_Landroid/content/res/AssetFileDescriptor;.getParcelFileDescriptor:()Landroid/os/ParcelFileDescriptor;"
  ]
  edge [
    source 8
    target 14
    id "#L3ce4ae_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;-#L3ce4fa_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 8
    target 9
    id "#L3ce4ae_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;-#L3ce4ba_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;"
  ]
  edge [
    source 8
    target 15
    id "#L3ce4ae_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;-#L3ce5ac_Landroid/content/res/AssetFileDescriptor;.getParcelFileDescriptor:()Landroid/os/ParcelFileDescriptor;"
  ]
  edge [
    source 9
    target 10
    id "#L3ce4ba_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;-#L3ce4c2_Ljava/lang/StringBuilder;.toString:()Ljava/lang/String;"
  ]
  edge [
    source 9
    target 14
    id "#L3ce4ba_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;-#L3ce4fa_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 9
    target 15
    id "#L3ce4ba_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;-#L3ce5ac_Landroid/content/res/AssetFileDescriptor;.getParcelFileDescriptor:()Landroid/os/ParcelFileDescriptor;"
  ]
  edge [
    source 10
    target 14
    id "#L3ce4c2_Ljava/lang/StringBuilder;.toString:()Ljava/lang/String;-#L3ce4fa_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 10
    target 6
    id "#L3ce4c2_Ljava/lang/StringBuilder;.toString:()Ljava/lang/String;-#L3ce49c_Ljava/lang/StringBuilder;.<init>:()V"
  ]
  edge [
    source 10
    target 11
    id "#L3ce4c2_Ljava/lang/StringBuilder;.toString:()Ljava/lang/String;-#L3ce4d4_Ljava/io/File;.<init>:(Ljava/lang/String;)V"
  ]
  edge [
    source 10
    target 15
    id "#L3ce4c2_Ljava/lang/StringBuilder;.toString:()Ljava/lang/String;-#L3ce5ac_Landroid/content/res/AssetFileDescriptor;.getParcelFileDescriptor:()Landroid/os/ParcelFileDescriptor;"
  ]
  edge [
    source 11
    target 12
    id "#L3ce4d4_Ljava/io/File;.<init>:(Ljava/lang/String;)V-#L3ce4de_Landroid/os/ParcelFileDescriptor;.open:(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;"
  ]
  edge [
    source 11
    target 14
    id "#L3ce4d4_Ljava/io/File;.<init>:(Ljava/lang/String;)V-#L3ce4fa_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 11
    target 15
    id "#L3ce4d4_Ljava/io/File;.<init>:(Ljava/lang/String;)V-#L3ce5ac_Landroid/content/res/AssetFileDescriptor;.getParcelFileDescriptor:()Landroid/os/ParcelFileDescriptor;"
  ]
  edge [
    source 12
    target 14
    id "#L3ce4de_Landroid/os/ParcelFileDescriptor;.open:(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;-#L3ce4fa_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 12
    target 13
    id "#L3ce4de_Landroid/os/ParcelFileDescriptor;.open:(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;-#L3ce4ea_Landroid/content/res/AssetFileDescriptor;.<init>:(Landroid/os/ParcelFileDescriptor;JJ)V"
  ]
  edge [
    source 12
    target 15
    id "#L3ce4de_Landroid/os/ParcelFileDescriptor;.open:(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;-#L3ce5ac_Landroid/content/res/AssetFileDescriptor;.getParcelFileDescriptor:()Landroid/os/ParcelFileDescriptor;"
  ]
  edge [
    source 13
    target 14
    id "#L3ce4ea_Landroid/content/res/AssetFileDescriptor;.<init>:(Landroid/os/ParcelFileDescriptor;JJ)V-#L3ce4fa_Ljava/lang/Throwable;.printStackTrace:()V"
  ]
  edge [
    source 13
    target 15
    id "#L3ce4ea_Landroid/content/res/AssetFileDescriptor;.<init>:(Landroid/os/ParcelFileDescriptor;JJ)V-#L3ce5ac_Landroid/content/res/AssetFileDescriptor;.getParcelFileDescriptor:()Landroid/os/ParcelFileDescriptor;"
  ]
  edge [
    source 14
    target 15
    id "#L3ce4fa_Ljava/lang/Throwable;.printStackTrace:()V-#L3ce5ac_Landroid/content/res/AssetFileDescriptor;.getParcelFileDescriptor:()Landroid/os/ParcelFileDescriptor;"
  ]
  edge [
    source 16
    target 1
    id "#L3ce564_Landroid/net/Uri?;.getEncodedPath:()Ljava/lang/String;-#L3ce570_Ljava/lang/String;.startsWith:(Ljava/lang/String;)Z"
  ]
  edge [
    source 18
    target 19
    id "#L3ce3d8_Ljava/lang/StringBuilder;.<init>:()V-#L3ce3e2_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;"
  ]
  edge [
    source 19
    target 20
    id "#L3ce3e2_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;-#L3ce3ee_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;"
  ]
  edge [
    source 20
    target 21
    id "#L3ce3ee_Ljava/lang/StringBuilder;.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;-#L3ce3f6_Ljava/lang/StringBuilder;.toString:()Ljava/lang/String;"
  ]
  edge [
    source 21
    target 22
    id "#L3ce3f6_Ljava/lang/StringBuilder;.toString:()Ljava/lang/String;-#L3ce3fe_Landroid/net/Uri;.parse:(Ljava/lang/String;)Landroid/net/Uri;"
  ]
]
