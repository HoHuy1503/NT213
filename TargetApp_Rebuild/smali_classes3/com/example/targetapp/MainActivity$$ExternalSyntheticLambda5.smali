.class public final synthetic Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/example/targetapp/MainActivity;"
    method = "networkModule_delegate$lambda$1"
    proto = "(Lcom/example/targetapp/MainActivity;)Lcom/example/targetapp/NetworkModule;"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x1c
    versionHash = "9c309e1fe0130a519f42d3ae97bdf2a57c6c84ce491b9cd262c375723ff28541"
.end annotation


# instance fields
.field public final synthetic f$0:Lcom/example/targetapp/MainActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/example/targetapp/MainActivity;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda5;->f$0:Lcom/example/targetapp/MainActivity;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/example/targetapp/MainActivity$$ExternalSyntheticLambda5;->f$0:Lcom/example/targetapp/MainActivity;

    invoke-static {v0}, Lcom/example/targetapp/MainActivity;->networkModule_delegate$lambda$1(Lcom/example/targetapp/MainActivity;)Lcom/example/targetapp/NetworkModule;

    move-result-object v0

    return-object v0
.end method
