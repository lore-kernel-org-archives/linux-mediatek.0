Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF83BC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 May 2024 09:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wa9ZFYyQyLg9Zk5bCCWMW/hFYEEEDVpBvBp/sui5nAM=; b=X0p6T57HD6J0jDIDlF0BzL+6jY
	AM9gpN8UNxxwvMJAlVeLo4ICvvv0Qf83CnK20RWe793S60Bj+04nTqxl4K90PQTyn0unb8wBw+v0Y
	6xakSL6xPte7iDbdrGwzoPwSqLqwOZqUL0W2zRZMo0zvDi3WS2POxVqy6vDVT09nGfFQhjjQntG+v
	7pwHM1Q086iAB8aDGRcouPuAOHIGdPQJuRT0LjKBDbwY+BMW3w38XSZd8SJx34C67uwunrSah40/c
	0vL1qMTg81uiR8YY+BHTL5K7GOVg3Hh43r/Z6PTvTz1gg747Dc+01DoqhtpkcmAay34BR3agFekRj
	tnPfBOCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2SPU-0000000C5HN-3TcH;
	Thu, 02 May 2024 09:07:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2SPR-0000000C5Ga-0g3d;
	Thu, 02 May 2024 09:07:22 +0000
X-UUID: 5cb37762086311efa8f1cd58ee6c2400-20240502
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Wa9ZFYyQyLg9Zk5bCCWMW/hFYEEEDVpBvBp/sui5nAM=;
	b=u+FsOxmFXXBL1NszHOPoyAYR0eCxncqHkwH+xgA9cN1rSHJtSoMtrrBAcQiAy5R6El3OcWZrgbM/doPMcV+Hrfi8aB/Z72D33iX/BrwXQpT22zq+I1B9+YLuh2tymn4cEb5hxjXDHx7t7y2ljCyGchrJE/Bd1MDrQAQ7lhktvgU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:ab6414c3-4eb3-4125-93d4-a79d21d2abb8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:7e485d83-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5cb37762086311efa8f1cd58ee6c2400-20240502
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <gavin.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 895214005; Thu, 02 May 2024 02:07:12 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 2 May 2024 16:56:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 2 May 2024 16:56:37 +0800
From: gavin.liu <gavin.liu@mediatek.com>
To: Jens Wiklander <jens.wiklander@linaro.org>, Sumit Garg
	<sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <op-tee@lists.trustedfirmware.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Gavin Liu <gavin.liu@mediatek.com>
Subject: [PATCH v2] optee: add timeout value to optee_notif_wait() to support timeout
Date: Thu, 2 May 2024 16:56:36 +0800
Message-ID: <20240502085636.4049-1-gavin.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_020721_224347_3074E699 
X-CRM114-Status: GOOD (  16.43  )
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
Change in v2:
Change commit message.
Add description for value[0].c in optee_rpc_cmd.h.
---
---
 drivers/tee/optee/notif.c         |  9 +++++++--
 drivers/tee/optee/optee_private.h |  2 +-
 drivers/tee/optee/optee_rpc_cmd.h |  1 +
 drivers/tee/optee/rpc.c           | 10 ++++++++--
 4 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/tee/optee/notif.c b/drivers/tee/optee/notif.c
index 05212842b0a5..d5e5c0645609 100644
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
index 7a5243c78b55..da990c4016ec 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -252,7 +252,7 @@ struct optee_call_ctx {
 
 int optee_notif_init(struct optee *optee, u_int max_key);
 void optee_notif_uninit(struct optee *optee);
-int optee_notif_wait(struct optee *optee, u_int key);
+int optee_notif_wait(struct optee *optee, u_int key, u32 timeout);
 int optee_notif_send(struct optee *optee, u_int key);
 
 u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
diff --git a/drivers/tee/optee/optee_rpc_cmd.h b/drivers/tee/optee/optee_rpc_cmd.h
index f3f06e0994a7..99342aa66263 100644
--- a/drivers/tee/optee/optee_rpc_cmd.h
+++ b/drivers/tee/optee/optee_rpc_cmd.h
@@ -41,6 +41,7 @@
  * Waiting on notification
  * [in]    value[0].a	    OPTEE_RPC_NOTIFICATION_WAIT
  * [in]    value[0].b	    notification value
+ * [in]    value[0].c	    timeout in millisecond or 0 if no timeout
  *
  * Sending a synchronous notification
  * [in]    value[0].a	    OPTEE_RPC_NOTIFICATION_SEND
diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
index e69bc6380683..14e6246aaf05 100644
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
+		arg->ret = TEEC_ERROR_BUSY;
+	else
+		arg->ret = TEEC_ERROR_BAD_PARAMETERS;
 }
 
 static void handle_rpc_func_cmd_wait(struct optee_msg_arg *arg)
-- 
2.18.0


