.class public Lcom/quicinc/cne/andsf/AndsfParser$Version;
.super Ljava/lang/Object;
.source "AndsfParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/quicinc/cne/andsf/AndsfParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Version"
.end annotation


# static fields
.field private static final MAJOR:I = 0x5

.field private static final MINOR:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInt()I
    .locals 1

    .prologue
    .line 57
    const/16 v0, 0x1f4

    return v0
.end method

.method public static getString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 54
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static matchVersion(Ljava/lang/String;)Z
    .locals 7
    .param p0, "version"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 68
    :try_start_0
    const-string/jumbo v6, "\\."

    invoke-virtual {p0, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 69
    .local v0, "array":[Ljava/lang/String;
    const/4 v6, 0x0

    aget-object v6, v0, v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 70
    .local v2, "major":I
    const/4 v6, 0x1

    aget-object v6, v0, v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 76
    .local v3, "minor":I
    const/4 v6, 0x5

    if-ne v2, v6, :cond_0

    if-nez v3, :cond_0

    :goto_0
    return v4

    .line 71
    .end local v0    # "array":[Ljava/lang/String;
    .end local v2    # "major":I
    .end local v3    # "minor":I
    :catch_0
    move-exception v1

    .line 72
    .local v1, "e":Ljava/lang/NumberFormatException;
    const-string/jumbo v4, "PLCY:ANDSF"

    const-string/jumbo v6, "NumberFormatException"

    invoke-static {v4, v6}, Lcom/quicinc/cne/CneMsg;->loge(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    invoke-virtual {v1}, Ljava/lang/NumberFormatException;->printStackTrace()V

    .line 74
    return v5

    .end local v1    # "e":Ljava/lang/NumberFormatException;
    .restart local v0    # "array":[Ljava/lang/String;
    .restart local v2    # "major":I
    .restart local v3    # "minor":I
    :cond_0
    move v4, v5

    .line 76
    goto :goto_0
.end method
