Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72184C25B10
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 02:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OkbheN73NOmkxbTzCeJVpVCAkNTb+uG4tFp2uucwYAQ=; b=sEpj39WDPbZV54Y3T9F/ixCprG
	izvwt2mDorl8uCAM3BlJSWWPQBioHV8r8JyQUpo9gbAeKE4mVpS3DBeMyneoyvdiHlRzzyW/7n1Sg
	I1nxIeHckczw6Zjf7wjM1bRqG22Ozxewy6Swe5VYEtsfCv1/RpAkzYLV2OBC+PU9Iom0RpFEPDtQR
	iOy2T8COPbKwUDuFSOQPiLVDTyw3NPajpMQbzF8bQVQxETm0z7TKCAx75HiJ/Jqno3IVhYbkuwo0L
	bcHkm3sdF1wWzXXmB5070eNW0yAIXWkIKhNoKY1JudoabNUeSQOfrW0RuBetkZFRz7nqkSa/pIDZQ
	N21ZOfVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4A9q-00000009Jon-1RFs;
	Tue, 07 May 2024 02:02:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4A9k-00000009JmV-2C07;
	Tue, 07 May 2024 02:02:16 +0000
X-UUID: b2ab141c0c1511efa8f1cd58ee6c2400-20240506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=OkbheN73NOmkxbTzCeJVpVCAkNTb+uG4tFp2uucwYAQ=;
	b=TLpadRJk75RzdzbqokqlXSgJs19HzlTh/1pv4twmQlLAsF3P0XkjXrjM0lYUWU6y1wLZUV0Y9xufIPBPocSiqdm1qvfK/ggwCmNQoMYMNempU1uIlMgXrx7GsJHRiuAY+YHx3hRCHDxO8y4aJD3MX0SHbww+l2kVG4sAsdMZROk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:4db76e95-1eda-44b6-9f94-c084c717c25c,IP:0,U
	RL:-32768,TC:0,Content:0,EDM:-32768,RT:0,SF:-32768,FILE:0,BULK:-32768,RULE
	:Release_Ham,ACTION:release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:f8ff617d-636d-4760-b6da-9ab1870fa056,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:nil,IP:nil,
	URL:nil,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b2ab141c0c1511efa8f1cd58ee6c2400-20240506
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <gavin.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1721781442; Mon, 06 May 2024 19:01:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 7 May 2024 10:00:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 7 May 2024 10:00:43 +0800
From: gavin.liu <gavin.liu@mediatek.com>
To: Jens Wiklander <jens.wiklander@linaro.org>, Sumit Garg
	<sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <op-tee@lists.trustedfirmware.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Gavin Liu <gavin.liu@mediatek.com>
Subject: [PATCH v3] optee: add timeout value to optee_notif_wait() to support timeout
Date: Tue, 7 May 2024 10:00:37 +0800
Message-ID: <20240507020037.14009-1-gavin.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_190212_610055_A88A4989 
X-CRM114-Status: GOOD (  16.94  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gavin Liu <gavin.liu@mediatek.com>

Add timeout value to support self waking when timeout to avoid waiting
indefinitely.

Signed-off-by: Gavin Liu <gavin.liu@mediatek.com>
---
change in v3:
1. change the comment in optee_rpc_cmd.h
2. add macro for "TEE_ERROR_TIMEOUT"
3. change from "TEEC_ERROR_BUSY" to "TEE_ERROR_TIMEOUT"
---
 drivers/tee/optee/notif.c         |  9 +++++++--
 drivers/tee/optee/optee_private.h |  5 ++++-
 drivers/tee/optee/optee_rpc_cmd.h |  1 +
 drivers/tee/optee/rpc.c           | 10 ++++++++--
 4 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/tee/optee/notif.c b/drivers/tee/optee/notif.c
index 0d7878e770cd..1970880c796f 100644
--- a/drivers/tee/optee/notif.c
+++ b/drivers/tee/optee/notif.c
@@ -29,7 +29,7 @@ static bool have_key(struct optee *optee, u_int key)
 	return false;
 }
 
-int optee_notif_wait(struct optee *optee, u_int key)
+int optee_notif_wait(struct optee *optee, u_int key, u32 timeout)
 {
 	unsigned long flags;
 	struct notif_entry *entry;
@@ -70,7 +70,12 @@ int optee_notif_wait(struct optee *optee, u_int key)
 	 * Unlock temporarily and wait for completion.
 	 */
 	spin_unlock_irqrestore(&optee->notif.lock, flags);
-	wait_for_completion(&entry->c);
+	if (timeout != 0) {
+		if (!wait_for_completion_timeout(&entry->c, timeout))
+			rc = -ETIMEDOUT;
+	} else {
+		wait_for_completion(&entry->c);
+	}
 	spin_lock_irqsave(&optee->notif.lock, flags);
 
 	list_del(&entry->link);
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index 429cc20be5cc..424898cdc4e9 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -26,6 +26,9 @@
 #define TEEC_ERROR_BUSY			0xFFFF000D
 #define TEEC_ERROR_SHORT_BUFFER		0xFFFF0010
 
+/* API Return Codes are from the GP TEE Internal Core API Specification */
+#define TEE_ERROR_TIMEOUT		0xFFFF3001
+
 #define TEEC_ORIGIN_COMMS		0x00000002
 
 /*
@@ -252,7 +255,7 @@ struct optee_call_ctx {
 
 int optee_notif_init(struct optee *optee, u_int max_key);
 void optee_notif_uninit(struct optee *optee);
-int optee_notif_wait(struct optee *optee, u_int key);
+int optee_notif_wait(struct optee *optee, u_int key, u32 timeout);
 int optee_notif_send(struct optee *optee, u_int key);
 
 u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
diff --git a/drivers/tee/optee/optee_rpc_cmd.h b/drivers/tee/optee/optee_rpc_cmd.h
index f3f06e0994a7..4576751b490c 100644
--- a/drivers/tee/optee/optee_rpc_cmd.h
+++ b/drivers/tee/optee/optee_rpc_cmd.h
@@ -41,6 +41,7 @@
  * Waiting on notification
  * [in]    value[0].a	    OPTEE_RPC_NOTIFICATION_WAIT
  * [in]    value[0].b	    notification value
+ * [in]    value[0].c	    timeout in milliseconds or 0 if no timeout
  *
  * Sending a synchronous notification
  * [in]    value[0].a	    OPTEE_RPC_NOTIFICATION_SEND
diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
index f086812f1179..5de4504665be 100644
--- a/drivers/tee/optee/rpc.c
+++ b/drivers/tee/optee/rpc.c
@@ -130,6 +130,8 @@ static void handle_rpc_func_cmd_i2c_transfer(struct tee_context *ctx,
 static void handle_rpc_func_cmd_wq(struct optee *optee,
 				   struct optee_msg_arg *arg)
 {
+	int rc = 0;
+
 	if (arg->num_params != 1)
 		goto bad;
 
@@ -139,7 +141,8 @@ static void handle_rpc_func_cmd_wq(struct optee *optee,
 
 	switch (arg->params[0].u.value.a) {
 	case OPTEE_RPC_NOTIFICATION_WAIT:
-		if (optee_notif_wait(optee, arg->params[0].u.value.b))
+		rc = optee_notif_wait(optee, arg->params[0].u.value.b, arg->params[0].u.value.c);
+		if (rc)
 			goto bad;
 		break;
 	case OPTEE_RPC_NOTIFICATION_SEND:
@@ -153,7 +156,10 @@ static void handle_rpc_func_cmd_wq(struct optee *optee,
 	arg->ret = TEEC_SUCCESS;
 	return;
 bad:
-	arg->ret = TEEC_ERROR_BAD_PARAMETERS;
+	if (rc == -ETIMEDOUT)
+		arg->ret = TEE_ERROR_TIMEOUT;
+	else
+		arg->ret = TEEC_ERROR_BAD_PARAMETERS;
 }
 
 static void handle_rpc_func_cmd_wait(struct optee_msg_arg *arg)
-- 
2.18.0


