.class public final Lcom/example/targetapp/NetworkModule;
.super Ljava/lang/Object;
.source "NetworkModule.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\"\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0012\u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u000c\u0012\u0004\u0012\u00020\u00070\u000bR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/example/targetapp/NetworkModule;",
        "",
        "certificate",
        "Ljava/security/cert/X509Certificate;",
        "<init>",
        "(Ljava/security/cert/X509Certificate;)V",
        "makePinnedRequest",
        "",
        "wrongPin",
        "",
        "onResult",
        "Lkotlin/Function1;",
        "",
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


# instance fields
.field private final certificate:Ljava/security/cert/X509Certificate;


# direct methods
.method public constructor <init>(Ljava/security/cert/X509Certificate;)V
    .locals 1
    .param p1, "certificate"    # Ljava/security/cert/X509Certificate;

    const-string v0, "certificate"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/targetapp/NetworkModule;->certificate:Ljava/security/cert/X509Certificate;

    return-void
.end method

.method static final makePinnedRequest$lambda$1(ZLcom/example/targetapp/NetworkModule;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .locals 10
    .param p0, "$wrongPin"    # Z
    .param p1, "this$0"    # Lcom/example/targetapp/NetworkModule;
    .param p2, "$id"    # Ljava/lang/String;
    .param p3, "$onResult"    # Lkotlin/jvm/functions/Function1;

    .line 18
    const-string v0, "\n"

    if-eqz p0, :cond_0

    .line 19
    const-string v1, "sha256/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="

    goto :goto_0

    .line 21
    :cond_0
    sget-object v1, Lokhttp3/CertificatePinner;->Companion:Lokhttp3/CertificatePinner$Companion;

    iget-object v2, p1, Lcom/example/targetapp/NetworkModule;->certificate:Ljava/security/cert/X509Certificate;

    check-cast v2, Ljava/security/cert/Certificate;

    invoke-virtual {v1, v2}, Lokhttp3/CertificatePinner$Companion;->pin(Ljava/security/cert/Certificate;)Ljava/lang/String;

    move-result-object v1

    .line 18
    :goto_0
    nop

    .line 23
    .local v1, "pin":Ljava/lang/String;
    new-instance v2, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v2}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    .line 24
    new-instance v3, Lokhttp3/CertificatePinner$Builder;

    invoke-direct {v3}, Lokhttp3/CertificatePinner$Builder;-><init>()V

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    const-string v6, "localhost"

    invoke-virtual {v3, v6, v4}, Lokhttp3/CertificatePinner$Builder;->add(Ljava/lang/String;[Ljava/lang/String;)Lokhttp3/CertificatePinner$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/CertificatePinner$Builder;->build()Lokhttp3/CertificatePinner;

    move-result-object v3

    invoke-virtual {v2, v3}, Lokhttp3/OkHttpClient$Builder;->certificatePinner(Lokhttp3/CertificatePinner;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v2

    .line 25
    invoke-virtual {v2, v5}, Lokhttp3/OkHttpClient$Builder;->followRedirects(Z)Lokhttp3/OkHttpClient$Builder;

    move-result-object v2

    .line 26
    invoke-virtual {v2}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v2

    .line 23
    nop

    .line 27
    .local v2, "client":Lokhttp3/OkHttpClient;
    new-instance v3, Lokhttp3/Request$Builder;

    invoke-direct {v3}, Lokhttp3/Request$Builder;-><init>()V

    const-string v4, "https://localhost:8443/probe"

    invoke-virtual {v3, v4}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v3

    .line 28
    const-string v4, "X-Lab-Request"

    invoke-virtual {v3, v4, p2}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v3

    .line 27
    nop

    .line 29
    .local v3, "request":Lokhttp3/Request;
    nop

    .line 30
    :try_start_0
    invoke-virtual {v2, v3}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v4

    invoke-interface {v4}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v4

    check-cast v4, Ljava/io/Closeable;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    move-object v5, v4

    check-cast v5, Lokhttp3/Response;

    .local v5, "response\\1":Lokhttp3/Response;
    const/4 v6, 0x0

    .line 31
    .local v6, "$i$a$-use-NetworkModule$makePinnedRequest$1$result$1\\1\\30\\0":I
    nop

    .line 32
    invoke-virtual {v5}, Lokhttp3/Response;->isSuccessful()Z

    move-result v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string v8, "HTTP "

    if-nez v7, :cond_1

    :try_start_2
    invoke-virtual {v5}, Lokhttp3/Response;->code()I

    move-result v7

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_1

    .line 33
    :cond_1
    invoke-virtual {v5}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v7

    invoke-virtual {v7}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, p2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    invoke-virtual {v5}, Lokhttp3/Response;->code()I

    move-result v7

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", sai m\u00e3 ph\u1ea3n h\u1ed3i"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_1

    .line 34
    :cond_2
    invoke-virtual {v5}, Lokhttp3/Response;->code()I

    move-result v7

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", m\u00e1y ch\u1ee7 \u0111\u00e3 x\u00e1c nh\u1eadn m\u00e3"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 35
    :goto_1
    nop

    .line 30
    .end local v5    # "response\\1":Lokhttp3/Response;
    .end local v6    # "$i$a$-use-NetworkModule$makePinnedRequest$1$result$1\\1\\30\\0":I
    const/4 v5, 0x0

    :try_start_3
    invoke-static {v4, v5}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_3

    :catchall_0
    move-exception v5

    .end local v1    # "pin":Ljava/lang/String;
    .end local v2    # "client":Lokhttp3/OkHttpClient;
    .end local v3    # "request":Lokhttp3/Request;
    .end local p0    # "$wrongPin":Z
    .end local p1    # "this$0":Lcom/example/targetapp/NetworkModule;
    .end local p2    # "$id":Ljava/lang/String;
    .end local p3    # "$onResult":Lkotlin/jvm/functions/Function1;
    :try_start_4
    throw v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .restart local v1    # "pin":Ljava/lang/String;
    .restart local v2    # "client":Lokhttp3/OkHttpClient;
    .restart local v3    # "request":Lokhttp3/Request;
    .restart local p0    # "$wrongPin":Z
    .restart local p1    # "this$0":Lcom/example/targetapp/NetworkModule;
    .restart local p2    # "$id":Ljava/lang/String;
    .restart local p3    # "$onResult":Lkotlin/jvm/functions/Function1;
    :catchall_1
    move-exception v6

    :try_start_5
    invoke-static {v4, v5}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .end local v1    # "pin":Ljava/lang/String;
    .end local v2    # "client":Lokhttp3/OkHttpClient;
    .end local v3    # "request":Lokhttp3/Request;
    .end local p0    # "$wrongPin":Z
    .end local p1    # "this$0":Lcom/example/targetapp/NetworkModule;
    .end local p2    # "$id":Ljava/lang/String;
    .end local p3    # "$onResult":Lkotlin/jvm/functions/Function1;
    throw v6
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 37
    .restart local v1    # "pin":Ljava/lang/String;
    .restart local v2    # "client":Lokhttp3/OkHttpClient;
    .restart local v3    # "request":Lokhttp3/Request;
    .restart local p0    # "$wrongPin":Z
    .restart local p1    # "this$0":Lcom/example/targetapp/NetworkModule;
    .restart local p2    # "$id":Ljava/lang/String;
    .restart local p3    # "$onResult":Lkotlin/jvm/functions/Function1;
    :catch_0
    move-exception v4

    .line 38
    .local v4, "e":Ljava/io/IOException;
    nop

    .line 39
    instance-of v5, v4, Ljavax/net/ssl/SSLPeerUnverifiedException;

    if-eqz v5, :cond_3

    const-string v5, "X\u00e1c minh m\u00e1y ch\u1ee7 ho\u1eb7c pin"

    goto :goto_2

    .line 40
    :cond_3
    instance-of v5, v4, Ljavax/net/ssl/SSLException;

    if-eqz v5, :cond_4

    const-string v5, "TLS"

    goto :goto_2

    .line 41
    :cond_4
    instance-of v5, v4, Ljava/net/UnknownHostException;

    if-eqz v5, :cond_5

    const-string v5, "DNS"

    goto :goto_2

    .line 42
    :cond_5
    instance-of v5, v4, Ljava/net/SocketTimeoutException;

    if-eqz v5, :cond_6

    const-string v5, "H\u1ebft th\u1eddi gian ch\u1edd"

    goto :goto_2

    .line 43
    :cond_6
    const-string v5, "K\u1ebft n\u1ed1i ho\u1eb7c \u0111\u1ecdc d\u1eef li\u1ec7u"

    .line 38
    :goto_2
    nop

    .line 45
    .local v5, "kind":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_7

    const-string v7, ""

    :cond_7
    const/16 v8, 0x15e

    invoke-static {v7, v8}, Lkotlin/text/StringsKt;->take(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " \u00b7 "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 29
    .end local v4    # "e":Ljava/io/IOException;
    .end local v5    # "kind":Ljava/lang/String;
    :goto_3
    nop

    .line 47
    .local v7, "result":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ID "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    return-void
.end method


# virtual methods
.method public final makePinnedRequest(ZLkotlin/jvm/functions/Function1;)V
    .locals 3
    .param p1, "wrongPin"    # Z
    .param p2, "onResult"    # Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Ljava/lang/String;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "onResult"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "toString(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 17
    .local v0, "id":Ljava/lang/String;
    new-instance v1, Ljava/lang/Thread;

    .line 48
    new-instance v2, Lcom/example/targetapp/NetworkModule$$ExternalSyntheticLambda0;

    invoke-direct {v2, p1, p0, v0, p2}, Lcom/example/targetapp/NetworkModule$$ExternalSyntheticLambda0;-><init>(ZLcom/example/targetapp/NetworkModule;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    .line 17
    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 48
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 49
    return-void
.end method
