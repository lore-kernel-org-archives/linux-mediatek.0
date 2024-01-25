Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0B6C47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 06:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CI/NWBRSwikIHFcrWI6AUp0255MAfCWVxlivVpcLloM=; b=ghWBXCUfJaUcYunhH6GxjsmNpH
	/EaQs3lUhrbXGrdrnW3daJs4SwGq08kwdh8nhMnHMDglrwh95w0p1tZoS0ES5PIhEz3OLK8iYwEsz
	MjvIRu9S1NPOD9KzTBGpmVoiQWoEnU/UMRvG5n3iHBB7tPh9M4FVqafPAoh2fHZnHa2vx/0v2bWWW
	xxIRPhsjB6/TdVQYv1AavsXdeCAOAYncbN28tpfeCXlKWzHeicrMdW5P8HKqZs8MvLf8EvAUPe4Jb
	xvge6QYyJL12KJppB+AQDuZ69VM9OkfpdWDVi2BuBRChugzQ/kcXlSVMrqLAc+tc7vpOvje0dsTgQ
	gNRzvY9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rStVW-006sNh-1Z;
	Thu, 25 Jan 2024 06:46:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSsWh-006Xsy-17;
	Thu, 25 Jan 2024 05:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=CI/NWBRSwikIHFcrWI6AUp0255MAfCWVxlivVpcLloM=; b=G9fXYPympZdBmVOywp8cENxrpp
	1YcFEg7dhBhz/46Nt5xyToORTe+1GZvo/A5X0bmtpfSWXIoJ7qJcCIu0Z9NF1gMRbcy/MxcOKeQNP
	tHl2GB+y4qvZBHgcn5YD43tz24eMJK5JZgwN9qZ2c7LzAc9CdaaJcGgxBncjy1Qw77hSKq2CzUEum
	IqOYSfEx5jUExG4l7KrG47rE2egRAfEnsB1uIDnQuEnMtF9WkjKJgSPmX92PC2UV/AWr2HfhVjMXS
	H+cxMr8HbTIi/YeRl+RT6DhewuO3Ef7j7buNXEUj4PN0CosGeUkauT1RRt596ecEk4by4yL8rjVrL
	h5qsqeUw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSsWR-00000004ufT-0jLK;
	Thu, 25 Jan 2024 05:43:38 +0000
X-UUID: 7e65d63ebb4211ee9a263b4415211400-20240124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CI/NWBRSwikIHFcrWI6AUp0255MAfCWVxlivVpcLloM=;
	b=h0D3WLPbNPxeXzoCWk0+CRNrt5vaMmPR0UcJ8/C8s30bCRVoNxH8eriSE62llmfWOizYRJeydmbluHzvEmk+WyXMi2srdwE2n4VQqPj6pJRPQ1I+cBCnWadcZ+jH9Nfj1kOi+n4gxskS7qqjXpkIl+fTTl6pPH+l+Tm1/EqLzGk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:719ed47d-94b4-4921-a10c-e35f082eb76d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6e16cf4,CLOUDID:40153c83-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7e65d63ebb4211ee9a263b4415211400-20240124
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <gavin.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 970993360; Wed, 24 Jan 2024 22:27:55 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 25 Jan 2024 13:27:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 25 Jan 2024 13:27:52 +0800
From: gavin.liu <gavin.liu@mediatek.com>
To: Jens Wiklander <jens.wiklander@linaro.org>, Sumit Garg
	<sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<op-tee@lists.trustedfirmware.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<gavin.liu@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] optee: support wq_sleep_timeout
Date: Thu, 25 Jan 2024 13:27:44 +0800
Message-ID: <20240125052744.18866-1-gavin.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.493700-8.000000
X-TMASE-MatchedRID: qg9A2eKC0s6GeTbGWdRz1kKcYi5Qw/RVqQ9UezeTkTj7efdnqtsaE3B4
	4IkzjfYyThbvLLI8RvPmRq+NdpkLXHW0oJLOugKB8rLt6/XzAZZA8JZETQujwhS11FlOYRohQyY
	np0aZIjLD9dt+AOidH43/d0NuPcI1j2hRzH1UwuAURSScn+QSXt0H8LFZNFG73Yq8RVaZivVGBu
	cRG9mMVEGysrMIjvt71lbKRwZ0frWo+cmBJ4qixNAUj8eogZsv
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.493700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 90681AE6CC77A603801ECED92FA187A83A4070873E71D2606BD318CCA0010D692000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_054334_175469_F790823F 
X-CRM114-Status: GOOD (  12.94  )
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

Add wq_sleep_timeout to support self waking when timeout for secure
driver usage.

Signed-off-by: Gavin Liu <gavin.liu@mediatek.com>
---
 drivers/tee/optee/notif.c         |  9 +++++++--
 drivers/tee/optee/optee_private.h |  2 +-
 drivers/tee/optee/rpc.c           | 10 ++++++++--
 3 files changed, 16 insertions(+), 5 deletions(-)

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


