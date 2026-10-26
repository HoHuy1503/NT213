.class Landroidx/core/view/ViewCompat$Api21Impl;
.super Ljava/lang/Object;
.source "ViewCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/core/view/ViewCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Api21Impl"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 5003
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5005
    return-void
.end method

.method static callCompatInsetAnimationCallback(Landroid/view/WindowInsets;Landroid/view/View;)V
    .locals 1
    .param p0, "insets"    # Landroid/view/WindowInsets;
    .param p1, "v"    # Landroid/view/View;

    .line 5095
    sget v0, Landroidx/core/R$id;->tag_window_insets_animation_callback:I

    .line 5096
    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View$OnApplyWindowInsetsListener;

    .line 5098
    .local v0, "insetsAnimationCallback":Landroid/view/View$OnApplyWindowInsetsListener;
    if-eqz v0, :cond_0

    .line 5099
    invoke-interface {v0, p1, p0}, Landroid/view/View$OnApplyWindowInsetsListener;->onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    .line 5101
    :cond_0
    return-void
.end method

.method static computeSystemWindowInsets(Landroid/view/View;Landroidx/core/view/WindowInsetsCompat;Landroid/graphics/Rect;)Landroidx/core/view/WindowInsetsCompat;
    .locals 2
    .param p0, "v"    # Landroid/view/View;
    .param p1, "insets"    # Landroidx/core/view/WindowInsetsCompat;
    .param p2, "outLocalInsets"    # Landroid/graphics/Rect;

    .line 5009
    invoke-virtual {p1}, Landroidx/core/view/WindowInsetsCompat;->toWindowInsets()Landroid/view/WindowInsets;

    move-result-object v0

    .line 5010
    .local v0, "platformInsets":Landroid/view/WindowInsets;
    if-eqz v0, :cond_0

    .line 5011
    nop

    .line 5012
    invoke-virtual {p0, v0, p2}, Landroid/view/View;->computeSystemWindowInsets(Landroid/view/WindowInsets;Landroid/graphics/Rect;)Landroid/view/WindowInsets;

    move-result-object v1

    .line 5011
    invoke-static {v1, p0}, Landroidx/core/view/WindowInsetsCompat;->toWindowInsetsCompat(Landroid/view/WindowInsets;Landroid/view/View;)Landroidx/core/view/WindowInsetsCompat;

    move-result-object v1

    return-object v1

    .line 5014
    :cond_0
    invoke-virtual {p2}, Landroid/graphics/Rect;->setEmpty()V

    .line 5015
    return-object p1
.end method

.method static setOnApplyWindowInsetsListener(Landroid/view/View;Landroidx/core/view/OnApplyWindowInsetsListener;)V
    .locals 3
    .param p0, "v"    # Landroid/view/View;
    .param p1, "listener"    # Landroidx/core/view/OnApplyWindowInsetsListener;

    .line 5021
    if-eqz p1, :cond_0

    .line 5022
    new-instance v0, Landroidx/core/view/ViewCompat$Api21Impl$1;

    invoke-direct {v0, p0, p1}, Landroidx/core/view/ViewCompat$Api21Impl$1;-><init>(Landroid/view/View;Landroidx/core/view/OnApplyWindowInsetsListener;)V

    goto :goto_0

    .line 5058
    :cond_0
    const/4 v0, 0x0

    :goto_0
    nop

    .line 5062
    .local v0, "wrappedUserListener":Landroid/view/View$OnApplyWindowInsetsListener;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-ge v1, v2, :cond_1

    .line 5063
    sget v1, Landroidx/core/R$id;->tag_on_apply_window_listener:I

    invoke-virtual {p0, v1, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 5066
    :cond_1
    sget v1, Landroidx/core/R$id;->tag_compat_insets_dispatch:I

    invoke-virtual {p0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    .line 5067
    .local v1, "compatInsetsDispatch":Ljava/lang/Object;
    if-eqz v1, :cond_2

    .line 5072
    return-void

    .line 5075
    :cond_2
    if-eqz v0, :cond_3

    .line 5076
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    goto :goto_1

    .line 5080
    :cond_3
    sget v2, Landroidx/core/R$id;->tag_window_insets_animation_callback:I

    .line 5081
    invoke-virtual {p0, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View$OnApplyWindowInsetsListener;

    .line 5083
    .local v2, "compatInsetsAnimationCallback":Landroid/view/View$OnApplyWindowInsetsListener;
    invoke-virtual {p0, v2}, Landroid/view/View;->setOnApplyWindowInsetsListener(Landroid/view/View$OnApplyWindowInsetsListener;)V

    .line 5085
    .end local v2    # "compatInsetsAnimationCallback":Landroid/view/View$OnApplyWindowInsetsListener;
    :goto_1
    return-void
.end method
