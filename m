Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E104EC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 04:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SzXqMwnMUYUrvjoSVir0fP8kScyKsUlvqWallfPjjWE=; b=rhJnH7h0VWO1U8bEPai0xZg/pe
	Qng7H+ybmRJIbGu5+XKk6ftp7ZvRpy1z19B8cMP6fEVrmPev4SbUD8N5jHtF/VO3gcegL3fdEOZRh
	YrF6RumM+uetD5XAjR6d/bmLsw9nCQtFC3QS5BLMbmUaIxzYvu5jzqVfvm9yZcJ90CqkUTDZ1w8+b
	QHCdN5vSK0tfQo0tbw4jQlA3JYivZ+FOvvbBxpg2nHEiqApijvmkeaGDPqiWsKskrtU00hs0Nm/pl
	sj8KuZaXVEYNIvJloCl4fycMhkBBiUjcaYLkfhwgZ5iTJiwgmoVRgGR/G5MPdYlbjpGNr0QETIMr3
	Hxodh2rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od26W-008EcG-5T; Tue, 27 Sep 2022 04:21:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od26T-008EbB-1x; Tue, 27 Sep 2022 04:21:54 +0000
X-UUID: 553cd39f17bb4c268ff8fbd0823e4d2d-20220926
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=SzXqMwnMUYUrvjoSVir0fP8kScyKsUlvqWallfPjjWE=;
	b=PtGfUx2Y/hPnfD4BhubB6uUjJq/2LO68yI5v5cGIvkW6xNbNlFaxms2S/D0dSj9CPvUay3MxF2kvVt4gmTUc4Ugi+5kSET4Zw7fsx/rxUWpNcA4UgPwjlF+kLtBiuXRemvcdMmzTYX6saH+Ox4bz7MLtV7rWplWhUwCIKKYmAog=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:1b1e717a-07ac-4367-b3ef-97bd5b7035f2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:a0842007-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 553cd39f17bb4c268ff8fbd0823e4d2d-20220926
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2079214577; Mon, 26 Sep 2022 21:21:44 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 27 Sep 2022 12:01:07 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Sep 2022 12:01:06 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [PATCH v4] mailbox: mtk-cmdq: fix gce timeout issue
Date: Tue, 27 Sep 2022 12:01:05 +0800
Message-ID: <20220927040105.21494-1-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_212153_151785_2C963F50 
X-CRM114-Status: GOOD (  18.33  )
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

1. enable gce ddr enable(gce reigster offset 0x48, bit 16 to 18) when gce work,
and disable gce ddr enable when gce work job done
2. add cmdq ddr enable/disable api, and control gce ddr enable/disable
to make sure it could protect when cmdq is multiple used by display and mdp

this is only for some SOC which has flag "gce_ddr_en".
for this kind of gce, there is a handshake flow between gce and ddr
hardware,
if not set ddr enable flag of gce, ddr will fall into idle mode,
then gce instructions will not process done.
we need set this flag of gce to tell ddr when gce is idle or busy
controlled by software flow.

ddr problem is a special case.
when test suspend/resume case, gce sometimes will pull ddr, and ddr can
not go to suspend.
if we set gce register 0x48 to 0x7, will fix this gce pull ddr issue,
as you have referred [1] and [2] (8192 and 8195)
but for mt8186, the gce is more special, except setting of [1] and [2],
we need add more setting set gce register 0x48 to (0x7 << 16 | 0x7)
when gce working to make sure gce could process all instructions ok.
this case just need normal bootup, if we not set this, display cmdq
task will timeout, and chrome homescreen will always black screen.

and with this patch, we have done these test on mt8186:
1.suspend/resume
2.boot up to home screen
3.playback video with youtube.

suspend issue is special gce hardware issue, gce client  driver
command already process done, but gce still pull ddr.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>

---
change since v3:
split cmdq_sw_ddr_enable/cmdq_sw_ddr_disable into single api to
control mt8186 gce ddr enable flow
---

---
 drivers/mailbox/mtk-cmdq-mailbox.c | 61 ++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 9465f9081515..650a1ed1a579 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -38,6 +38,8 @@
 #define CMDQ_THR_PRIORITY		0x40
 
 #define GCE_GCTL_VALUE			0x48
+#define GCE_CTRL_BY_SW				GENMASK(18, 16)
+#define GCE_DDR_EN				GENMASK(2, 0)
 
 #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
 #define CMDQ_THR_ENABLED		0x1
@@ -80,16 +82,51 @@ struct cmdq {
 	bool			suspended;
 	u8			shift_pa;
 	bool			control_by_sw;
+	bool			sw_ddr_en;
 	u32			gce_num;
+	atomic_t		usage;
+	spinlock_t		lock;
 };
 
 struct gce_plat {
 	u32 thread_nr;
 	u8 shift;
 	bool control_by_sw;
+	bool sw_ddr_en;
 	u32 gce_num;
 };
 
+static void cmdq_sw_ddr_enable(struct cmdq *cmdq)
+{
+	s32 usage;
+	unsigned long flags;
+
+	spin_lock_irqsave(&cmdq->lock, flags);
+
+	usage = atomic_inc_return(&cmdq->usage);
+
+	if (usage <= 0)
+		dev_err(cmdq->mbox.dev, "ref count %d suspend %d\n",
+			usage, cmdq->suspended);
+	else if (usage == 1)
+		writel(GCE_DDR_EN + GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
+
+	spin_unlock_irqrestore(&cmdq->lock, flags);
+}
+
+static void cmdq_sw_ddr_disable(struct cmdq *cmdq)
+{
+	s32 usage;
+
+	usage = atomic_dec_return(&cmdq->usage);
+
+	if (usage < 0)
+		dev_err(cmdq->mbox.dev, "ref count %d suspend %d\n",
+			usage, cmdq->suspended);
+	else if (usage == 0)
+		writel(GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
+}
+
 u8 cmdq_get_shift_pa(struct mbox_chan *chan)
 {
 	struct cmdq *cmdq = container_of(chan->mbox, struct cmdq, mbox);
@@ -266,6 +303,10 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 
 	if (list_empty(&thread->task_busy_list)) {
 		cmdq_thread_disable(cmdq, thread);
+
+		if (cmdq->sw_ddr_en)
+			cmdq_sw_ddr_disable(cmdq);
+
 		clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
 	}
 }
@@ -357,6 +398,8 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	if (list_empty(&thread->task_busy_list)) {
 		WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
 
+		if (cmdq->sw_ddr_en)
+			cmdq_sw_ddr_enable(cmdq);
 		/*
 		 * The thread reset will clear thread related register to 0,
 		 * including pc, end, priority, irq, suspend and enable. Thus
@@ -427,6 +470,9 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 		kfree(task);
 	}
 
+	if (cmdq->sw_ddr_en)
+		cmdq_sw_ddr_disable(cmdq);
+
 	cmdq_thread_disable(cmdq, thread);
 	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
 
@@ -468,6 +514,10 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 
 	cmdq_thread_resume(thread);
 	cmdq_thread_disable(cmdq, thread);
+
+	if (cmdq->sw_ddr_en)
+		cmdq_sw_ddr_disable(cmdq);
+
 	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
 
 out:
@@ -543,6 +593,7 @@ static int cmdq_probe(struct platform_device *pdev)
 	cmdq->thread_nr = plat_data->thread_nr;
 	cmdq->shift_pa = plat_data->shift;
 	cmdq->control_by_sw = plat_data->control_by_sw;
+	cmdq->sw_ddr_en = plat_data->sw_ddr_en;
 	cmdq->gce_num = plat_data->gce_num;
 	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
 	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
@@ -615,6 +666,7 @@ static int cmdq_probe(struct platform_device *pdev)
 
 	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
 
+	spin_lock_init(&cmdq->lock);
 	cmdq_init(cmdq);
 
 	return 0;
@@ -660,9 +712,18 @@ static const struct gce_plat gce_plat_v6 = {
 	.gce_num = 2
 };
 
+static const struct gce_plat gce_plat_v7 = {
+	.thread_nr = 24,
+	.shift = 3,
+	.control_by_sw = true,
+	.sw_ddr_en = true,
+	.gce_num = 1
+};
+
 static const struct of_device_id cmdq_of_ids[] = {
 	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_v2},
 	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_v3},
+	{.compatible = "mediatek,mt8186-gce", .data = (void *)&gce_plat_v7},
 	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_v4},
 	{.compatible = "mediatek,mt8192-gce", .data = (void *)&gce_plat_v5},
 	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_v6},
-- 
2.25.1


