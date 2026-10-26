.class public final Lcom/example/targetapp/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0012\u0010\u0006\u001a\u00020\u00072\u0008\u0010\u0008\u001a\u0004\u0018\u00010\tH\u0014R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/example/targetapp/MainActivity;",
        "Landroidx/appcompat/app/AppCompatActivity;",
        "<init>",
        "()V",
        "networkModule",
        "Lcom/example/targetapp/NetworkModule;",
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
.field private final networkModule:Lcom/example/targetapp/NetworkModule;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 9
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 11
    new-instance v0, Lcom/example/targetapp/NetworkModule;

    invoke-direct {v0}, Lcom/example/targetapp/NetworkModule;-><init>()V

    iput-object v0, p0, Lcom/example/targetapp/MainActivity;->networkModule:Lcom/example/targetapp/NetworkModule;

    .line 9
    return-void
.end method

.method static final onCreate$lambda$0(Landroid/widget/TextView;Landroid/view/View;)V
    .locals 2
    .param p0, "$tvStatus"    # Landroid/widget/TextView;
    .param p1, "it"    # Landroid/view/View;

    .line 24
    sget-object v0, Lcom/example/targetapp/RootDetection;->INSTANCE:Lcom/example/targetapp/RootDetection;

    invoke-virtual {v0}, Lcom/example/targetapp/RootDetection;->isDeviceRooted()Z

    move-result v0

    .line 25
    .local v0, "isRooted":Z
    if-eqz v0, :cond_0

    const-string v1, "C\u1ea3nh b\u00e1o: Thi\u1ebft b\u1ecb \u0110\u00c3 B\u1eca ROOT!"

    goto :goto_0

    :cond_0
    const-string v1, "Thi\u1ebft b\u1ecb An to\u00e0n (Not Rooted)"

    :goto_0
    check-cast v1, Ljava/lang/CharSequence;

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    return-void
.end method

.method static final onCreate$lambda$3(Landroid/widget/TextView;Lcom/example/targetapp/MainActivity;Landroid/view/View;)V
    .locals 3
    .param p0, "$tvStatus"    # Landroid/widget/TextView;
    .param p1, "this$0"    # Lcom/example/targetapp/MainActivity;
    .param p2, "it"    # Landroid/view/View;

    .line 30
    const-string v0, "\u0110ang g\u1edfi request ki\u1ec3m tra SSL Pinning..."

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    iget-object v0, p1, Lcom/example/targetapp/MainActivity;->networkModule:Lcom/example/targetapp/NetworkModule;

    new-instance v1, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda3;

    invoke-direct {v1, p1, p0}, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda3;-><init>(Lcom/example/targetapp/MainActivity;Landroid/widget/TextView;)V

    const-string v2, "https://httpbin.org/get"

    invoke-virtual {v0, v2, v1}, Lcom/example/targetapp/NetworkModule;->makePinnedRequest(Ljava/lang/String;Lkotlin/jvm/functions/Function2;)V

    .line 36
    return-void
.end method

.method static final onCreate$lambda$3$lambda$2(Lcom/example/targetapp/MainActivity;Landroid/widget/TextView;ZLjava/lang/String;)Lkotlin/Unit;
    .locals 1
    .param p0, "this$0"    # Lcom/example/targetapp/MainActivity;
    .param p1, "$tvStatus"    # Landroid/widget/TextView;
    .param p2, "success"    # Z
    .param p3, "message"    # Ljava/lang/String;

    const-string v0, "message"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 32
    new-instance v0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda4;

    invoke-direct {v0, p1, p2, p3}, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda4;-><init>(Landroid/widget/TextView;ZLjava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/example/targetapp/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 35
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method static final onCreate$lambda$3$lambda$2$lambda$1(Landroid/widget/TextView;ZLjava/lang/String;)V
    .locals 2
    .param p0, "$tvStatus"    # Landroid/widget/TextView;
    .param p1, "$success"    # Z
    .param p2, "$message"    # Ljava/lang/String;

    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    if-eqz p1, :cond_0

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "K\u1ebft n\u1ed1i th\u00e0nh c\u00f4ng!\n"

    goto :goto_0

    :cond_0
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Ch\u1eb7n b\u1edfi SSL Pinning:\n"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    return-void
.end method

.method static final onCreate$lambda$4(Lcom/example/targetapp/MainActivity;Landroid/view/View;)V
    .locals 3
    .param p0, "this$0"    # Lcom/example/targetapp/MainActivity;
    .param p1, "it"    # Landroid/view/View;

    .line 40
    new-instance v0, Landroid/content/Intent;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    const-class v2, Lcom/example/targetapp/VulnerableWebViewActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 41
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "TARGET_URL"

    const-string v2, "https://httpbin.org/get"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 42
    invoke-virtual {p0, v0}, Lcom/example/targetapp/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 43
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 14
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 15
    sget v0, Lcom/example/targetapp/R$layout;->activity_main:I

    invoke-virtual {p0, v0}, Lcom/example/targetapp/MainActivity;->setContentView(I)V

    .line 17
    sget v0, Lcom/example/targetapp/R$id;->btnCheckRoot:I

    invoke-virtual {p0, v0}, Lcom/example/targetapp/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 18
    .local v0, "btnCheckRoot":Landroid/widget/Button;
    sget v1, Lcom/example/targetapp/R$id;->btnTestNetwork:I

    invoke-virtual {p0, v1}, Lcom/example/targetapp/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 19
    .local v1, "btnTestNetwork":Landroid/widget/Button;
    sget v2, Lcom/example/targetapp/R$id;->btnOpenWebView:I

    invoke-virtual {p0, v2}, Lcom/example/targetapp/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 20
    .local v2, "btnOpenWebView":Landroid/widget/Button;
    sget v3, Lcom/example/targetapp/R$id;->tvStatus:I

    invoke-virtual {p0, v3}, Lcom/example/targetapp/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 23
    .local v3, "tvStatus":Landroid/widget/TextView;
    new-instance v4, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda0;

    invoke-direct {v4, v3}, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda0;-><init>(Landroid/widget/TextView;)V

    invoke-virtual {v0, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    new-instance v4, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda1;

    invoke-direct {v4, v3, p0}, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda1;-><init>(Landroid/widget/TextView;Lcom/example/targetapp/MainActivity;)V

    invoke-virtual {v1, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    new-instance v4, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda2;

    invoke-direct {v4, p0}, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda2;-><init>(Lcom/example/targetapp/MainActivity;)V

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 44
    return-void
.end method
