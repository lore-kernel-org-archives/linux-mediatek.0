Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D3AC11F6A
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 05:19:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95F046127C
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 05:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95F046127C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvq9YV2Cz6D70GEgUGGQBCPwBUjhe38ss2zYouBGuBo=; b=q5rEJQ2qPyLWqo
	PChJwZG9x9G7ug8UhOJzFRz0FANYS6TVoUtFZ6c4oC+VXZWVkoUo/5kDaQNM6I2L9+dL+M8Fgbty8
	nOl+tQ+slVffUaDkeb4j4o8zz+6f+o/sbIeoDZjbXUDc7SGTu5HOhVPY5RczfP9/7wTJ0+trIszWp
	Ikkb/fbJsKEwlXyEjz+TwLhIdQ0BR9INXQIQpBFCqHx2fLpsgVoOncmtkWwJa+vpBWn75rzC1eGQJ
	kXO6c/dHSwTf8ZrCqIGA1lozR3btxMJPdbYxQGAbW0NYxu3Lx893YCGzG4H2gVGDSk5Bd2v1ABvJ3
	S0NIBXlB5OF3vc4ZD5gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyScq-00Co0l-Uq; Wed, 30 Jun 2021 05:19:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lySc4-00Cnl0-W2; Wed, 30 Jun 2021 05:18:18 +0000
X-UUID: 29b628fd01404c0985416d504f25d60b-20210629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HFbOhqCx+ie16wU7Exa21NwwXMcFZEL77ORlV6VJnRA=; 
 b=G+ttxztuEkt9Hx9m+Im2RhiJlm5OypUYGV4DdKm+/5rPE5ZQtg7BO+K2tdJ3tifGybkRFH28/2xl2rKI2u8dQMUlFt00QoXmxPTn9jlYyMm1BSd5uJKGSKCeM+n9DFxSWeyD5woSN/zv79ygrQ4CIy1M5R8VXxK0fJUdgeitA+s=;
X-UUID: 29b628fd01404c0985416d504f25d60b-20210629
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 939744659; Tue, 29 Jun 2021 22:18:10 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 22:18:08 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 13:18:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 30 Jun 2021 13:18:06 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v1 5/5] mailbox: cmdq: fix HW event can not be triggered issue
Date: Wed, 30 Jun 2021 13:14:18 +0800
Message-ID: <20210630051418.14044-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210630051418.14044-1-jason-jh.lin@mediatek.com>
References: <20210630051418.14044-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_221817_077607_13933AB7 
X-CRM114-Status: GOOD (  18.52  )
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

HW event can only be triggered while all gce clocks are enabled.
So each mailbox sholud contorl all gce clocks at the same time.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 87 +++++++++++++++++++++++-------
 1 file changed, 68 insertions(+), 19 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index fc67888a677c..b531a26e5091 100644
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
+		clk_disable(cmdq->clock[i]);
 
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
@@ -536,6 +563,7 @@ static int cmdq_probe(struct platform_device *pdev)
 
 	cmdq->thread_nr = plat_data->thread_nr;
 	cmdq->shift_pa = plat_data->shift;
+	cmdq->gce_num = plat_data->gce_num;
 	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
 	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,
 			       "mtk_cmdq", cmdq);
@@ -547,10 +575,20 @@ static int cmdq_probe(struct platform_device *pdev)
 	dev_dbg(dev, "cmdq device: addr:0x%p, va:0x%p, irq:%d\n",
 		dev, cmdq->base, cmdq->irq);
 
-	cmdq->clock = devm_clk_get(dev, "gce");
-	if (IS_ERR(cmdq->clock)) {
-		dev_err(dev, "failed to get gce clk\n");
-		return PTR_ERR(cmdq->clock);
+	for (i = 0; i < cmdq->gce_num; i++) {
+		char gce_clk_name[8] = "gce";
+
+		if (i > 0)
+			snprintf(gce_clk_name, 8, "gce%d", i);
+
+		cmdq->clock[i] = devm_clk_get(dev, gce_clk_name);
+		if (IS_ERR(cmdq->clock[i])) {
+			dev_err(dev, "failed to get gce clk: %s\n",
+					gce_clk_name);
+			return PTR_ERR(cmdq->clock[i]);
+		}
+
+		dev_dbg(dev, "gce_clk_name:%s", gce_clk_name);
 	}
 
 	cmdq->mbox.dev = dev;
@@ -586,7 +624,9 @@ static int cmdq_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, cmdq);
-	WARN_ON(clk_prepare(cmdq->clock) < 0);
+
+	for (i = 0; i < cmdq->gce_num; i++)
+		WARN_ON(clk_prepare(cmdq->clock[i]) < 0);
 
 	cmdq_init(cmdq);
 
@@ -598,15 +638,24 @@ static const struct dev_pm_ops cmdq_pm_ops = {
 	.resume = cmdq_resume,
 };
 
-static const struct gce_plat gce_plat_v2 = {.thread_nr = 16};
-static const struct gce_plat gce_plat_v3 = {.thread_nr = 24};
-static const struct gce_plat gce_plat_v4 = {.thread_nr = 24, .shift = 3};
+static const struct gce_plat gce_plat_v2 = {
+	.thread_nr = 16, .shift = 0, .gce_num = 1
+};
+static const struct gce_plat gce_plat_v3 = {
+	.thread_nr = 24, .shift = 0, .gce_num = 1
+};
+static const struct gce_plat gce_plat_v4 = {
+	.thread_nr = 24, .shift = 3, .gce_num = 1
+};
+static const struct gce_plat gce_plat_v5 = {
+	.thread_nr = 24, .shift = 3, .gce_num = 2
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
