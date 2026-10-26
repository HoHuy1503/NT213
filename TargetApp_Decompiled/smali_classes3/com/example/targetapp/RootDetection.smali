.class public final Lcom/example/targetapp/RootDetection;
.super Ljava/lang/Object;
.source "RootDetection.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nRootDetection.kt\nKotlin\n*S Kotlin\n*F\n+ 1 RootDetection.kt\ncom/example/targetapp/RootDetection\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n*L\n1#1,47:1\n12970#2,2:48\n*S KotlinDebug\n*F\n+ 1 RootDetection.kt\ncom/example/targetapp/RootDetection\n*L\n20#1:48,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0006\u0010\u0004\u001a\u00020\u0005J\u0006\u0010\u0006\u001a\u00020\u0005J\u0006\u0010\u0007\u001a\u00020\u0005J\u0006\u0010\u0008\u001a\u00020\u0005\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/example/targetapp/RootDetection;",
        "",
        "<init>",
        "()V",
        "checkSuPaths",
        "",
        "checkBuildTags",
        "checkSuCommand",
        "isDeviceRooted",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/example/targetapp/RootDetection;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/example/targetapp/RootDetection;

    invoke-direct {v0}, Lcom/example/targetapp/RootDetection;-><init>()V

    sput-object v0, Lcom/example/targetapp/RootDetection;->INSTANCE:Lcom/example/targetapp/RootDetection;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final checkBuildTags()Z
    .locals 6

    .line 25
    sget-object v0, Landroid/os/Build;->TAGS:Ljava/lang/String;

    .line 26
    .local v0, "buildTags":Ljava/lang/String;
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    move-object v2, v0

    check-cast v2, Ljava/lang/CharSequence;

    const-string v3, "test-keys"

    check-cast v3, Ljava/lang/CharSequence;

    const/4 v4, 0x2

    const/4 v5, 0x0

    invoke-static {v2, v3, v1, v4, v5}, Lkotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public final checkSuCommand()Z
    .locals 6

    .line 31
    const/4 v0, 0x0

    .line 32
    .local v0, "process":Ljava/lang/Process;
    nop

    .line 33
    const/4 v1, 0x0

    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "/system/xbin/which"

    aput-object v4, v3, v1

    const-string v4, "su"

    const/4 v5, 0x1

    aput-object v4, v3, v5

    invoke-virtual {v2, v3}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v2

    move-object v0, v2

    .line 34
    invoke-virtual {v0}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    const-string v3, "getInputStream(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v3, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, v2, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    check-cast v4, Ljava/io/Reader;

    instance-of v2, v4, Ljava/io/BufferedReader;

    if-eqz v2, :cond_0

    check-cast v4, Ljava/io/BufferedReader;

    goto :goto_0

    :cond_0
    new-instance v2, Ljava/io/BufferedReader;

    const/16 v3, 0x2000

    invoke-direct {v2, v4, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    move-object v4, v2

    .line 35
    .local v4, "reader":Ljava/io/BufferedReader;
    :goto_0
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_1

    move v1, v5

    .line 39
    .end local v4    # "reader":Ljava/io/BufferedReader;
    :cond_1
    if-eqz v0, :cond_3

    goto :goto_1

    :catchall_0
    move-exception v1

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/Process;->destroy()V

    :cond_2
    throw v1

    .line 36
    :catch_0
    move-exception v2

    .line 37
    .local v2, "e":Ljava/lang/Exception;
    nop

    .line 39
    .end local v2    # "e":Ljava/lang/Exception;
    if-eqz v0, :cond_3

    :goto_1
    invoke-virtual {v0}, Ljava/lang/Process;->destroy()V

    .line 40
    :cond_3
    nop

    .line 32
    return v1
.end method

.method public final checkSuPaths()Z
    .locals 11

    .line 10
    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "/system/app/Superuser.apk"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 11
    const-string v1, "/sbin/su"

    const/4 v3, 0x1

    aput-object v1, v0, v3

    .line 10
    nop

    .line 12
    const-string v1, "/system/bin/su"

    const/4 v4, 0x2

    aput-object v1, v0, v4

    .line 10
    nop

    .line 13
    const-string v1, "/system/xbin/su"

    const/4 v4, 0x3

    aput-object v1, v0, v4

    .line 10
    nop

    .line 14
    const-string v1, "/data/local/x/su"

    const/4 v4, 0x4

    aput-object v1, v0, v4

    .line 10
    nop

    .line 15
    const-string v1, "/data/local/bin/su"

    const/4 v4, 0x5

    aput-object v1, v0, v4

    .line 10
    nop

    .line 16
    const-string v1, "/system/sd/xbin/su"

    const/4 v4, 0x6

    aput-object v1, v0, v4

    .line 10
    nop

    .line 17
    const-string v1, "/system/bin/failsafe/su"

    const/4 v4, 0x7

    aput-object v1, v0, v4

    .line 10
    nop

    .line 18
    const-string v1, "/data/local/su"

    const/16 v4, 0x8

    aput-object v1, v0, v4

    .line 10
    nop

    .line 9
    nop

    .line 20
    .local v0, "paths":[Ljava/lang/String;
    move-object v1, v0

    .local v1, "$this$any\\1":[Ljava/lang/Object;
    const/4 v4, 0x0

    .line 48
    .local v4, "$i$f$any\\1\\20":I
    array-length v5, v1

    move v6, v2

    :goto_0
    if-ge v6, v5, :cond_1

    aget-object v7, v1, v6

    .local v7, "element\\1":Ljava/lang/Object;
    move-object v8, v7

    .local v8, "it\\2":Ljava/lang/String;
    const/4 v9, 0x0

    .line 20
    .local v9, "$i$a$-any-RootDetection$checkSuPaths$1\\2\\48\\0":I
    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v8

    .line 48
    .end local v8    # "it\\2":Ljava/lang/String;
    .end local v9    # "$i$a$-any-RootDetection$checkSuPaths$1\\2\\48\\0":I
    if-eqz v8, :cond_0

    move v2, v3

    goto :goto_1

    .end local v7    # "element\\1":Ljava/lang/Object;
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 49
    :cond_1
    nop

    .line 20
    .end local v1    # "$this$any\\1":[Ljava/lang/Object;
    .end local v4    # "$i$f$any\\1\\20":I
    :goto_1
    return v2
.end method

.method public final isDeviceRooted()Z
    .locals 1
    
    const/4 v0, 0x0
    return v0

    .line 45
    invoke-virtual {p0}, Lcom/example/targetapp/RootDetection;->checkSuPaths()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/example/targetapp/RootDetection;->checkBuildTags()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/example/targetapp/RootDetection;->checkSuCommand()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method
