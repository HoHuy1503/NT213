.class public final synthetic Lcom/example/targetapp/NetworkModule$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/example/targetapp/NetworkModule;"
    method = "makePinnedRequest$lambda$1"
    proto = "(ZLcom/example/targetapp/NetworkModule;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x1c
    versionHash = "9c309e1fe0130a519f42d3ae97bdf2a57c6c84ce491b9cd262c375723ff28541"
.end annotation


# instance fields
.field public final synthetic f$0:Z

.field public final synthetic f$1:Lcom/example/targetapp/NetworkModule;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(ZLcom/example/targetapp/NetworkModule;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/example/targetapp/NetworkModule$$ExternalSyntheticLambda0;->f$0:Z

    iput-object p2, p0, Lcom/example/targetapp/NetworkModule$$ExternalSyntheticLambda0;->f$1:Lcom/example/targetapp/NetworkModule;

    iput-object p3, p0, Lcom/example/targetapp/NetworkModule$$ExternalSyntheticLambda0;->f$2:Ljava/lang/String;

    iput-object p4, p0, Lcom/example/targetapp/NetworkModule$$ExternalSyntheticLambda0;->f$3:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 0
    iget-boolean v0, p0, Lcom/example/targetapp/NetworkModule$$ExternalSyntheticLambda0;->f$0:Z

    iget-object v1, p0, Lcom/example/targetapp/NetworkModule$$ExternalSyntheticLambda0;->f$1:Lcom/example/targetapp/NetworkModule;

    iget-object v2, p0, Lcom/example/targetapp/NetworkModule$$ExternalSyntheticLambda0;->f$2:Ljava/lang/String;

    iget-object v3, p0, Lcom/example/targetapp/NetworkModule$$ExternalSyntheticLambda0;->f$3:Lkotlin/jvm/functions/Function1;

    invoke-static {v0, v1, v2, v3}, Lcom/example/targetapp/NetworkModule;->makePinnedRequest$lambda$1(ZLcom/example/targetapp/NetworkModule;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    return-void
.end method
