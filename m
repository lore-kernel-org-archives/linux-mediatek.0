Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5A5C07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:35:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AEEC613DA
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AEEC613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5fyz7cjQXshAg3W80wL0eKVPCxtCAb/GWqWxBGm0yXI=; b=Bs75eSZrvW26RA
	KoNJGCucr3mkcmM2cDqYmz516uCCGbBQDxfBwoIzk4YqTaS7XNixxNHSqo9Yv9+g5QSeiosqZyoQq
	pSXIMHWrzEde9j4vOqfH3lHFfz/t4dFVMM7sAtLVZL7VqpxVuiLfUTmio+ui3lm4PHxQy0WCMgYGu
	xe6PQGi5zSUEPvQmXsYlCsbZsdxp1EiH8aExge93ZIOCHHYvzmHZwMlXsTp/GMU9jYI0Y0K1w7L2O
	73ek0AKdgoZJwFY7YHb55CbmqgBynP5uDrOzm62wXJSRkehObbUylPm8o0bmryzdyIFe1MY+IQVvA
	2DSpdMUqek1JecQADBng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0HG6-007rRc-So; Mon, 05 Jul 2021 05:35:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0HFq-007rGE-5H; Mon, 05 Jul 2021 05:34:51 +0000
X-UUID: 2ffde0f413084dcb9ed22e30691c041a-20210704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tLhMFabsg1wNZGPx55v/1YPXcERLtDkOAU7YUGC2vro=; 
 b=ZHeXzGTkcQRofYwf6+NA66yh8QViK+z1oguAuOAVi8PG4CnLnVoUPUxhOasmV+7rAaeuF+y1JsYOXSZV+UBpuRA5KKbw0D5jzlZVWzgnpT0sZ1tiyjaRqZ2Nx4bE4X2kUx9OEizIwyor2GMnp63ipG3zqbmP7bv46+3dnRIzu4o=;
X-UUID: 2ffde0f413084dcb9ed22e30691c041a-20210704
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 30145811; Sun, 04 Jul 2021 22:34:43 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 4 Jul 2021 22:34:42 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 13:34:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 5 Jul 2021 13:34:40 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v2 5/5] mailbox: cmdq: fix GCE can not receive hardward event
Date: Mon, 5 Jul 2021 13:34:29 +0800
Message-ID: <20210705053429.4380-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210705053429.4380-1-jason-jh.lin@mediatek.com>
References: <20210705053429.4380-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_223450_241575_867B5AE8 
X-CRM114-Status: GOOD (  19.65  )
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
 drivers/mailbox/mtk-cmdq-mailbox.c | 102 +++++++++++++++++++++++------
 1 file changed, 83 insertions(+), 19 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index fc67888a677c..44a3cf252fd5 100644
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
+	struct clk		*clock[CMDQ_GCE_NUM_MAX];
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
@@ -120,11 +123,15 @@ static void cmdq_init(struct cmdq *cmdq)
 {
 	int i;
 
-	WARN_ON(clk_enable(cmdq->clock) < 0);
+	for (i = 0; i < cmdq->gce_num; i++)
+		WARN_ON(clk_enable(cmdq->clock[i]) < 0);
+
 	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
 	for (i = 0; i <= CMDQ_MAX_EVENT; i++)
 		writel(i, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
-	clk_disable(cmdq->clock);
+
+	for (i = 0; i < cmdq->gce_num; i++)
+		clk_disable(cmdq->clock[i]);
 }
 
 static int cmdq_thread_reset(struct cmdq *cmdq, struct cmdq_thread *thread)
@@ -257,8 +264,12 @@ static void cmdq_thread_irq_handler(struct cmdq *cmdq,
 	}
 
 	if (list_empty(&thread->task_busy_list)) {
+		int i;
+
 		cmdq_thread_disable(cmdq, thread);
-		clk_disable(cmdq->clock);
+
+		for (i = 0; i < cmdq->gce_num; i++)
+			clk_disable(cmdq->clock[i]);
 	}
 }
 
@@ -303,7 +314,8 @@ static int cmdq_suspend(struct device *dev)
 	if (task_running)
 		dev_warn(dev, "exist running task(s) in suspend\n");
 
-	clk_unprepare(cmdq->clock);
+	for (i = 0; i < cmdq->gce_num; i++)
+		clk_unprepare(cmdq->clock[i]);
 
 	return 0;
 }
@@ -311,8 +323,11 @@ static int cmdq_suspend(struct device *dev)
 static int cmdq_resume(struct device *dev)
 {
 	struct cmdq *cmdq = dev_get_drvdata(dev);
+	int i;
+
+	for (i = 0; i < cmdq->gce_num; i++)
+		WARN_ON(clk_prepare(cmdq->clock[i]) < 0);
 
-	WARN_ON(clk_prepare(cmdq->clock) < 0);
 	cmdq->suspended = false;
 	return 0;
 }
@@ -320,8 +335,10 @@ static int cmdq_resume(struct device *dev)
 static int cmdq_remove(struct platform_device *pdev)
 {
 	struct cmdq *cmdq = platform_get_drvdata(pdev);
+	int i;
 
-	clk_unprepare(cmdq->clock);
+	for (i = 0; i < cmdq->gce_num; i++)
+		clk_unprepare(cmdq->clock[i]);
 
 	return 0;
 }
@@ -348,7 +365,11 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	task->pkt = pkt;
 
 	if (list_empty(&thread->task_busy_list)) {
-		WARN_ON(clk_enable(cmdq->clock) < 0);
+		int i;
+
+		for (i = 0; i < cmdq->gce_num; i++)
+			WARN_ON(clk_enable(cmdq->clock[i]) < 0);
+
 		/*
 		 * The thread reset will clear thread related register to 0,
 		 * including pc, end, priority, irq, suspend and enable. Thus
@@ -401,6 +422,7 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
 	struct cmdq_task *task, *tmp;
 	unsigned long flags;
+	int i;
 
 	spin_lock_irqsave(&thread->chan->lock, flags);
 	if (list_empty(&thread->task_busy_list))
@@ -420,7 +442,9 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 	}
 
 	cmdq_thread_disable(cmdq, thread);
-	clk_disable(cmdq->clock);
+
+	for (i = 0; i < cmdq->gce_num; i++)
+		clk_disable(cmdq->clock[i]);
 done:
 	/*
 	 * The thread->task_busy_list empty means thread already disable. The
@@ -440,6 +464,7 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 	struct cmdq_task *task, *tmp;
 	unsigned long flags;
 	u32 enable;
+	int i;
 
 	spin_lock_irqsave(&thread->chan->lock, flags);
 	if (list_empty(&thread->task_busy_list))
@@ -463,7 +488,9 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 
 	cmdq_thread_resume(thread);
 	cmdq_thread_disable(cmdq, thread);
-	clk_disable(cmdq->clock);
+
+	for (i = 0; i < cmdq->gce_num; i++)
+		clk_disable(cmdq->clock[i]);
 
 out:
 	spin_unlock_irqrestore(&thread->chan->lock, flags);
@@ -512,6 +539,9 @@ static int cmdq_probe(struct platform_device *pdev)
 	struct cmdq *cmdq;
 	int err, i;
 	struct gce_plat *plat_data;
+	struct device_node *phandle = dev->of_node;
+	struct device_node *node;
+	int alias_id = 0;
 
 	cmdq = devm_kzalloc(dev, sizeof(*cmdq), GFP_KERNEL);
 	if (!cmdq)
@@ -536,6 +566,7 @@ static int cmdq_probe(struct platform_device *pdev)
 
 	cmdq->thread_nr = plat_data->thread_nr;
 	cmdq->shift_pa = plat_data->shift;
+	cmdq->gce_num = plat_data->gce_num;
 	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
 	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
 			       "mtk_cmdq", cmdq);
@@ -547,10 +578,24 @@ static int cmdq_probe(struct platform_device *pdev)
 	dev_dbg(dev, "cmdq device: addr:0x%p, va:0x%p, irq:%d\n",
 		dev, cmdq->base, cmdq->irq);
 
-	cmdq->clock = devm_clk_get(dev, "gce");
-	if (IS_ERR(cmdq->clock)) {
-		dev_err(dev, "failed to get gce clk\n");
-		return PTR_ERR(cmdq->clock);
+	if (cmdq->gce_num > 1) {
+		for_each_child_of_node(phandle->parent, node) {
+			alias_id = of_alias_get_id(node, "gce");
+			if (alias_id < cmdq->gce_num) {
+				cmdq->clock[alias_id] = of_clk_get(node, 0);
+				if (IS_ERR(cmdq->clock[alias_id])) {
+					dev_err(dev, "failed to get gce clk: %d\n",
+						alias_id);
+					return PTR_ERR(cmdq->clock[alias_id]);
+				}
+			}
+		}
+	} else {
+		cmdq->clock[alias_id] = devm_clk_get(&pdev->dev, "gce");
+		if (IS_ERR(cmdq->clock[alias_id])) {
+			dev_err(dev, "failed to get gce clk\n");
+			return PTR_ERR(cmdq->clock[alias_id]);
+		}
 	}
 
 	cmdq->mbox.dev = dev;
@@ -586,7 +631,9 @@ static int cmdq_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, cmdq);
-	WARN_ON(clk_prepare(cmdq->clock) < 0);
+
+	for (i = 0; i < cmdq->gce_num; i++)
+		WARN_ON(clk_prepare(cmdq->clock[i]) < 0);
 
 	cmdq_init(cmdq);
 
@@ -598,15 +645,32 @@ static const struct dev_pm_ops cmdq_pm_ops = {
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
+static const struct gce_plat gce_plat_v3 = {
+	.thread_nr = 24,
+	.shift = 0,
+	.gce_num = 1
+};
+static const struct gce_plat gce_plat_v4 = {
+	.thread_nr = 24,
+	.shift = 3,
+	.gce_num = 1
+};
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
