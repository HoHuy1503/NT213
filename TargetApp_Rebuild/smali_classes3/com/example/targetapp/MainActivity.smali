.class public final Lcom/example/targetapp/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0012\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\rH\u0014R\u001b\u0010\u0004\u001a\u00020\u00058BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u0008\u0010\t\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/example/targetapp/MainActivity;",
        "Landroidx/appcompat/app/AppCompatActivity;",
        "<init>",
        "()V",
        "networkModule",
        "Lcom/example/targetapp/NetworkModule;",
        "getNetworkModule",
        "()Lcom/example/targetapp/NetworkModule;",
        "networkModule$delegate",
        "Lkotlin/Lazy;",
        "onCreate",
        "",
        "savedInstanceState",
        "Landroid/os/Bundle;",
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
.field private final networkModule$delegate:Lkotlin/Lazy;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 9
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 11
    new-instance v0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda5;

    invoke-direct {v0, p0}, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda5;-><init>(Lcom/example/targetapp/MainActivity;)V

    invoke-static {v0}, Lkotlin/LazyKt;->lazy(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    iput-object v0, p0, Lcom/example/targetapp/MainActivity;->networkModule$delegate:Lkotlin/Lazy;

    .line 9
    return-void
.end method

.method private final getNetworkModule()Lcom/example/targetapp/NetworkModule;
    .locals 1

    .line 11
    iget-object v0, p0, Lcom/example/targetapp/MainActivity;->networkModule$delegate:Lkotlin/Lazy;

    invoke-interface {v0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/targetapp/NetworkModule;

    return-object v0
.end method

.method static final networkModule_delegate$lambda$1(Lcom/example/targetapp/MainActivity;)Lcom/example/targetapp/NetworkModule;
    .locals 5
    .param p0, "this$0"    # Lcom/example/targetapp/MainActivity;

    .line 12
    invoke-virtual {p0}, Lcom/example/targetapp/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/example/targetapp/R$raw;->lab_server:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v0

    check-cast v0, Ljava/io/Closeable;

    :try_start_0
    move-object v1, v0

    check-cast v1, Ljava/io/InputStream;

    .local v1, "it\\1":Ljava/io/InputStream;
    const/4 v2, 0x0

    .line 13
    .local v2, "$i$a$-use-MainActivity$networkModule$2$1\\1\\12\\0":I
    const-string v3, "X.509"

    invoke-static {v3}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v3

    .line 14
    invoke-virtual {v3, v1}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v3

    .line 13
    const-string v4, "null cannot be cast to non-null type java.security.cert.X509Certificate"

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v3, Ljava/security/cert/X509Certificate;

    .line 15
    .local v3, "cert\\1":Ljava/security/cert/X509Certificate;
    new-instance v4, Lcom/example/targetapp/NetworkModule;

    invoke-direct {v4, v3}, Lcom/example/targetapp/NetworkModule;-><init>(Ljava/security/cert/X509Certificate;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .end local v1    # "it\\1":Ljava/io/InputStream;
    .end local v2    # "$i$a$-use-MainActivity$networkModule$2$1\\1\\12\\0":I
    .end local v3    # "cert\\1":Ljava/security/cert/X509Certificate;
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 16
    return-object v4

    .line 12
    :catchall_0
    move-exception v1

    .end local p0    # "this$0":Lcom/example/targetapp/MainActivity;
    :try_start_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .restart local p0    # "this$0":Lcom/example/targetapp/MainActivity;
    :catchall_1
    move-exception v2

    invoke-static {v0, v1}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v2
.end method

.method static final onCreate$lambda$2(Landroid/widget/TextView;Landroid/view/View;)V
    .locals 2
    .param p0, "$tvStatus"    # Landroid/widget/TextView;
    .param p1, "it"    # Landroid/view/View;

    .line 30
    sget-object v0, Lcom/example/targetapp/RootDetection;->INSTANCE:Lcom/example/targetapp/RootDetection;

    invoke-virtual {v0}, Lcom/example/targetapp/RootDetection;->isDeviceRooted()Z

    move-result v0

    .line 31
    .local v0, "isRooted":Z
    if-eqz v0, :cond_0

    const-string v1, "Ph\u00e1t hi\u1ec7n d\u1ea5u hi\u1ec7u root"

    goto :goto_0

    :cond_0
    const-string v1, "Ch\u01b0a ph\u00e1t hi\u1ec7n d\u1ea5u hi\u1ec7u root"

    :goto_0
    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    return-void
.end method

.method static final onCreate$lambda$5(Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/TextView;Lcom/example/targetapp/MainActivity;Landroid/view/View;)V
    .locals 1
    .param p0, "$btnTestNetwork"    # Landroid/widget/Button;
    .param p1, "$btnWrongPin"    # Landroid/widget/Button;
    .param p2, "$tvStatus"    # Landroid/widget/TextView;
    .param p3, "this$0"    # Lcom/example/targetapp/MainActivity;
    .param p4, "it"    # Landroid/view/View;

    .line 51
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lcom/example/targetapp/MainActivity;->onCreate$runProbe(Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/TextView;Lcom/example/targetapp/MainActivity;Z)V

    return-void
.end method

.method static final onCreate$lambda$6(Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/TextView;Lcom/example/targetapp/MainActivity;Landroid/view/View;)V
    .locals 1
    .param p0, "$btnTestNetwork"    # Landroid/widget/Button;
    .param p1, "$btnWrongPin"    # Landroid/widget/Button;
    .param p2, "$tvStatus"    # Landroid/widget/TextView;
    .param p3, "this$0"    # Lcom/example/targetapp/MainActivity;
    .param p4, "it"    # Landroid/view/View;

    .line 52
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, p3, v0}, Lcom/example/targetapp/MainActivity;->onCreate$runProbe(Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/TextView;Lcom/example/targetapp/MainActivity;Z)V

    return-void
.end method

.method static final onCreate$lambda$7(Lcom/example/targetapp/MainActivity;Landroid/view/View;)V
    .locals 3
    .param p0, "this$0"    # Lcom/example/targetapp/MainActivity;
    .param p1, "it"    # Landroid/view/View;

    .line 54
    new-instance v0, Landroid/content/Intent;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const-class v2, Lcom/example/targetapp/SafeWebViewActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/example/targetapp/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 55
    return-void
.end method

.method static final onCreate$lambda$8(Lcom/example/targetapp/MainActivity;Landroid/view/View;)V
    .locals 3
    .param p0, "this$0"    # Lcom/example/targetapp/MainActivity;
    .param p1, "it"    # Landroid/view/View;

    .line 59
    new-instance v0, Landroid/content/Intent;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const-class v2, Lcom/example/targetapp/VulnerableWebViewActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 60
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "TARGET_URL"

    const-string v2, "https://httpbin.org/get"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 61
    invoke-virtual {p0, v0}, Lcom/example/targetapp/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 62
    return-void
.end method

.method private static final onCreate$runProbe(Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/TextView;Lcom/example/targetapp/MainActivity;Z)V
    .locals 7
    .param p0, "btnTestNetwork"    # Landroid/widget/Button;
    .param p1, "btnWrongPin"    # Landroid/widget/Button;
    .param p2, "tvStatus"    # Landroid/widget/TextView;
    .param p3, "this$0"    # Lcom/example/targetapp/MainActivity;
    .param p4, "wrongPin"    # Z

    .line 37
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 38
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 39
    if-eqz p4, :cond_0

    const-string v0, "Pin OkHttp sai"

    goto :goto_0

    :cond_0
    const-string v0, "Pin h\u1ee3p l\u1ec7"

    :goto_0
    move-object v4, v0

    .line 40
    .local v4, "mode":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u00b7 \u0110ang k\u1ebft n\u1ed1i\u2026"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    invoke-direct {p3}, Lcom/example/targetapp/MainActivity;->getNetworkModule()Lcom/example/targetapp/NetworkModule;

    move-result-object v0

    new-instance v1, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda7;

    move-object v5, p0

    move-object v6, p1

    move-object v3, p2

    move-object v2, p3

    .end local p0    # "btnTestNetwork":Landroid/widget/Button;
    .end local p1    # "btnWrongPin":Landroid/widget/Button;
    .end local p2    # "tvStatus":Landroid/widget/TextView;
    .end local p3    # "this$0":Lcom/example/targetapp/MainActivity;
    .local v2, "this$0":Lcom/example/targetapp/MainActivity;
    .local v3, "tvStatus":Landroid/widget/TextView;
    .local v5, "btnTestNetwork":Landroid/widget/Button;
    .local v6, "btnWrongPin":Landroid/widget/Button;
    invoke-direct/range {v1 .. v6}, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda7;-><init>(Lcom/example/targetapp/MainActivity;Landroid/widget/TextView;Ljava/lang/String;Landroid/widget/Button;Landroid/widget/Button;)V

    invoke-virtual {v0, p4, v1}, Lcom/example/targetapp/NetworkModule;->makePinnedRequest(ZLkotlin/jvm/functions/Function1;)V

    .line 50
    return-void
.end method

.method static final onCreate$runProbe$lambda$4(Lcom/example/targetapp/MainActivity;Landroid/widget/TextView;Ljava/lang/String;Landroid/widget/Button;Landroid/widget/Button;Ljava/lang/String;)Lkotlin/Unit;
    .locals 8
    .param p0, "this$0"    # Lcom/example/targetapp/MainActivity;
    .param p1, "$tvStatus"    # Landroid/widget/TextView;
    .param p2, "$mode"    # Ljava/lang/String;
    .param p3, "$btnTestNetwork"    # Landroid/widget/Button;
    .param p4, "$btnWrongPin"    # Landroid/widget/Button;
    .param p5, "result"    # Ljava/lang/String;

    const-string v0, "result"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    new-instance v1, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda6;

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v6, p3

    move-object v7, p4

    move-object v5, p5

    .end local p0    # "this$0":Lcom/example/targetapp/MainActivity;
    .end local p1    # "$tvStatus":Landroid/widget/TextView;
    .end local p2    # "$mode":Ljava/lang/String;
    .end local p3    # "$btnTestNetwork":Landroid/widget/Button;
    .end local p4    # "$btnWrongPin":Landroid/widget/Button;
    .end local p5    # "result":Ljava/lang/String;
    .local v2, "this$0":Lcom/example/targetapp/MainActivity;
    .local v3, "$tvStatus":Landroid/widget/TextView;
    .local v4, "$mode":Ljava/lang/String;
    .local v5, "result":Ljava/lang/String;
    .local v6, "$btnTestNetwork":Landroid/widget/Button;
    .local v7, "$btnWrongPin":Landroid/widget/Button;
    invoke-direct/range {v1 .. v7}, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda6;-><init>(Lcom/example/targetapp/MainActivity;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Button;Landroid/widget/Button;)V

    invoke-virtual {v2, v1}, Lcom/example/targetapp/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 49
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method static final onCreate$runProbe$lambda$4$lambda$3(Lcom/example/targetapp/MainActivity;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Landroid/widget/Button;Landroid/widget/Button;)V
    .locals 2
    .param p0, "this$0"    # Lcom/example/targetapp/MainActivity;
    .param p1, "$tvStatus"    # Landroid/widget/TextView;
    .param p2, "$mode"    # Ljava/lang/String;
    .param p3, "$result"    # Ljava/lang/String;
    .param p4, "$btnTestNetwork"    # Landroid/widget/Button;
    .param p5, "$btnWrongPin"    # Landroid/widget/Button;

    .line 43
    invoke-virtual {p0}, Lcom/example/targetapp/MainActivity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/example/targetapp/MainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    const/4 v0, 0x1

    invoke-virtual {p4, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 46
    invoke-virtual {p5, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 48
    :cond_0
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 20
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 21
    sget v0, Lcom/example/targetapp/R$layout;->activity_main:I

    invoke-virtual {p0, v0}, Lcom/example/targetapp/MainActivity;->setContentView(I)V

    .line 23
    sget v0, Lcom/example/targetapp/R$id;->btnCheckRoot:I

    invoke-virtual {p0, v0}, Lcom/example/targetapp/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 24
    .local v0, "btnCheckRoot":Landroid/widget/Button;
    sget v1, Lcom/example/targetapp/R$id;->btnTestNetwork:I

    invoke-virtual {p0, v1}, Lcom/example/targetapp/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 25
    .local v1, "btnTestNetwork":Landroid/widget/Button;
    sget v2, Lcom/example/targetapp/R$id;->btnOpenWebView:I

    invoke-virtual {p0, v2}, Lcom/example/targetapp/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 26
    .local v2, "btnOpenWebView":Landroid/widget/Button;
    sget v3, Lcom/example/targetapp/R$id;->tvStatus:I

    invoke-virtual {p0, v3}, Lcom/example/targetapp/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 29
    .local v3, "tvStatus":Landroid/widget/TextView;
    new-instance v4, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v4, v3}, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda0;-><init>(Landroid/widget/TextView;)V

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    sget v4, Lcom/example/targetapp/R$id;->btnWrongPin:I

    invoke-virtual {p0, v4}, Lcom/example/targetapp/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    .line 51
    .local v4, "btnWrongPin":Landroid/widget/Button;
    new-instance v5, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda1;

    invoke-direct {v5, v1, v4, v3, p0}, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda1;-><init>(Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/TextView;Lcom/example/targetapp/MainActivity;)V

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 52
    new-instance v5, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda2;

    invoke-direct {v5, v1, v4, v3, p0}, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda2;-><init>(Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/TextView;Lcom/example/targetapp/MainActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 53
    sget v5, Lcom/example/targetapp/R$id;->btnSafeWebView:I

    invoke-virtual {p0, v5}, Lcom/example/targetapp/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/Button;

    new-instance v6, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda3;

    invoke-direct {v6, p0}, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda3;-><init>(Lcom/example/targetapp/MainActivity;)V

    invoke-virtual {v5, v6}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 58
    new-instance v5, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda4;

    invoke-direct {v5, p0}, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda4;-><init>(Lcom/example/targetapp/MainActivity;)V

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 63
    return-void
.end method
