.class public final synthetic Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/example/targetapp/MainActivity;"
    method = "onCreate$runProbe$lambda$4"
    proto = "(Lcom/example/targetapp/MainActivity;Landroid/widget/TextView;Ljava/lang/String;Landroid/widget/Button;Landroid/widget/Button;Ljava/lang/String;)Lkotlin/Unit;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x1c
    versionHash = "9c309e1fe0130a519f42d3ae97bdf2a57c6c84ce491b9cd262c375723ff28541"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/example/targetapp/MainActivity;

.field public final synthetic f$1:Landroid/widget/TextView;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Landroid/widget/Button;

.field public final synthetic f$4:Landroid/widget/Button;


# direct methods
.method public synthetic constructor <init>(Lcom/example/targetapp/MainActivity;Landroid/widget/TextView;Ljava/lang/String;Landroid/widget/Button;Landroid/widget/Button;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda7;->f$0:Lcom/example/targetapp/MainActivity;

    iput-object p2, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda7;->f$1:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda7;->f$2:Ljava/lang/String;

    iput-object p4, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda7;->f$3:Landroid/widget/Button;

    iput-object p5, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda7;->f$4:Landroid/widget/Button;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 0
    iget-object v0, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda7;->f$0:Lcom/example/targetapp/MainActivity;

    iget-object v1, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda7;->f$1:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda7;->f$2:Ljava/lang/String;

    iget-object v3, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda7;->f$3:Landroid/widget/Button;

    iget-object v4, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda7;->f$4:Landroid/widget/Button;

    move-object v5, p1

    check-cast v5, Ljava/lang/String;

    invoke-static/range {v0 .. v5}, Lcom/example/targetapp/MainActivity;->onCreate$runProbe$lambda$4(Lcom/example/targetapp/MainActivity;Landroid/widget/TextView;Ljava/lang/String;Landroid/widget/Button;Landroid/widget/Button;Ljava/lang/String;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
