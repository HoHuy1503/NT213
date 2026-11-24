.class public final Lcom/example/targetapp/SafeWebViewActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "SafeWebViewActivity.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0012\u0010\u0004\u001a\u00020\u00052\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u0014\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/example/targetapp/SafeWebViewActivity;",
        "Landroidx/appcompat/app/AppCompatActivity;",
        "<init>",
        "()V",
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


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 9
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 10
    new-instance v0, Landroid/webkit/WebView;

    move-object v1, p0

    check-cast v1, Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    move-object v2, v0

    .line 11
    .local v2, "view":Landroid/webkit/WebView;
    invoke-virtual {v2}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v0

    .local v0, "$this$onCreate_u24lambda_u240\\1":Landroid/webkit/WebSettings;
    const/4 v1, 0x0

    .line 12
    .local v1, "$i$a$-apply-SafeWebViewActivity$onCreate$1\\1\\11\\0":I
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 13
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    .line 14
    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setAllowContentAccess(Z)V

    .line 15
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/webkit/WebSettings;->setBlockNetworkLoads(Z)V

    .line 16
    nop

    .line 11
    .end local v0    # "$this$onCreate_u24lambda_u240\\1":Landroid/webkit/WebSettings;
    .end local v1    # "$i$a$-apply-SafeWebViewActivity$onCreate$1\\1\\11\\0":I
    nop

    .line 17
    move-object v0, v2

    check-cast v0, Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/example/targetapp/SafeWebViewActivity;->setContentView(Landroid/view/View;)V

    .line 18
    nop

    .line 19
    nop

    .line 21
    nop

    .line 18
    const/4 v3, 0x0

    const-string v4, "<html><meta charset=\'utf-8\'><h2>WebView ph\u00f2ng th\u1ee7</h2><p>Trang n\u1ed9i b\u1ed9 d\u00f9ng n\u1ed9i dung c\u1ed1 \u0111\u1ecbnh v\u00e0 kh\u00f4ng cung c\u1ea5p JavaScript bridge.</p></html>"

    const-string v5, "text/html"

    const-string v6, "UTF-8"

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    return-void
.end method
