Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EEBC38A2D
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 08:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VY59DSr/vLv19nNx/B+Y43pG1dxoo/HaYIuPllk8qdg=; b=Z8Uo1CP/rThURWJPO5otea71UQ
	EpIU3r07JXzerLpjOYiFdnjS310GipoA0l/XAqed4SSU7+bmCQR/DiM4NMZpoLM8qLushspJYE9JC
	ojtCeph6qKAC5bkoSAyUQ9GR/hBzokvN+febF9yk+yHUlgrNTtre1OMBwif65LYrUbiE8UlYDDbr9
	GMokU7ip875rP1nPY5lZuPwR6Y9oZW/6ulX9wfsBW9kycGMa1EjuL/zGLCSFpAAj4i5nwwYdLssBI
	8bwq/+x4YZNZpZYp6OrGhwKihZqB20TOqqq0xJ+cgcfEEKSnJjSR4Ect8VIX1DuvV96YzcXu/ZrfY
	OwIStxMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onbUn-008VRE-9c; Wed, 26 Oct 2022 08:10:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onbUk-008VQD-Ud
	for linux-mediatek@lists.infradead.org; Wed, 26 Oct 2022 08:10:40 +0000
X-UUID: 14169dd9596247b6b0549e984d18666c-20221026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VY59DSr/vLv19nNx/B+Y43pG1dxoo/HaYIuPllk8qdg=;
	b=iE97Wp/D3wPRAcdKHTy/u0KnSADBjhUuFLRD1EaYiiiKUG2NrDhFLndRuKUktlPa4Fqf5CjnK186PFlk96abEMb3G/nhn8BTpakh6FBEi7f2roNFFJKU7YSiRyAwfuZEk1bV3n9qN8cNBisZpuiaz8E9C9EaDVFqDPLMCLK7WVY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:c74bc6e4-9763-4038-8d77-7b4b1580ae5c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:4a3cb8e4-e572-4957-be22-d8f73f3158f9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 14169dd9596247b6b0549e984d18666c-20221026
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <eddie.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1213113210; Wed, 26 Oct 2022 01:10:27 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 26 Oct 2022 15:39:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 26 Oct 2022 15:39:50 +0800
From: Eddie Huang <eddie.huang@mediatek.com>
To: Asutosh Das <quic_asutoshd@quicinc.com>, <martin.petersen@oracle.com>,
	<stanley.chu@mediatek.com>, <bvanassche@acm.org>,
	<linux-scsi@vger.kernel.org>
CC: <avri.altman@wdc.com>, <liang-yen.wang@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <cc.chou@mediatek.com>,
	<powen.kao@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>
Subject: [PATCH v1 2/2] ufs: mtk-host: Add MCQ feature
Date: Wed, 26 Oct 2022 15:39:43 +0800
Message-ID: <20221026073943.22111-3-eddie.huang@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20221026073943.22111-1-eddie.huang@mediatek.com>
References: <20221026073943.22111-1-eddie.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_011039_016592_8EEE06A9 
X-CRM114-Status: GOOD (  13.05  )
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

Add Mediatek mcq resource and runtime configuration function
to support MCQ capability

Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 37 +++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-mediatek.h |  7 +++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index c958279..3f5fc05 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -31,6 +31,8 @@
 #define CREATE_TRACE_POINTS
 #include "ufs-mediatek-trace.h"
 
+#define MCQ_QUEUE_OFFSET(c) ((((c) >> 16) & 0xFF) * 0x200)
+
 static const struct ufs_dev_quirk ufs_mtk_dev_fixups[] = {
 	{ .wmanufacturerid = UFS_ANY_VENDOR,
 	  .model = UFS_ANY_MODEL,
@@ -833,6 +835,8 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 
 	host->ip_ver = ufshcd_readl(hba, REG_UFS_MTK_IP_VER);
 
+	hba->caps |= UFSHCD_CAP_MCQ_EN;
+
 	goto out;
 
 out_variant_clear:
@@ -1314,6 +1318,37 @@ static void ufs_mtk_event_notify(struct ufs_hba *hba,
 	trace_ufs_mtk_event(evt, val);
 }
 
+static int ufs_mtk_op_runtime_config(struct ufs_hba *hba)
+{
+	struct ufshcd_mcq_opr_info_t *opr;
+	int i;
+
+	for (i = 0; i < OPR_MAX; i++) {
+		opr = &hba->mcq_opr[i];
+		opr->stride = REG_UFS_MCQ_STRIDE;
+	}
+
+	hba->mcq_opr[OPR_SQD].offset = REG_UFS_MTK_SQD;
+	hba->mcq_opr[OPR_SQIS].offset = REG_UFS_MTK_SQIS;
+	hba->mcq_opr[OPR_CQD].offset = REG_UFS_MTK_CQD;
+	hba->mcq_opr[OPR_CQIS].offset = REG_UFS_MTK_CQIS;
+
+	hba->mcq_opr[OPR_SQD].base = hba->mmio_base + REG_UFS_MTK_SQD;
+	hba->mcq_opr[OPR_SQIS].base = hba->mmio_base + REG_UFS_MTK_SQIS;
+	hba->mcq_opr[OPR_CQD].base = hba->mmio_base + REG_UFS_MTK_CQD;
+	hba->mcq_opr[OPR_CQIS].base = hba->mmio_base + REG_UFS_MTK_CQIS;
+
+	return 0;
+}
+
+static int ufs_mtk_config_mcq_resource(struct ufs_hba *hba)
+{
+	hba->mcq_base = hba->mmio_base +
+					MCQ_QUEUE_OFFSET(hba->mcq_capabilities);
+
+	return 0;
+}
+
 /*
  * struct ufs_hba_mtk_vops - UFS MTK specific variant operations
  *
@@ -1335,6 +1370,8 @@ static const struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
 	.dbg_register_dump   = ufs_mtk_dbg_register_dump,
 	.device_reset        = ufs_mtk_device_reset,
 	.event_notify        = ufs_mtk_event_notify,
+	.op_runtime_config   = ufs_mtk_op_runtime_config,
+	.config_mcq_resource = ufs_mtk_config_mcq_resource,
 };
 
 /**
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index aa26d41..febf702 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -26,6 +26,13 @@
 #define REG_UFS_DEBUG_SEL_B2        0x22D8
 #define REG_UFS_DEBUG_SEL_B3        0x22DC
 
+#define REG_UFS_MTK_SQD             0x2800
+#define REG_UFS_MTK_SQIS            0x2814
+#define REG_UFS_MTK_CQD             0x281C
+#define REG_UFS_MTK_CQIS            0x2824
+
+#define REG_UFS_MCQ_STRIDE          0x30
+
 /*
  * Ref-clk control
  *
-- 
2.9.2


