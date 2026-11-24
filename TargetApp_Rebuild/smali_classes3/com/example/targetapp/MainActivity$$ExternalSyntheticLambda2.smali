.class public final synthetic Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/example/targetapp/MainActivity;"
    method = "onCreate$lambda$6"
    proto = "(Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/TextView;Lcom/example/targetapp/MainActivity;Landroid/view/View;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x1c
    versionHash = "9c309e1fe0130a519f42d3ae97bdf2a57c6c84ce491b9cd262c375723ff28541"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/widget/Button;

.field public final synthetic f$1:Landroid/widget/Button;

.field public final synthetic f$2:Landroid/widget/TextView;

.field public final synthetic f$3:Lcom/example/targetapp/MainActivity;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/TextView;Lcom/example/targetapp/MainActivity;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda2;->f$0:Landroid/widget/Button;

    iput-object p2, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda2;->f$1:Landroid/widget/Button;

    iput-object p3, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda2;->f$2:Landroid/widget/TextView;

    iput-object p4, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda2;->f$3:Lcom/example/targetapp/MainActivity;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 4

    .line 0
    iget-object v0, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda2;->f$0:Landroid/widget/Button;

    iget-object v1, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda2;->f$1:Landroid/widget/Button;

    iget-object v2, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda2;->f$2:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda2;->f$3:Lcom/example/targetapp/MainActivity;

    invoke-static {v0, v1, v2, v3, p1}, Lcom/example/targetapp/MainActivity;->onCreate$lambda$6(Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/TextView;Lcom/example/targetapp/MainActivity;Landroid/view/View;)V

    return-void
.end method
