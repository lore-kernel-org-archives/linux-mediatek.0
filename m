Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2F4C678DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 06:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fk33FPtnXBw1fTUlPBwWom7OL72PluLaNqb9cx3z7kI=; b=F+OjZ28tF7WznXxxVIYxj+gt/+
	UC7+wariY0FgsUqyABTnhT5TgCIB1YaTz3bprdjV21caiOJzg2mX5t3oQv3WXvnsADN1Xw2P257vN
	RoesgYKpmeMfgrrs+hXAEN56rnm9AqhRTVbXENGqoayYstmjnGudxz9EjT6gUgcGkYliFxhKk1oEK
	at7dDq+yB0zFDAKt4aya0mXXa8hNwSeO9RfU/zsIA3AkzR+E01ooMMo8vrCZc8mOl/h5oeejaAqk8
	0eyU6ENkgA3zWumuHszZOoDgiN0n4BDD8/ypD7XdFaztbOrgebMIdQd+0alq6kxXwUHuZIz3KRXf9
	jzYMpyeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZRFG-00GRMl-J5; Tue, 07 Mar 2023 06:56:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZREu-00GR8I-Pb; Tue, 07 Mar 2023 06:56:02 +0000
X-UUID: 1af456a2bcb511edbbe3f76fe852e059-20230306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fk33FPtnXBw1fTUlPBwWom7OL72PluLaNqb9cx3z7kI=;
	b=HrugTjwcwxMSXcukAh/rnq1qhWa6Pz5K8Ut7SM0SoLHYhOc6aDcQHPgDTd7MhPEkskSM1naSzwrc0LLuPwAA93a8bklykKD3n4jqmYQxxJHLdeDJnKHH74YRPacb9HbhW+pJSDKDUS3dCdIw7k30QLtUo6rYwJdY+NafIf1fRvE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:116326c7-2191-41e5-9c67-12fbad0f07df,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.20,REQID:116326c7-2191-41e5-9c67-12fbad0f07df,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:25b5999,CLOUDID:43019127-564d-42d9-9875-7c868ee415ec,B
	ulkID:230307145546YW93MDZD,BulkQuantity:1,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 1af456a2bcb511edbbe3f76fe852e059-20230306
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <powen.kao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1660806904; Mon, 06 Mar 2023 23:55:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 7 Mar 2023 14:55:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 7 Mar 2023 14:55:21 +0800
From: Po-Wen Kao <powen.kao@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Stanley Chu <stanley.chu@mediatek.com>, "James E.J. Bottomley"
	<jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
CC: <wsd_upstream@mediatek.com>, <peter.wang@mediatek.com>,
	<powen.kao@mediatek.com>, <alice.chao@mediatek.com>,
	<naomi.chu@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<cc.chou@mediatek.com>, <eddie.huang@mediatek.com>,
	<mason.zhang@mediatek.com>, <chaotian.jing@mediatek.com>,
	<jiajie.hao@mediatek.com>
Subject: [PATCH v4 5/5] scsi: ufs: ufs-mediatek: Add MCQ support for MTK platform
Date: Tue, 7 Mar 2023 14:54:46 +0800
Message-ID: <20230307065448.15279-6-powen.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230307065448.15279-1-powen.kao@mediatek.com>
References: <20230307065448.15279-1-powen.kao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_225600_875188_48DC15C6 
X-CRM114-Status: GOOD (  25.16  )
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

Changes
- Implement vops and setup irq
- Fix pm flow under mcq mode

Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
---
 drivers/ufs/host/ufs-mediatek.c | 192 +++++++++++++++++++++++++++++++-
 drivers/ufs/host/ufs-mediatek.h |  33 ++++++
 2 files changed, 223 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 73e217260390..fdd22a97fdb4 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -30,6 +30,14 @@
 #define CREATE_TRACE_POINTS
 #include "ufs-mediatek-trace.h"
 
+static int  ufs_mtk_config_mcq(struct ufs_hba *hba, bool irq);
+static void ufs_mtk_dbg_register_dump(struct ufs_hba *hba);
+
+#define MAX_SUPP_MAC 64
+#define MCQ_QUEUE_OFFSET(c) ((((c) >> 16) & 0xFF) * 0x200)
+
+static unsigned int mtk_mcq_irq[UFSHCD_MAX_Q_NR];
+
 static const struct ufs_dev_quirk ufs_mtk_dev_fixups[] = {
 	{ .wmanufacturerid = UFS_ANY_VENDOR,
 	  .model = UFS_ANY_MODEL,
@@ -843,6 +851,19 @@ static void ufs_mtk_vreg_fix_vccqx(struct ufs_hba *hba)
 	}
 }
 
+static void ufs_mtk_init_interrupt(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	int i;
+
+	host->mcq_nr_intr = UFSHCD_MAX_Q_NR;
+
+	for (i = 0; i < host->mcq_nr_intr; i++) {
+		host->mcq_intr_info[i].hba = hba;
+		host->mcq_intr_info[i].intr = mtk_mcq_irq[i];
+	}
+}
+
 /**
  * ufs_mtk_init - find other essential mmio bases
  * @hba: host controller instance
@@ -879,6 +900,8 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	/* Initialize host capability */
 	ufs_mtk_init_host_caps(hba);
 
+	ufs_mtk_init_interrupt(hba);
+
 	err = ufs_mtk_bind_mphy(hba);
 	if (err)
 		goto out_variant_clear;
@@ -1174,7 +1197,16 @@ static int ufs_mtk_link_set_hpm(struct ufs_hba *hba)
 	else
 		return err;
 
-	err = ufshcd_make_hba_operational(hba);
+	if (!hba->mcq_enabled) {
+		err = ufshcd_make_hba_operational(hba);
+	} else {
+		ufs_mtk_config_mcq(hba, false);
+		ufshcd_mcq_make_queues_operational(hba);
+		ufshcd_mcq_config_mac(hba, hba->nutrs);
+		ufshcd_writel(hba, ufshcd_readl(hba, REG_UFS_MEM_CFG) | 0x1,
+			      REG_UFS_MEM_CFG);
+	}
+
 	if (err)
 		return err;
 
@@ -1361,6 +1393,12 @@ static int ufs_mtk_apply_dev_quirks(struct ufs_hba *hba)
 		ufshcd_dme_set(hba, UIC_ARG_MIB(PA_HIBERN8TIME), 10);
 	}
 
+	/*
+	 * Disable MCQ_CQ_EVENT interrupt.
+	 * Use CQ Tail Entry Push Status instead.
+	 */
+	ufshcd_disable_intr(hba, MCQ_CQ_EVENT_STATUS);
+
 	/*
 	 * Decide waiting time before gating reference clock and
 	 * after ungating reference clock according to vendors'
@@ -1498,6 +1536,115 @@ static int ufs_mtk_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
 	return 0;
 }
 
+static int ufs_mtk_get_hba_mac(struct ufs_hba *hba)
+{
+	return MAX_SUPP_MAC;
+}
+
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
+static int ufs_mtk_mcq_config_resource(struct ufs_hba *hba)
+{
+	hba->mcq_base = hba->mmio_base + MCQ_QUEUE_OFFSET(hba->mcq_capabilities);
+	return 0;
+}
+
+static irqreturn_t ufs_mtk_mcq_intr(int irq, void *__intr_info)
+{
+	struct ufs_mtk_mcq_intr_info *mcq_intr_info = __intr_info;
+	struct ufs_hba *hba = mcq_intr_info->hba;
+	struct ufs_hw_queue *hwq;
+	u32 events;
+	int i = mcq_intr_info->qid;
+
+	hwq = &hba->uhq[i];
+
+	events = ufshcd_mcq_read_cqis(hba, i);
+	if (events)
+		ufshcd_mcq_write_cqis(hba, events, i);
+
+	if (events & UFSHCD_MCQ_CQIS_TAIL_ENT_PUSH_STS)
+		ufshcd_mcq_poll_cqe_nolock(hba, hwq);
+
+	return IRQ_HANDLED;
+}
+
+static int ufs_mtk_config_mcq_irq(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	u32 irq, i;
+	int ret;
+
+	for (i = 0; i < host->mcq_nr_intr; i++) {
+		irq = host->mcq_intr_info[i].intr;
+		if (irq == MTK_MCQ_INVALID_IRQ) {
+			dev_err(hba->dev, "invalid irq. %d\n", i);
+			return -ENOPARAM;
+		}
+
+		host->mcq_intr_info[i].qid = i;
+		ret = devm_request_irq(hba->dev, irq, ufs_mtk_mcq_intr, 0, UFSHCD,
+				       &host->mcq_intr_info[i]);
+
+		dev_info(hba->dev, "request irq %d intr %s\n", irq, ret ? "failed" : "");
+
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int ufs_mtk_config_mcq(struct ufs_hba *hba, bool irq)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	int ret = 0;
+
+	if (!host->mcq_set_intr) {
+		/* Disable irq option register */
+		ufshcd_rmwl(hba, MCQ_INTR_EN_MSK, 0, REG_UFS_MMIO_OPT_CTRL_0);
+
+		if (irq)
+			ret = ufs_mtk_config_mcq_irq(hba);
+
+		if (ret)
+			return ret;
+
+		host->mcq_set_intr = true;
+	}
+
+	ufshcd_rmwl(hba, MCQ_AH8, MCQ_AH8, REG_UFS_MMIO_OPT_CTRL_0);
+	ufshcd_rmwl(hba, MCQ_INTR_EN_MSK, MCQ_MULTI_INTR_EN, REG_UFS_MMIO_OPT_CTRL_0);
+
+	return 0;
+}
+
+static int ufs_mtk_config_esi(struct ufs_hba *hba)
+{
+	return ufs_mtk_config_mcq(hba, true);
+}
+
 /*
  * struct ufs_hba_mtk_vops - UFS MTK specific variant operations
  *
@@ -1521,8 +1668,43 @@ static const struct ufs_hba_variant_ops ufs_hba_mtk_vops = {
 	.event_notify        = ufs_mtk_event_notify,
 	.config_scaling_param = ufs_mtk_config_scaling_param,
 	.clk_scale_notify    = ufs_mtk_clk_scale_notify,
+	/* mcq vops */
+	.get_hba_mac         = ufs_mtk_get_hba_mac,
+	.op_runtime_config   = ufs_mtk_op_runtime_config,
+	.mcq_config_resource = ufs_mtk_mcq_config_resource,
+	.config_esi          = ufs_mtk_config_esi,
 };
 
+static int ufs_mtk_mcq_get_irq(struct platform_device *pdev)
+{
+	int i, irq, cnt;
+
+	for (i = 0; i < UFSHCD_MAX_Q_NR; i++)
+		mtk_mcq_irq[i] = MTK_MCQ_INVALID_IRQ;
+
+	cnt = platform_irq_count(pdev);
+
+	if (cnt < 0)
+		return cnt;
+
+	/* no irq for mcq */
+	if (cnt == 1)
+		return 0;
+
+	for (i = 0; i < UFSHCD_MAX_Q_NR; i++) {
+		/* irq index 0 is ufshcd system irq, sq, cq irq start from index 1 */
+		irq = platform_get_irq(pdev, i + 1);
+		if (irq < 0) {
+			dev_err(&pdev->dev, "get platform mcq irq fail: %d\n", i);
+			return irq;
+		}
+		mtk_mcq_irq[i] = irq;
+		dev_info(&pdev->dev, "get platform mcq irq: %d, %d\n", i, irq);
+	}
+
+	return 0;
+}
+
 /**
  * ufs_mtk_probe - probe routine of the driver
  * @pdev: pointer to Platform device handle
@@ -1562,12 +1744,18 @@ static int ufs_mtk_probe(struct platform_device *pdev)
 	}
 
 skip_reset:
+	err = ufs_mtk_mcq_get_irq(pdev);
+	if (err) {
+		dev_err(dev, "get irq failed %d\n", err);
+		goto out;
+	}
+
 	/* perform generic probe */
 	err = ufshcd_pltfrm_init(pdev, &ufs_hba_mtk_vops);
 
 out:
 	if (err)
-		dev_info(dev, "probe failed %d\n", err);
+		dev_err(dev, "probe failed %d\n", err);
 
 	of_node_put(reset_node);
 	return err;
diff --git a/drivers/ufs/host/ufs-mediatek.h b/drivers/ufs/host/ufs-mediatek.h
index 2fc6d7b87694..542b4c3a763c 100644
--- a/drivers/ufs/host/ufs-mediatek.h
+++ b/drivers/ufs/host/ufs-mediatek.h
@@ -10,11 +10,27 @@
 #include <linux/pm_qos.h>
 #include <linux/soc/mediatek/mtk_sip_svc.h>
 
+/*
+ * MCQ define and struct
+ */
+#define UFSHCD_MAX_Q_NR 8
+#define MTK_MCQ_INVALID_IRQ	0xFFFF
+
+/* REG_UFS_MMIO_OPT_CTRL_0 160h */
+#define EHS_EN                  0x1
+#define PFM_IMPV                0x2
+#define MCQ_MULTI_INTR_EN       0x4
+#define MCQ_CMB_INTR_EN         0x8
+#define MCQ_AH8                 0x10
+
+#define MCQ_INTR_EN_MSK         (MCQ_MULTI_INTR_EN | MCQ_CMB_INTR_EN)
+
 /*
  * Vendor specific UFSHCI Registers
  */
 #define REG_UFS_XOUFS_CTRL          0x140
 #define REG_UFS_REFCLK_CTRL         0x144
+#define REG_UFS_MMIO_OPT_CTRL_0     0x160
 #define REG_UFS_EXTREG              0x2100
 #define REG_UFS_MPHYCTRL            0x2200
 #define REG_UFS_MTK_IP_VER          0x2240
@@ -26,6 +42,13 @@
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
@@ -136,6 +159,12 @@ struct ufs_mtk_hw_ver {
 	u8 major;
 };
 
+struct ufs_mtk_mcq_intr_info {
+	struct ufs_hba *hba;
+	u32 intr;
+	u8 qid;
+};
+
 struct ufs_mtk_host {
 	struct phy *mphy;
 	struct pm_qos_request pm_qos_req;
@@ -155,6 +184,10 @@ struct ufs_mtk_host {
 	u16 ref_clk_ungating_wait_us;
 	u16 ref_clk_gating_wait_us;
 	u32 ip_ver;
+
+	bool mcq_set_intr;
+	int mcq_nr_intr;
+	struct ufs_mtk_mcq_intr_info mcq_intr_info[UFSHCD_MAX_Q_NR];
 };
 
 /*
-- 
2.18.0


