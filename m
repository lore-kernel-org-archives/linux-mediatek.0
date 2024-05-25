Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED22EC25B7A
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 May 2024 23:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaqTq4vfD7ofPN8So6mXirCjSkY58QkuXVkXd7MqJ2E=; b=Mli3LdnsjizNKeGzbHU40v9bue
	bwjslpiUcftBdY/2N1sjoWru4YH0TJ4g3oj9is9XSkNV6+uGy56KhVOWz5Dq2nSltcV/wvfdxZNKm
	NqLx4x4fzFaYp2sxoXmLScUkZVvYl1kDPGzMmKBPMF1DVzXWWuVoEf8eGObRiDKpdvUowIF/pwWni
	8wbJck32kN+YQUBTySzRqqoJTBEkdMQPU9hpO/0MbibZr8B0NMvDqTtA79riizF5opmp3goEaM8sA
	dYg0qqrUy6Bn+4NUMrFOmZycKFWxpHiTzyr+hcVxPzyPKaiRZHfl5EQSywhiE9GVj+VQvGp/WVnT/
	AKh0nuUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sB0VR-0000000BpZf-3OUc;
	Sat, 25 May 2024 23:08:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sB0Uw-0000000BpDC-0UYV;
	Sat, 25 May 2024 23:08:24 +0000
X-UUID: aaa6ec0c1aeb11ef82c84f6416ccf2f3-20240525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=aaqTq4vfD7ofPN8So6mXirCjSkY58QkuXVkXd7MqJ2E=;
	b=f7XyX4HjtMl+Kg0RKgsCGxj5ZBen9VfcyNHa9HUo1qQRhr86WwzT3ZBeeS9Y8jhmclhkTwGEkM9RtJBbIiAe7UVTXVcATHCleEOsVOWU/dlwGAg7jA4WtpsI3Q+6EzQVs9sZ27eys7tqAC2JFpA0KLLAuaU6Yhax4dikwALIGgM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:100a15a6-5ab6-4e68-9ae0-ae6e9577f45a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:e1db4f84-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: aaa6ec0c1aeb11ef82c84f6416ccf2f3-20240525
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1726824560; Sat, 25 May 2024 16:08:15 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 26 May 2024 07:08:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 26 May 2024 07:08:12 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Conor Dooley <conor+dt@kernel.org>, Jason-ch Chen
	<jason-ch.chen@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 7/8] mailbox: mediatek: Add secure CMDQ driver support for CMDQ driver
Date: Sun, 26 May 2024 07:08:09 +0800
Message-ID: <20240525230810.24623-8-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240525230810.24623-1-jason-jh.lin@mediatek.com>
References: <20240525230810.24623-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.331500-8.000000
X-TMASE-MatchedRID: ypIBM/SXej8len1U/pCyekKcYi5Qw/RVCt59Uh3p/NVZps+y1VXzqUY/
	auwRJnMLb1ikhugskqP8Qxx3otU4NmJZXQNDzktShK8o4aoss8qH7D1bP/FcOvNhzIgXtFJVPJ0
	5UREtjOWcPcDHCp4L+hE+nFva9arC5xffqy+Ix5G3UCG/IQp2PpnaxzJFBx6vEy7p6uycXL113e
	8TptaRwSZE5D95I7+IgDLqnrRlXrZ8nn9tnqel2LI7zVffJqTzFJTbFv45b0iNEEeRxpWUPHj6q
	WblMMhhDY7snO1QQatxWuv5Vx1ozX7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.331500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9382CE30CE5007AD8FD4F9ABEAA671DF515C62436107DF6F6C49EF57B65D06B72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_160822_265836_A42B55B1 
X-CRM114-Status: GOOD (  20.62  )
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

CMDQ driver will probe a secure CMDQ driver when has_sec flag
in platform data is true and its device node in dts has defined a
event id of CMDQ_SYNC_TOKEN_SEC_EOF.

Secure CMDQ driver support on mt8188 and mt8195 currently.
So add a has_secure flag to their driver data to probe it.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 76 ++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 025e53549a45..5c606684b07b 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -15,6 +15,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/mailbox_controller.h>
 #include <linux/mailbox/mtk-cmdq-mailbox.h>
+#include <linux/mailbox/mtk-cmdq-sec-mailbox.h>
 #include <linux/of.h>
 
 #define CMDQ_MBOX_AUTOSUSPEND_DELAY_MS	100
@@ -55,11 +56,22 @@
 #define CMDQ_JUMP_BY_OFFSET		0x10000000
 #define CMDQ_JUMP_BY_PA			0x10000001
 
+#define CMDQ_THR_IDX(thread, cmdq)	(((thread)->base - (cmdq)->base - CMDQ_THR_BASE) \
+					 / CMDQ_THR_SIZE)
+
+#define CMDQ_IS_SECURE_THREAD(idx, cmdq) ((cmdq)->pdata->has_secure && \
+					  (idx) >= (cmdq)->pdata->secure_thread_min && \
+					  (idx) < (cmdq)->pdata->secure_thread_min + \
+					  (cmdq)->pdata->secure_thread_nr)
+
 struct gce_plat {
 	u32 thread_nr;
 	u8 shift;
 	bool control_by_sw;
 	bool sw_ddr_en;
+	bool has_secure;
+	u32 secure_thread_nr;
+	u32 secure_thread_min;
 	u32 gce_num;
 };
 
@@ -368,6 +380,7 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
 	struct cmdq_task *task;
 	unsigned long curr_pa, end_pa;
+	u32 idx = CMDQ_THR_IDX(thread, cmdq);
 	int ret;
 
 	/* Client should not flush new tasks if suspended. */
@@ -377,6 +390,13 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	if (ret < 0)
 		return ret;
 
+	if (CMDQ_IS_SECURE_THREAD(idx, cmdq)) {
+		ret = cmdq_sec_mbox.ops->send_data(chan, data);
+		pm_runtime_mark_last_busy(cmdq->mbox.dev);
+		pm_runtime_put_autosuspend(cmdq->mbox.dev);
+		return ret;
+	}
+
 	task = kzalloc(sizeof(*task), GFP_ATOMIC);
 	if (!task) {
 		pm_runtime_put_autosuspend(cmdq->mbox.dev);
@@ -436,6 +456,13 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 
 static int cmdq_mbox_startup(struct mbox_chan *chan)
 {
+	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
+	struct cmdq_thread *thread = (struct cmdq_thread *)chan->con_priv;
+	u32 idx = CMDQ_THR_IDX(thread, cmdq);
+
+	if (CMDQ_IS_SECURE_THREAD(idx, cmdq))
+		cmdq_sec_mbox.ops->startup(chan);
+
 	return 0;
 }
 
@@ -445,9 +472,17 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
 	struct cmdq_task *task, *tmp;
 	unsigned long flags;
+	u32 idx = CMDQ_THR_IDX(thread, cmdq);
 
 	WARN_ON(pm_runtime_get_sync(cmdq->mbox.dev) < 0);
 
+	if (CMDQ_IS_SECURE_THREAD(idx, cmdq)) {
+		cmdq_sec_mbox.ops->shutdown(chan);
+		pm_runtime_mark_last_busy(cmdq->mbox.dev);
+		pm_runtime_put_autosuspend(cmdq->mbox.dev);
+		return;
+	}
+
 	spin_lock_irqsave(&thread->chan->lock, flags);
 	if (list_empty(&thread->task_busy_list))
 		goto done;
@@ -488,12 +523,20 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 	struct cmdq_task *task, *tmp;
 	unsigned long flags;
 	u32 enable;
+	u32 idx = CMDQ_THR_IDX(thread, cmdq);
 	int ret;
 
 	ret = pm_runtime_get_sync(cmdq->mbox.dev);
 	if (ret < 0)
 		return ret;
 
+	if (CMDQ_IS_SECURE_THREAD(idx, cmdq)) {
+		cmdq_sec_mbox.ops->flush(chan, timeout);
+		pm_runtime_mark_last_busy(cmdq->mbox.dev);
+		pm_runtime_put_autosuspend(cmdq->mbox.dev);
+		return 0;
+	}
+
 	spin_lock_irqsave(&thread->chan->lock, flags);
 	if (list_empty(&thread->task_busy_list))
 		goto out;
@@ -569,6 +612,7 @@ static int cmdq_probe(struct platform_device *pdev)
 	int alias_id = 0;
 	static const char * const clk_name = "gce";
 	static const char * const clk_names[] = { "gce0", "gce1" };
+	u32 hwid = 0;
 
 	cmdq = devm_kzalloc(dev, sizeof(*cmdq), GFP_KERNEL);
 	if (!cmdq)
@@ -594,6 +638,8 @@ static int cmdq_probe(struct platform_device *pdev)
 		dev, cmdq->base, cmdq->irq);
 
 	if (cmdq->pdata->gce_num > 1) {
+		hwid = of_alias_get_id(dev->of_node, clk_name);
+
 		for_each_child_of_node(phandle->parent, node) {
 			alias_id = of_alias_get_id(node, clk_name);
 			if (alias_id >= 0 && alias_id < cmdq->pdata->gce_num) {
@@ -643,6 +689,30 @@ static int cmdq_probe(struct platform_device *pdev)
 		cmdq->mbox.chans[i].con_priv = (void *)&cmdq->thread[i];
 	}
 
+	if (cmdq->pdata->has_secure) {
+		struct platform_device *cmdq_sec;
+		static struct gce_sec_plat sec_plat = {0};
+
+		if (of_property_read_u32_index(dev->of_node, "mediatek,gce-events", 0,
+					       &sec_plat.cmdq_event) == 0) {
+			sec_plat.mbox = &cmdq->mbox;
+			sec_plat.base = cmdq->base;
+			sec_plat.hwid = hwid;
+			sec_plat.secure_thread_nr = cmdq->pdata->secure_thread_nr;
+			sec_plat.secure_thread_min = cmdq->pdata->secure_thread_min;
+			sec_plat.shift = cmdq->pdata->shift;
+
+			cmdq_sec = platform_device_register_data(dev, "mtk-cmdq-sec",
+								 PLATFORM_DEVID_AUTO,
+								 &sec_plat,
+								 sizeof(sec_plat));
+			if (IS_ERR(cmdq_sec)) {
+				dev_err(dev, "failed to register platform_device mtk-cmdq-sec\n");
+				return PTR_ERR(cmdq_sec);
+			}
+		}
+	}
+
 	err = devm_mbox_controller_register(dev, &cmdq->mbox);
 	if (err < 0) {
 		dev_err(dev, "failed to register mailbox: %d\n", err);
@@ -719,6 +789,9 @@ static const struct gce_plat gce_plat_mt8188 = {
 	.thread_nr = 32,
 	.shift = 3,
 	.control_by_sw = true,
+	.has_secure = true,
+	.secure_thread_nr = 2,
+	.secure_thread_min = 8,
 	.gce_num = 2
 };
 
@@ -733,6 +806,9 @@ static const struct gce_plat gce_plat_mt8195 = {
 	.thread_nr = 24,
 	.shift = 3,
 	.control_by_sw = true,
+	.has_secure = true,
+	.secure_thread_nr = 2,
+	.secure_thread_min = 8,
 	.gce_num = 2
 };
 
-- 
2.18.0


