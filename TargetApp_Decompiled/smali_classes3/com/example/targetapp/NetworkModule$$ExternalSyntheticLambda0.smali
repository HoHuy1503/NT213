.class public final synthetic Lcom/example/targetapp/NetworkModule$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Lcom/example/targetapp/NetworkModule;"
    method = "makePinnedRequest$lambda$0"
    proto = "(Lokhttp3/OkHttpClient;Lokhttp3/Request;Lkotlin/jvm/functions/Function2;)V"
.end annotation

.annotation build Lcom/android/tools/r8/annotations/SynthesizedClassV2;
    apiLevel = -0x2
    kind = 0x1c
    versionHash = "9c309e1fe0130a519f42d3ae97bdf2a57c6c84ce491b9cd262c375723ff28541"
.end annotation


# instance fields
.field public final synthetic f$0:Lokhttp3/OkHttpClient;

.field public final synthetic f$1:Lokhttp3/Request;

.field public final synthetic f$2:Lkotlin/jvm/functions/Function2;


# direct methods
.method public synthetic constructor <init>(Lokhttp3/OkHttpClient;Lokhttp3/Request;Lkotlin/jvm/functions/Function2;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/targetapp/NetworkModule$$ExternalSyntheticLambda0;->f$0:Lokhttp3/OkHttpClient;

    iput-object p2, p0, Lcom/example/targetapp/NetworkModule$$ExternalSyntheticLambda0;->f$1:Lokhttp3/Request;

    iput-object p3, p0, Lcom/example/targetapp/NetworkModule$$ExternalSyntheticLambda0;->f$2:Lkotlin/jvm/functions/Function2;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lcom/example/targetapp/NetworkModule$$ExternalSyntheticLambda0;->f$0:Lokhttp3/OkHttpClient;

    iget-object v1, p0, Lcom/example/targetapp/NetworkModule$$ExternalSyntheticLambda0;->f$1:Lokhttp3/Request;

    iget-object v2, p0, Lcom/example/targetapp/NetworkModule$$ExternalSyntheticLambda0;->f$2:Lkotlin/jvm/functions/Function2;

    invoke-static {v0, v1, v2}, Lcom/example/targetapp/NetworkModule;->makePinnedRequest$lambda$0(Lokhttp3/OkHttpClient;Lokhttp3/Request;Lkotlin/jvm/functions/Function2;)V

    return-void
.end method
