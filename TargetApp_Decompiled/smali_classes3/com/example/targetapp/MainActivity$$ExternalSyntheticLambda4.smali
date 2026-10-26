.class public final synthetic Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/example/targetapp/MainActivity;"
    method = "onCreate$lambda$3$lambda$2$lambda$1"
    proto = "(Landroid/widget/TextView;ZLjava/lang/String;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x1c
    versionHash = "9c309e1fe0130a519f42d3ae97bdf2a57c6c84ce491b9cd262c375723ff28541"
.end annotation


# instance fields
.field public final synthetic f$0:Landroid/widget/TextView;

.field public final synthetic f$1:Z

.field public final synthetic f$2:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;ZLjava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda4;->f$0:Landroid/widget/TextView;

    iput-boolean p2, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda4;->f$1:Z

    iput-object p3, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda4;->f$2:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda4;->f$0:Landroid/widget/TextView;

    iget-boolean v1, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda4;->f$1:Z

    iget-object v2, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda4;->f$2:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/example/targetapp/MainActivity;->onCreate$lambda$3$lambda$2$lambda$1(Landroid/widget/TextView;ZLjava/lang/String;)V

    return-void
.end method
