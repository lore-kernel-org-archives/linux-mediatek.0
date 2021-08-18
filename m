Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77EFC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 02:41:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F25E6103A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 02:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F25E6103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tdC6qoUQe4edGEmdk+y2ndn21ukAVJHJQTC07MA7ivM=; b=CDNyss9Bzvvgiy
	qRVxsAT+TDQlgZ6zE8UW6c7iAWLS2rW+3bzzhSQqp5CK+3NfiAkX4b+Xi7aH6lRXPmZErzbKli8gA
	8juPZgW8+rzmGlGFQPE5X3dptv9to5kIvLj7m1SNdyLXa+Xxm0vMWuYx/1Psxi3Lhyfzr+m77gj1D
	QqaYVx7q+2gCtRDtdyle9K4i7ZMXVVOEB62+RFvyMvWWRUrmEGQoUc9HQmAjFaJuNX72b5d/w06jD
	YlGD7dcDezYVR3NQmRPP9RzhWjAjrrljkoIG9lewoTudQfCTqTqXKLpNRrfpTt7K8/A0tnK08rjNy
	+JHZOxil7aVj+D3zDK7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGBVp-003ydy-JZ; Wed, 18 Aug 2021 02:41:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGBVX-003yZx-Fw; Wed, 18 Aug 2021 02:40:52 +0000
X-UUID: 0fcd187b91434599b4836958cebe8a3f-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XT0cvcb153o7sixQW8RA3/zcdpuDwPovc+CLf0OyazY=; 
 b=eIDqOBwDsPXf0xSOI87VcE8fHcl55G7BWw4ublaNNlaL7cjNn4HU/La7vATh9hZoMNEeOmdEXUQkGnjLxJPcgHfNKm/tpK1sQwpJaNYea+3XJChs4hUuR5Nqef6RwazRUkFz0HMyCcktoPTwPf1QJ2FbpTrhtBWTXdcIT0d4fl8=;
X-UUID: 0fcd187b91434599b4836958cebe8a3f-20210817
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 371105376; Tue, 17 Aug 2021 19:40:41 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 19:40:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 10:40:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 18 Aug 2021 10:40:39 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, <chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <hsinyi@chromium.org>, <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>, 
 <singo.chang@mediatek.com>
Subject: [PATCH v5 5/5] mailbox: cmdq: add multi-gce clocks support for mt8195
Date: Wed, 18 Aug 2021 10:40:37 +0800
Message-ID: <20210818024037.11396-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210818024037.11396-1-jason-jh.lin@mediatek.com>
References: <20210818024037.11396-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_194048_230047_9684BCED 
X-CRM114-Status: GOOD (  21.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For the design of GCE hardware event signal transportation,
evnet rx will send the event signal to all GCE event merges
after receiving the event signal from the other hardware.

Because GCE event merges need to response to event rx, their
clocks must be enabled at that time.

To make sure all the gce clock is enabled while receiving the
hardware event, each cmdq mailbox should enable or disable
the others gce clk at the same time.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 90 +++++++++++++++++++++++-------
 1 file changed, 70 insertions(+), 20 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 205bde4ed6e6..3839faab68ca 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -19,6 +19,7 @@
 
 #define CMDQ_OP_CODE_MASK		(0xff << CMDQ_OP_CODE_SHIFT)
 #define CMDQ_NUM_CMD(t)			(t->cmd_buf_size / CMDQ_INST_SIZE)
+#define CMDQ_GCE_NUM_MAX		(2)
 
 #define CMDQ_CURR_IRQ_STATUS		0x10
 #define CMDQ_SYNC_TOKEN_UPDATE		0x68
@@ -73,14 +74,16 @@ struct cmdq {
 	u32			thread_nr;
 	u32			irq_mask;
 	struct cmdq_thread	*thread;
-	struct clk		*clock;
+	struct clk_bulk_data	clocks[CMDQ_GCE_NUM_MAX];
 	bool			suspended;
 	u8			shift_pa;
+	u32			gce_num;
 };
 
 struct gce_plat {
 	u32 thread_nr;
 	u8 shift;
+	u32 gce_num;
 };
 
 u8 cmdq_get_shift_pa(struct mbox_chan *chan)
@@ -120,11 +123,13 @@ static void cmdq_init(struct cmdq *cmdq)
 {
 	int i;
 
-	WARN_ON(clk_enable(cmdq->clock) < 0);
+	WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
+
 	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
 	for (i = 0; i <= CMDQ_MAX_EVENT; i++)
 		writel(i, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
-	clk_disable(cmdq->clock);
+
+	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
 }
 
 static int cmdq_thread_reset(struct cmdq *cmdq, struct cmdq_thread *thread)
@@ -262,7 +267,7 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 
 	if (list_empty(&thread->task_busy_list)) {
 		cmdq_thread_disable(cmdq, thread);
-		clk_disable(cmdq->clock);
+		clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
 	}
 }
 
@@ -307,7 +312,7 @@ static int cmdq_suspend(struct device *dev)
 	if (task_running)
 		dev_warn(dev, "exist running task(s) in suspend\n");
 
-	clk_unprepare(cmdq->clock);
+	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
 
 	return 0;
 }
@@ -316,7 +321,7 @@ static int cmdq_resume(struct device *dev)
 {
 	struct cmdq *cmdq = dev_get_drvdata(dev);
 
-	WARN_ON(clk_prepare(cmdq->clock) < 0);
+	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
 	cmdq->suspended = false;
 	return 0;
 }
@@ -325,8 +330,7 @@ static int cmdq_remove(struct platform_device *pdev)
 {
 	struct cmdq *cmdq = platform_get_drvdata(pdev);
 
-	clk_unprepare(cmdq->clock);
-
+	clk_bulk_unprepare(cmdq->gce_num, cmdq->clocks);
 	return 0;
 }
 
@@ -352,7 +356,8 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	task->pkt = pkt;
 
 	if (list_empty(&thread->task_busy_list)) {
-		WARN_ON(clk_enable(cmdq->clock) < 0);
+		WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
+
 		/*
 		 * The thread reset will clear thread related register to 0,
 		 * including pc, end, priority, irq, suspend and enable. Thus
@@ -424,7 +429,8 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 	}
 
 	cmdq_thread_disable(cmdq, thread);
-	clk_disable(cmdq->clock);
+	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
+
 done:
 	/*
 	 * The thread->task_busy_list empty means thread already disable. The
@@ -469,7 +475,7 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 
 	cmdq_thread_resume(thread);
 	cmdq_thread_disable(cmdq, thread);
-	clk_disable(cmdq->clock);
+	clk_bulk_disable(cmdq->gce_num, cmdq->clocks);
 
 out:
 	spin_unlock_irqrestore(&thread->chan->lock, flags);
@@ -518,6 +524,10 @@ static int cmdq_probe(struct platform_device *pdev)
 	struct cmdq *cmdq;
 	int err, i;
 	struct gce_plat *plat_data;
+	struct device_node *phandle = dev->of_node;
+	struct device_node *node;
+	int alias_id = 0;
+	char clk_name[4] = "gce";
 
 	cmdq = devm_kzalloc(dev, sizeof(*cmdq), GFP_KERNEL);
 	if (!cmdq)
@@ -540,6 +550,7 @@ static int cmdq_probe(struct platform_device *pdev)
 
 	cmdq->thread_nr = plat_data->thread_nr;
 	cmdq->shift_pa = plat_data->shift;
+	cmdq->gce_num = plat_data->gce_num;
 	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
 	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
 			       "mtk_cmdq", cmdq);
@@ -551,10 +562,28 @@ static int cmdq_probe(struct platform_device *pdev)
 	dev_dbg(dev, "cmdq device: addr:0x%p, va:0x%p, irq:%d\n",
 		dev, cmdq->base, cmdq->irq);
 
-	cmdq->clock = devm_clk_get(dev, "gce");
-	if (IS_ERR(cmdq->clock)) {
-		dev_err(dev, "failed to get gce clk\n");
-		return PTR_ERR(cmdq->clock);
+	if (cmdq->gce_num > 1) {
+		for_each_child_of_node(phandle->parent, node) {
+			char clk_id[8];
+
+			alias_id = of_alias_get_id(node, clk_name);
+			if (alias_id < cmdq->gce_num) {
+				snprintf(clk_id, sizeof(clk_id), "%s%d", clk_name, alias_id);
+				cmdq->clocks[alias_id].id = clk_id;
+				cmdq->clocks[alias_id].clk = of_clk_get(node, 0);
+				if (IS_ERR(cmdq->clocks[alias_id].clk)) {
+					dev_err(dev, "failed to get gce clk: %d\n", alias_id);
+					return PTR_ERR(cmdq->clocks[alias_id].clk);
+				}
+			}
+		}
+	} else {
+		cmdq->clocks[alias_id].id = clk_name;
+		cmdq->clocks[alias_id].clk = devm_clk_get(&pdev->dev, clk_name);
+		if (IS_ERR(cmdq->clocks[alias_id].clk)) {
+			dev_err(dev, "failed to get gce clk\n");
+			return PTR_ERR(cmdq->clocks[alias_id].clk);
+		}
 	}
 
 	cmdq->mbox.dev = dev;
@@ -590,7 +619,8 @@ static int cmdq_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, cmdq);
-	WARN_ON(clk_prepare(cmdq->clock) < 0);
+
+	WARN_ON(clk_bulk_prepare(cmdq->gce_num, cmdq->clocks));
 
 	cmdq_init(cmdq);
 
@@ -602,15 +632,35 @@ static const struct dev_pm_ops cmdq_pm_ops = {
 	.resume = cmdq_resume,
 };
 
-static const struct gce_plat gce_plat_v2 = {.thread_nr = 16};
-static const struct gce_plat gce_plat_v3 = {.thread_nr = 24};
-static const struct gce_plat gce_plat_v4 = {.thread_nr = 24, .shift = 3};
+static const struct gce_plat gce_plat_v2 = {
+	.thread_nr = 16,
+	.shift = 0,
+	.gce_num = 1
+};
+
+static const struct gce_plat gce_plat_v3 = {
+	.thread_nr = 24,
+	.shift = 0,
+	.gce_num = 1
+};
+
+static const struct gce_plat gce_plat_v4 = {
+	.thread_nr = 24,
+	.shift = 3,
+	.gce_num = 1
+};
+
+static const struct gce_plat gce_plat_v5 = {
+	.thread_nr = 24,
+	.shift = 3,
+	.gce_num = 2
+};
 
 static const struct of_device_id cmdq_of_ids[] = {
 	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_v2},
 	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_v3},
 	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_v4},
-	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_v4},
+	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_v5},
 	{}
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
