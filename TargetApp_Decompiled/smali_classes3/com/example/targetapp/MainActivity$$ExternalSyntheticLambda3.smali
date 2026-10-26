.class public final synthetic Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/example/targetapp/MainActivity;"
    method = "onCreate$lambda$3$lambda$2"
    proto = "(Lcom/example/targetapp/MainActivity;Landroid/widget/TextView;ZLjava/lang/String;)Lkotlin/Unit;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x1c
    versionHash = "9c309e1fe0130a519f42d3ae97bdf2a57c6c84ce491b9cd262c375723ff28541"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/example/targetapp/MainActivity;

.field public final synthetic f$1:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Lcom/example/targetapp/MainActivity;Landroid/widget/TextView;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda3;->f$0:Lcom/example/targetapp/MainActivity;

    iput-object p2, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda3;->f$1:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda3;->f$0:Lcom/example/targetapp/MainActivity;

    iget-object v1, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda3;->f$1:Landroid/widget/TextView;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    check-cast p2, Ljava/lang/String;

    invoke-static {v0, v1, p1, p2}, Lcom/example/targetapp/MainActivity;->onCreate$lambda$3$lambda$2(Lcom/example/targetapp/MainActivity;Landroid/widget/TextView;ZLjava/lang/String;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
